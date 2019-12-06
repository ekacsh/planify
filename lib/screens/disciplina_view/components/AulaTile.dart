import 'package:flutter/material.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/utils/day_of_week.dart';

class AulaTile extends StatelessWidget {
  final Aula _aula;

  AulaTile(this._aula);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.access_time),
              Container(
                margin: EdgeInsets.only(right: 4),
              ),
              Text(
                  "${weekDays[_aula.diaSemana]}: ${_aula.horarioInicio} - ${_aula.horarioFim}")
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              Container(
                margin: EdgeInsets.only(right: 4),
              ),
              Text(_aula.local)
            ],
          ),
        ],
      ),
    );
  }
}
