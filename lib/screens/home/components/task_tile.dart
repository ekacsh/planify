import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planify/models/tarefa.dart';

class TaskTile extends StatelessWidget {
  final Tarefa _task;

  TaskTile(this._task);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
      color: Color(_task.cor),
      padding: EdgeInsets.all(8),
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _task.titulo,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(_task.disciplinaNome),
          Text("${DateFormat('dd/MM - HH:mm').format(_task.data)}"),
        ],
      ),
    );
  }
}
