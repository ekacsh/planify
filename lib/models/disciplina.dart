import 'package:mongo_dart/mongo_dart.dart';

class Disciplina {
  ObjectId id;
  Periodo periodo;
  String semestre;
  String titulo;
  String docente;
  List<Aula> aulas;
  int faltas;

  Disciplina.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    periodo = Periodo.fromMap(map["periodo"]);
    titulo = map["titulo"];
    docente = map["docente"];
    aulas = map["aulas"].map<Aula>((aula) => Aula.fromMap(aula)).toList();
    faltas = map["faltas"].floor();
  }
}

class Periodo {
  int ano;
  int semestre;

  Periodo.fromMap(Map<String, dynamic> map) {
    ano = map["ano"].floor();
    semestre = map["semestre"].floor();
  }

  @override
  String toString() {
    return "$ano/$semestre";
  }
}

class Aula {
  int diaSemana;
  Horario horarioInicio;
  Horario horarioFim;
  String local;

  Aula.fromMap(Map<String, dynamic> map) {
    diaSemana = map["diaSemana"].floor();
    horarioInicio = Horario(map["horarioInicio"]["hora"].floor(),
        map["horarioInicio"]["minuto"].floor());
    horarioFim = Horario(
        map["horarioFim"]["hora"].floor(), map["horarioFim"]["minuto"].floor());
    local = map["local"];
  }
}

class Horario {
  int hora;
  int minuto;

  Horario(this.hora, this.minuto);

  @override
  String toString() {
    return "${hora.toString().padLeft(2, '0')}:${minuto.toString().padLeft(2, '0')}";
  }
}

class Anotacao {
  ObjectId id;
  ObjectId disciplinaId;
  DateTime data;
  String texto;

  Anotacao(this.disciplinaId, this.texto) {
    data = DateTime.now();
  }

  Anotacao.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    disciplinaId = map["disciplinaId"];
    data = DateTime.parse(map["data"]);
    texto = map["text"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "disciplinaId": disciplinaId,
      "data": data.toString(),
      "text": texto
    };
    if (id != null) map["_id"] = id;
    return map;
  }
}
