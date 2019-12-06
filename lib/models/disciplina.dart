import 'package:mongo_dart/mongo_dart.dart';

class Disciplina {
  ObjectId id;
  Periodo periodo;
  String titulo;
  String docente;
  List<Aula> aulas;
  int faltas;

  Disciplina(
      {this.id,
      this.periodo,
      this.titulo,
      this.docente,
      this.aulas,
      this.faltas});

  Disciplina.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    periodo = Periodo.fromMap(map["periodo"]);
    titulo = map["titulo"];
    docente = map["docente"];
    aulas = map["aulas"].map<Aula>((aula) => Aula.fromMap(aula)).toList();
    faltas = map["faltas"].floor();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "periodo": periodo.toMap(),
      "docente": docente,
      "aulas": aulas.map((aula) => aula.toMap()),
      "faltas": faltas
    };
    if (id != null) map["_id"] = id;
    return map;
  }
}

class Periodo {
  int ano;
  int semestre;

  Periodo(this.ano, this.semestre);

  Periodo.fromMap(Map<String, dynamic> map) {
    ano = map["ano"].floor();
    semestre = map["semestre"].floor();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "ano": ano,
      "semestre": semestre,
    };
    return map;
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

  Aula({this.diaSemana, this.horarioInicio, this.horarioFim, this.local});

  Aula.fromMap(Map<String, dynamic> map) {
    diaSemana = map["diaSemana"].floor();
    horarioInicio = Horario.fromMap(map["horarioInicio"]);
    horarioFim = Horario.fromMap(map["horarioFim"]);
    local = map["local"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "diaSemana": diaSemana,
      "horarioInicio": horarioInicio.toMap(),
      "horarioFim": horarioFim.toMap(),
      "local": local,
    };
    return map;
  }
}

class Horario {
  int hora;
  int minuto;

  Horario(this.hora, this.minuto);

  Horario.fromMap(Map<String, dynamic> map) {
    hora = map["hora"].floor();
    minuto = map["minuto"].floor();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "hora": hora,
      "minuto": minuto,
    };
    return map;
  }

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
