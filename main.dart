import 'package:flutter/material.dart';


//pages
import './courses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 2 Session 2',
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
      home: const MyHomePage(title: 'My Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
          actions: <Widget>[
            PopupOptionMenu()
          ]
      ),
      //
      drawer:  Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Stanley'),
              accountEmail: Text('s.k@alustudent.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
              ),
            ),
            ListTile(
              title:const Text('Courses'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Courses()),);
              },
            ),

            ListTile(
              title:const Text('Groups'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Courses()),);
              },
            ),
            ListTile(
              title:const Text('Calendar'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Courses()),);
              },
            ),
            ListTile(
              title:const Text('Inbox'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Courses()),);
              },
            ),
            ListTile(
              title:const Text('History'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Courses()),);
              },
            ),
            ListTile(
              title:const Text('Help'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Courses()),);
              },
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        //margin adds space around the container
        margin: const EdgeInsets.all(30),
        color: Colors.grey[400],
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: 200, maxWidth: 400, minHeight: 200, maxHeight: 400),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
                child: RotatedBox(
                  quarterTurns: 1, // 90 degrees clockwise
                  child: Text('ALU'),
                ),
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          print('Pressed');
        },
        icon: Icon(Icons.message),
        label: Text('Message'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PopupOptionMenu extends StatefulWidget {
  const PopupOptionMenu({Key? key}) : super(key: key);

  @override
  State<PopupOptionMenu> createState() => _PopupOptionMenuState();
}
// ignore: constant_identifier_names
enum MenuOption{Notification,Recent_activity,Settings}

class _PopupOptionMenuState extends State<PopupOptionMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
        itemBuilder:(BuildContext context) {
          return <PopupMenuEntry<MenuOption>>[
            const PopupMenuItem(
              //child: Text('Notification'),
              value:MenuOption.Notification,
              //child: Text('Notification'),
              child: Icon(Icons.notifications,color: Colors.blue,size: 28.0,),
            ),
            const PopupMenuItem(
              //child: Text('New window'),
              value:MenuOption.Recent_activity,
              //child: Text('New window'),
              child: Icon(Icons.local_activity,color: Colors.blue,size: 28.0,),
            ),
            const PopupMenuItem(
              //child: Text('Settings'),
              value:MenuOption.Settings,
              //child: Text('Settings'),
              child: Icon(Icons.settings,color: Colors.blue,size: 28.0,),
            )
          ];
        }
    );
  }
}