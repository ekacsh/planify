import 'package:flutter/material.dart';
import 'package:planify/models/disciplina.dart';

class AnotacaoTile extends StatelessWidget {
  final Anotacao _anotacao;

  AnotacaoTile(this._anotacao);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.grey[400]),
      child: Text(_anotacao.texto),
    );
  }
}
