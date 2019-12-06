import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/services/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class DisciplinaBloc extends BlocBase {
  ApiHelper api;

  List<Disciplina> _disciplinas;

  final _searchController = BehaviorSubject<int>();

  Sink get inSearch => _searchController.sink;

  final _disciplinasController = BehaviorSubject<List<Disciplina>>.seeded([]);

  Stream get outDisciplinas => _disciplinasController.stream;

  DisciplinaBloc() {
    api = ApiHelper();
    api.initDb();

    _searchController.stream.listen(_load);
  }

  void _load(int qnt) async {
    _disciplinas = await api.getDisciplinas();
    _disciplinasController.sink.add(_disciplinas);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.close();
    _disciplinasController.close();
  }
}
