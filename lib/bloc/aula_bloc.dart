import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/services/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class DisciplinaBloc extends BlocBase {
  ApiHelper api;

  List<Aula> _aulas;

  final _searchController = BehaviorSubject<int>();

  Sink get inSearch => _searchController.sink;

  final _aulasController = BehaviorSubject<List<Aula>>.seeded([]);

  Stream get outDisciplinas => _aulasController.stream;

  DisciplinaBloc() {
    api = ApiHelper();
    api.initDb();

    _searchController.stream.listen(_load);
  }

  // void _load(int qnt) async {
  //   _aulas = await api.getAulas();
  //   _aulasController.sink.add(_aulas);
  // }

  @override
  void dispose() {
    super.dispose();
    _searchController.close();
    _aulasController.close();
  }
}
