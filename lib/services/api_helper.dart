import 'package:mongo_dart/mongo_dart.dart';
import 'package:planify/models/disciplina.dart';
import 'package:planify/models/tarefa.dart';

class ApiHelper {
  static final ApiHelper instance = ApiHelper.internal();

  factory ApiHelper() => instance;

  ApiHelper.internal();

  Db _db;

  Future<Db> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  Future<Db> initDb() async {
    String user = "user";
    String pwd = "user";

//    Db db = new Db("mongodb://$user:$pwd@0.tcp.ngrok.io:12204/planify?authSource=admin&retryWrites=true&w=majority");
    Db db = new Db(
        "mongodb://$user:$pwd@10.0.2.2:27001/planify?authSource=admin&retryWrites=true&w=majority");
    await db.open();
    return db;
  }

  Future<List<Tarefa>> getMostRecentTarefas(int qnt) async {
    final coll = (await db).collection("tarefas");
    final pipeline = AggregationPipelineBuilder()
        .addStage(Lookup.withPipeline(
      from: "disciplinas",
      let: {"id": Field('disciplinaId')},
      pipeline: [
        Match(Expr(Eq(Field("_id"), Var("id")))),
        Project({"_id": 0, "disciplinaNome": Field("titulo")})
      ],
      as: "dName",
    ))
        .addStage(ReplaceRoot(
        MergeObjects([ArrayElemAt(Field("dName"), 0), Var("ROOT")])))
        .addStage(Project({"dName": 0}))
        .build();
    final result = await coll.aggregateToStream(pipeline).toList();

    return result.map((d) => Tarefa.fromMap(d)).toList();
  }

  Future<List<Disciplina>> getDisciplinas() async {
    final data = await (await db).collection("disciplinas").find().toList();

    return data.map((d) => Disciplina.fromMap(d)).toList();
  }

  Future<List<Anotacao>> getAnotacoes(ObjectId disciplinaId) async {
    final coll = (await db).collection("anotacoes");
    final pipeline = AggregationPipelineBuilder()
        .addStage(Lookup.withPipeline(
      from: "disciplinas",
      let: {"id": Field('disciplinaId')},
      pipeline: [
        Match(Expr(Eq(Field("_id"), Var("id")))),
        Project({"_id": 0, "disciplinaName": Field("titulo")})
      ],
      as: "dName",
    ))
        .addStage(ReplaceRoot(
        MergeObjects([ArrayElemAt(Field("dName"), 0), Var("ROOT")])))
        .addStage(Project({"dName": 0}))
        .build();
    final result = await coll.aggregateToStream(pipeline).toList();
    return result.map((d) => Anotacao.fromMap(d)).toList();
  }

  Future<void> saveAnotacao(Anotacao anotacao) async {
    final coll = (await db).collection("anotacoes");
    await coll.insert(anotacao.toMap());
  }
}
