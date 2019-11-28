import 'package:flutter/material.dart';
import 'package:planify/screens/home/tabs/calendar_tab.dart';
import 'package:planify/screens/home/tabs/grade_tab.dart';
import 'package:planify/screens/home/tabs/home_tab.dart';
import 'package:planify/screens/home/tabs/subjects_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    SubjectsTab(),
    CalendarTab(),
    GradeTab()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
//        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            title: Text("Disciplinas"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today),
            title: Text("Calendário"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.table_chart),
            title: Text("Grade"),
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
    );
  }
}
