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

  final _saveDisciplinaController = BehaviorSubject<Disciplina>();

  Sink get inSave => _saveDisciplinaController.sink;

  final _incFaltaController = BehaviorSubject<String>();

  Sink get inIncFalta => _incFaltaController.sink;

  final _decFaltaController = BehaviorSubject<String>();

  Sink get inDecFalta => _decFaltaController.sink;

  DisciplinaBloc() {
    api = ApiHelper();
    api.initDb();

    _searchController.stream.listen(_load);
    _saveDisciplinaController.listen(_save);
    _incFaltaController.listen(_inc);
    _decFaltaController.listen(_dec);
  }

  void _inc(String id) {

  }

  void _dec(String id) {

  }

  void _load(int qnt) async {
    _disciplinas = await api.getDisciplinas();
    _disciplinasController.sink.add(_disciplinas);
  }

  void _save(Disciplina disciplina) {
    api.saveDisciplina(disciplina);
    _disciplinas.add(disciplina);
    _disciplinasController.sink.add(_disciplinas);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.close();
    _disciplinasController.close();
    _saveDisciplinaController.close();
    _incFaltaController.close();
    _decFaltaController.close();
  }
}
