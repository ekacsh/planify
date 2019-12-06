import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/services/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class AnotacaoBloc extends BlocBase {
  ApiHelper api;

  List<Anotacao> _anotacoes;

  final _searchController = BehaviorSubject<ObjectId>();

  Sink get inSearch => _searchController.sink;

  final _anotacoesController = BehaviorSubject<List<Anotacao>>.seeded([]);

  Stream get outAnotacoes => _anotacoesController.stream;

  final _saveAnotacaoController = BehaviorSubject<Anotacao>();

  Sink get inSave => _saveAnotacaoController.sink;

  AnotacaoBloc() {
    api = ApiHelper();

    _searchController.stream.listen(_load);
    _saveAnotacaoController.stream.listen(_save);
  }

  void _load(ObjectId disciplinaId) async {
    _anotacoes = await api.getAnotacoes(disciplinaId);
    _anotacoesController.sink.add(_anotacoes);
  }

  void _save(Anotacao anotacao) {
    api.saveAnotacao(anotacao);
    _anotacoes.add(anotacao);
    _anotacoesController.sink.add(_anotacoes);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.close();
    _anotacoesController.close();
    _saveAnotacaoController.close();
  }
}
