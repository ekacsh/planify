import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:planify/models/task.dart';
import 'package:planify/services/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class TaskBloc extends BlocBase {
  ApiHelper api;

  List<Task> _tasks;

  final _searchController = BehaviorSubject<int>();

  Sink get inSearch => _searchController.sink;

  final _tasksController = BehaviorSubject<List<Task>>.seeded([]);

  Stream get outTasks => _tasksController.stream;

  TaskBloc() {
    api = ApiHelper();

    _searchController.stream.listen(_loadTasks);
  }

  void _loadTasks(int qnt) {
    print(_tasks);
    _tasks = api.getMostRecent(qnt);
    _tasksController.sink.add(_tasks);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.close();
    _tasksController.close();
  }
}
