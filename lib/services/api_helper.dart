import 'package:planify/models/task.dart';

class ApiHelper {
  final List<Task> tasks = [
    Task("Tarefa 1", "Disciplina 1", DateTime.parse("2019-12-05 10:00:03Z"),
        0xffff0000),
    Task("Tarefa 2", "Disciplina 3", DateTime.parse("2019-12-10 10:00:03Z"),
        0xff00ff00),
    Task("Tarefa 3", "Disciplina 1", DateTime.parse("2019-12-01 10:00:03Z"),
        0xff0000ff),
    Task("Tarefa 4", "Disciplina 2", DateTime.parse("2019-11-29 10:00:03Z"),
        0xffdddddd)
  ];

  List<Task> getMostRecent(int qnt) {
    List<Task> _tasks;
    _tasks.addAll(tasks);
    _tasks.sort((a, b) => a.date.compareTo(b.date));
    return _tasks;
  }
}
