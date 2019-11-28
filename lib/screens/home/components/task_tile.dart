import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planify/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task _task;

  TaskTile(this._task);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
      color: Color(_task.color),
      padding: EdgeInsets.all(8),
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _task.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(_task.subject),
          Text("${DateFormat('dd/MM - HH:mm').format(_task.date)}"),
        ],
      ),
    );
  }
}
