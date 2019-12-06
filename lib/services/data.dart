final List<Map<String, dynamic>> disciplinas = [
  {
    "_id": 1,
    "periodo": {"ano": 2019, "semestre": 2},
    "titulo": "Sistemas Operacionais",
    "docente": "Hélio Guardia",
    "aulas": [
      {
        "local": "AT-5",
        "diaSemana": 2,
        "horarioInicio": {
          "hora": 8,
          "minuto": 0,
        },
        "horarioFim": {
          "hora": 12,
          "minuto": 0,
        }
      }
    ],
    "faltas": 4,
  },
  {
    "_id": 2,
    "periodo": {"ano": 2019, "semestre": 2},
    "titulo": "Algoritmos e Estruturas de Dados 1",
    "docente": "Diego Furtado",
    "aulas": [
      {
        "local": "LE-2",
        "diaSemana": 1,
        "horarioInicio": {
          "hora": 16,
          "minuto": 0,
        },
        "horarioFim": {
          "hora": 18,
          "minuto": 0,
        }
      },
      {
        "local": "LE-4",
        "diaSemana": 5,
        "horarioInicio": {
          "hora": 16,
          "minuto": 0,
        },
        "horarioFim": {
          "hora": 18,
          "minuto": 0,
        }
      }
    ],
    "faltas": 4,
  }
];

final List<Map<String, dynamic>> tarefas = [
  {
    "_id": 1,
    "disciplinaId": 1,
    "disciplinaNome": "Sistemas Operacionais",
    "titulo": "Tarefa 1",
    "data": DateTime.parse("2019-12-05 10:00:03Z"),
    "cor": 0xffff0000,
  },
  {
    "_id": 2,
    "disciplinaId": 1,
    "disciplinaNome": "Sistemas Operacionais",
    "titulo": "Tarefa 2",
    "data": DateTime.parse("2019-12-05 10:00:03Z"),
    "cor": 0xff00ff00,
  },
  {
    "_id": 3,
    "disciplinaId": 1,
    "disciplinaNome": "Sistemas Operacionais",
    "titulo": "Tarefa 3",
    "data": DateTime.parse("2019-12-01 10:00:03Z"),
    "cor": 0xff0000ff,
  },
  {
    "_id": 4,
    "disciplinaId": 1,
    "disciplinaNome": "Sistemas Operacionais",
    "titulo": "Tarefa 4",
    "data": DateTime.parse("2019-11-29 10:00:03Z"),
    "cor": 0xffdddddd,
  },
];

final List<Map<String, dynamic>> anotacoes = [
  {
    "_id": 1,
    "disciplinaId": 2,
    "text": "Anotacao 1",
    "data": DateTime.parse("2019-12-05 10:00:03Z"),
  },
];
