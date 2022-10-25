import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Government Elections 2020',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LGE KP 2020'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var img = new Image(image: new AssetImage('assets/images/011.png'), fit: BoxFit.cover);
    return Scaffold(
      //appBar: AppBar(
      //  title: Text(widget.title),
      //),
      body: Container(
        color: Colors.cyanAccent,
        child: Column(

          children: <Widget>[
            Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Container(child:  row1(),)
            ),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(child:  row2(),)
            ),
            Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(child:  row3(),)
            ),


          ]
        ),
      ),
    );
  }

  Widget row1()
  {
    return Row(

      children: <Widget>[
        Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: RaisedButton(
                onPressed: () {},
                splashColor: Colors.black,

                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Text('Districts',
                      style: TextStyle(fontFamily: 'dancingscript', fontSize: 30.0)),
                  color: Colors.cyan,
                )
              ,
            ),


        ),
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: GestureDetector(
                  child:         Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    child: Text('Teshils',
                        style: TextStyle(fontFamily: 'mashan', fontSize: 30.0)),
                    color: Colors.red,
                  )
              ,
                  ),
        ),

      ],
    );
  }
//================= ROW-2
  Widget row2()
  {
    return Row(

      children: <Widget>[
        Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Text('Wards',
                  style: TextStyle(fontFamily: 'rightous', fontSize: 30.0)),
              color: Colors.indigo,
            )
        ),

      ],
    );
  }

  //============== ROW-3
  Widget row3()
  {
    return Row(

      children: <Widget>[
        Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Text('Councils',
                  style: TextStyle(fontFamily: 'shadowintolight', fontSize: 30.0)),
              color: Colors.amberAccent,
            )
        ),
        Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Text('ROs',
                  style: TextStyle(fontFamily: 'dancingscript', fontSize: 35.0)),
              color: Colors.red,
            )
        ),

      ],
    );
  }

}
