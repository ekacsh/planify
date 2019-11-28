import 'package:flutter/material.dart';

class GradeTab extends StatefulWidget {
  @override
  _GradeTabState createState() => _GradeTabState();
}

class _GradeTabState extends State<GradeTab> {
  List<Tab> _tabs = [
    Tab(text: "Seg"),
    Tab(text: "Ter"),
    Tab(text: "Qua"),
    Tab(text: "Qui"),
    Tab(text: "Sex"),
    Tab(text: "Sab"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Planify"),
            centerTitle: true,
            bottom: TabBar(
              tabs: _tabs,
            ),
          ),
          body: Container(),
        ));
  }
}
