import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planify/bloc/anotacao_bloc.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/screens/disciplina_view/components/AnotacaoTile.dart';

import 'components/AulaTile.dart';

class DisciplinaView extends StatelessWidget {
  final Disciplina _disciplina;

  DisciplinaView(this._disciplina) {
    BlocProvider.getBloc<AnotacaoBloc>().inSearch.add(_disciplina.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_disciplina.titulo),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _disciplina.periodo.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                ),
                Text(
                  _disciplina.titulo,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  _disciplina.docente,
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (_disciplina.faltas > 0) {
                          _disciplina.faltas--;
                        }
                      },
                    ),
                    Text(
                      "${_disciplina.faltas} falta${_disciplina.faltas > 1
                          ? 's'
                          : ''}",
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _disciplina.faltas++;
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 16),
                  child: Text(
                    "Aulas",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _disciplina.aulas.length,
                    itemBuilder: (context, index) {
                      return AulaTile(_disciplina.aulas[index]);
                    }),
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 16),
                  child: Text(
                    "Anotações",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder(
                  stream: BlocProvider.getBloc<AnotacaoBloc>().outAnotacoes,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return AnotacaoTile(snapshot.data[index]);
                      },
                    );
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add_circle_outline),
                      Text("Nova anotação")
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          final _controller = TextEditingController();
                          return AlertDialog(
                            title: Text("Nova Anotação"),
                            content: TextFormField(
                              controller: _controller,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              maxLines: 5,
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "Cancelar",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              FlatButton(
                                child: Text(
                                  "Salvar",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onPressed: () {
                                  BlocProvider.getBloc<AnotacaoBloc>()
                                      .inSave
                                      .add(Anotacao(
                                          _disciplina.id, _controller.text));
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
//                    BlocProvider.getBloc<AnotacaoBloc>()
//                        .inSave
//                        .add(Anotacao.fromMap(
//                          {
//                            "_id": 1,
//                            "disciplinaId": 2,
//                            "text": "Anotacao 2",
//                            "data": DateTime.now(),
//                          },
//                        ));
                  },
                )
              ])),
    );
  }
}
