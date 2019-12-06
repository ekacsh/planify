import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planify/bloc/task_bloc.dart';
import 'package:planify/screens/home/components/task_tile.dart';

class HomeTab extends StatelessWidget {
  HomeTab() {
    BlocProvider
        .getBloc<TaskBloc>()
        .inSearch
        .add(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Planify"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Próximas tarefas",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                      height: 120,
                      child: StreamBuilder(
                          stream: BlocProvider
                              .getBloc<TaskBloc>()
                              .outTasks,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return TaskTile(snapshot.data[index]);
                                },
                              );
                            }
                            return Container();
                          })),
                ])));
  }
}
