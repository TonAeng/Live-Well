import 'package:flutter/material.dart';
import 'query/name.dart';
import 'Login/SplashScreen.dart';
import 'Login/OTPpage.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'This is Food Tab',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'This is Home Tab',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'This is Fitness Tab',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
          ),
        ],
      ),
    );
  }
}
