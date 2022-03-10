import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isShow = true;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _isShow = !_isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverStickyHeader(
          //   header: Container(
          //     height: 60.0,
          //     color: Colors.lightBlue,
          //     padding: EdgeInsets.symmetric(horizontal: 16.0),
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       'Header #0',
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //   ),
          //   sliver: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //           (context, i) => ListTile(
          //         leading: CircleAvatar(
          //           child: Text('0'),
          //         ),
          //         title: Text('List tile #$i'),
          //       ),
          //       childCount: 4,
          //     ),
          //   ),
          // )
          SliverStickyHeader(
            header: Container(
              height: 100,
              color: Colors.red,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                     !_isShow && index == 1 ? Container() : Container(height: 1000, color: buildGreen(index)),
                  childCount: 2),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Color buildGreen(int i) => i != 0 ? Colors.green : Colors.black;
}
