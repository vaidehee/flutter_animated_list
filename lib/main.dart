import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(itemBuilder: (BuildContext context, int index)
                {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                          child: ScaleAnimation(
                            child: Container(
                              margin: EdgeInsets.only(right: 10.0,left: 10.0),
                              child: Card(
                                    elevation: 10.0,
                                  child: Container(
                                      height: 50.0,
                                      width: 50.0,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10.0),
                                      child: Text("Item ${(index+1).toString()}"))),
                            ),
                          )));
                }, separatorBuilder: (context,index)
                {
                  return SizedBox(height: 10.0,);
                }, itemCount: 10),
          )
        ],
      ),
    );
  }
}
