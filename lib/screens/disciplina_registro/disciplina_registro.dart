import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planify/bloc/subject_bloc.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/screens/disciplina_view/components/AulaTile.dart';

class DisciplinaRegistro extends StatefulWidget {

  @override
  _DisciplinaRegistroState createState() => _DisciplinaRegistroState();
}

class _DisciplinaRegistroState extends State<DisciplinaRegistro> {

  Disciplina _editedDisciplina = Disciplina();

  final _tituloController = TextEditingController();
  final _docentecontroller = TextEditingController();

  String local_temp;
  DateTime horario_temp;

  List<Aula> aulas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planify - Registrar Disciplina"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        children: <Widget>[
          TextFormField(
            controller: _tituloController,
            decoration: InputDecoration(
              labelText: "Disciplina",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black87),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black87, width: 2),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _docentecontroller,
            decoration: InputDecoration(
              labelText: "Docente",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black87),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.black87, width: 2),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text("Aulas",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ListView.builder(
            padding: EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: aulas.length,
            itemBuilder: (context, index) => AulaTile(aulas[index]),
          ),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            onTap: () {
              setState(() {
                aulas.add(Aula(local: "AT-9",
                    horarioInicio: Horario(8, 0),
                    horarioFim: Horario(10, 0),
                    diaSemana: 1));
              });
//              return showDialog(
//              context: context,
//              builder: (context) {
//                final _localController = TextEditingController();
//                return AlertDialog(
//                title: Text("Adicionar horário"),
//                content: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    TextFormField(
//                      controller: _localController,
//                      decoration: InputDecoration(
//                        labelText: "Local",
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(
//                            Radius.circular(8),
//                          ),
//                          borderSide: BorderSide(color: Colors.black87),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(
//                            Radius.circular(8),
//                          ),
//                          borderSide:
//                              BorderSide(color: Colors.black87, width: 2),
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      height: 8,
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Text("Início"),
//                        Container(
//                          margin: EdgeInsets.only(left: 8, right: 8),
//                          width: 70,
//                        child:TextFormField(keyboardType: TextInputType.number,),
//                        ),
//                        Container(
//                          margin: EdgeInsets.only(left: 8, right: 8),
//                          width: 70,
//                          child:TextFormField(keyboardType: TextInputType.number,),
//                        ),
////                        TextFormField(keyboardType: TextInputType.number,),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Text("Fim"),
//                        Container(
//                          margin: EdgeInsets.only(left: 8, right: 8),
//                          width: 70,
//                          child:TextFormField(keyboardType: TextInputType.number,),
//                        ),
//                        Container(
//                          margin: EdgeInsets.only(left: 8, right: 8),
//                          width: 70,
//                          child:TextFormField(keyboardType: TextInputType.number,),
//                        ),
////                        TextFormField(keyboardType: TextInputType.number,),
//                      ],
//                    ),
////                    Row(
////                      children: <Widget>[
////                        Text("Fim"),
////                        TextFormField(keyboardType: TextInputType.number,),
////                        TextFormField(keyboardType: TextInputType.number,),
////                      ],
////                    )
//                  ],
//                ),
//                actions: <Widget>[
//                  FlatButton(
//                    child: Text("Adicionar"),
//                    onPressed: () {
//                      setState(() {
//                        _editedDisciplina.aulas.add(
//                          Aula(
//                            diaSemana: 1,
//                            local: _localController.text,
//                            horarioInicio: Horario(8, 0),
//                            horarioFim: Horario(10, 0),
//                          ),
//                        );
//                      });
//                      Navigator.pop(context);
//                    },
//                  )
//                ],
//              );
//              },
//            );
            },

            child: Row(
              children: <Widget>[
                Icon(Icons.add_circle_outline),
                SizedBox(
                  width: 8,
                ),
                Text("Adicionar Horário"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),

        onPressed: () async {
          Disciplina d = Disciplina(
            aulas: aulas,
            titulo: _tituloController.text,
            docente: _docentecontroller.text,
            periodo: Periodo(2019, 2),
            faltas: 0,
          );
          BlocProvider
              .getBloc<DisciplinaBloc>()
              .inSave
              .add(d);
          Navigator.pop(context);
        },
      ),
    );
  }
}
