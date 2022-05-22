import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imageclassify/Feed.dart';
import 'package:imageclassify/Menu.dart';
import 'package:imageclassify/Channel.dart';
import 'package:imageclassify/Home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin{


  late TabController _controller;


  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       bottomNavigationBar:Container(
         margin: EdgeInsets.all(20),
         decoration: BoxDecoration(
           color: Colors.redAccent,
           borderRadius: BorderRadius.circular(10),
         ),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(20),
               child: DefaultTabController(
                 length: 3,
                 child : TabBar(
                   controller: _controller,
                   unselectedLabelColor: Colors.black,
                   tabs: [
                     Tab(
                       icon: Icon(Icons.home_outlined),
                       text: "Home",
                     ),
                     Tab(
                       icon: Icon(Icons.feedback_outlined),
                       text: "Feed",
                     ),
                     Tab(
                       icon: Icon(Icons.contacts_outlined),
                       text: "Channel",
                     ),
                   ],
                 ),
               )
           )
       ),
      body: TabBarView(
        children: [
          Menu(),
          Feed(),
          Channel()
        ],
      controller: _controller,
    ),
    );
  }
}
