import 'package:flutter/material.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/screens/disciplina_view/disciplina_view.dart';

class DisciplinaTile extends StatelessWidget {
  final Disciplina _disciplina;

  DisciplinaTile(this._disciplina);

  @override
  Widget build(BuildContext context) {
    print(_disciplina);
    return InkWell(
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _disciplina.titulo,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_disciplina.docente),
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisciplinaView(_disciplina)));
      },
    );
  }
}
