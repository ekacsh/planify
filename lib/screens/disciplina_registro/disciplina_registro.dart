import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisciplinaRegistro extends StatefulWidget {
  @override
  _DisciplinaRegistroState createState() => _DisciplinaRegistroState();
}

class _DisciplinaRegistroState extends State<DisciplinaRegistro> {
  String nome;
  String professor;
  String local_temp;
  DateTime horario_temp;
  List<String> locais = [];
  List<DateTime> horarios = [];

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
                    MaterialButton(
                      child: Text("Adicionar horário"),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(Duration(hours: 12)),
                          lastDate: DateTime.now().add(Duration(hours: 12)),
                          builder: (context, widget) => CupertinoDatePicker(
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.time,
                            onDateTimeChanged: (hour) {
                              setState(() {
                                this.horario_temp = hour;
                              });
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Adicionar"),
                    onPressed: () {
                      setState(() {
                        horarios.add(horario_temp);
                        locais.add(local_temp);
                      });
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
        ],
      ),
    );
  }
}
