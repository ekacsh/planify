import 'package:flutter/material.dart';
import 'package:planify/screens/home/home_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Color(0xffff1744), accentColor: Colors.white),
      home: HomeScreen(),
    ));
