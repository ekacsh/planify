import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/screens/disciplina_view/components/AulaTile.dart';
import 'package:planify/services/api_helper.dart';

class DisciplinaRegistro extends StatefulWidget {
  @override
  _DisciplinaRegistroState createState() => _DisciplinaRegistroState();
}

class _DisciplinaRegistroState extends State<DisciplinaRegistro> {
  String nome;
  String professor;
  int hora = 10;
  String local_temp;
  DateTime horario_temp;

  List<Aula> aulas = [];

  ApiHelper api = ApiHelper();

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
          TextField(
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
            onChanged: (text) {
              setState(() {
                this.nome = text;
              });
            },
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Professor",
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
            onChanged: (text) {
              setState(() {
                this.professor = text;
              });
            },
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Adicionar horário"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Local",
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
                          borderSide:
                              BorderSide(color: Colors.black87, width: 2),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          this.local_temp = text;
                        });
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Hora inicio"),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            setState(() {
                              hora--;
                            });
                          },
                        ),
                        Text("${hora.toString().padLeft(2, '0')}:00 h"),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            setState(() {
                              hora++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Adicionar"),
                    onPressed: () {
                      setState(() {
                        aulas.add(
                          Aula(
                            diaSemana: 1,
                            local: local_temp,
                            horarioInicio: Horario(hora, 0),
                            horarioFim: Horario(hora + 2, 0),
                          ),
                        );
                      });
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
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
          SizedBox(
            height: 16,
          ),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: aulas.length,
            itemBuilder: (context, index) => AulaTile(aulas[index]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () async {
          await api.saveDisciplina(
            Disciplina(
              aulas: aulas,
              titulo: nome,
              periodo: Periodo(2019, 2),
              faltas: 0,
            ),
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}
