import 'package:mongo_dart/mongo_dart.dart';

class Tarefa {
  ObjectId id;
  ObjectId disciplinaId;
  String disciplinaNome;
  String titulo;
  DateTime data;
  int cor;

  Tarefa.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    disciplinaId = map["disciplinaId"];
    disciplinaNome = map["disciplinaNome"];
    titulo = map["titulo"];
    data = DateTime.parse(map["data"]);
    cor = int.parse(map["cor"]);
  }
}
