import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:planify/bloc/subject_bloc.dart';
import 'package:planify/screens/home/components/disciplina_tile.dart';


class SubjectsTab extends StatelessWidget {

  SubjectsTab() {
    BlocProvider
        .getBloc<DisciplinaBloc>()
        .inSearch
        .add(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planify"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Theme
            .of(context)
            .primaryColor,

        onPressed: () {

        },
      ),
      body: StreamBuilder(
        stream: BlocProvider
            .getBloc<DisciplinaBloc>()
            .outDisciplinas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return Container(color: Colors.grey, height: 1,);
                },
                padding: EdgeInsets.all(16),
                itemCount: snapshot.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == snapshot.data.length) return Container();
                  return DisciplinaTile(snapshot.data[index]);
                });
          }
          return Container();
        },
      ),
    );
  }
}
