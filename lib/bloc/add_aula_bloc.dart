import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class AddAulaBloc extends BlocBase {
  final _hourController = BehaviorSubject<int>.seeded(10);

  Stream<int> get outHour => _hourController.stream;
  Sink<int> get inHour => _hourController.sink;

  void increment() {
    inHour.add(_hourController.value += 1);
  }

  void decrement() {
    inHour.add(_hourController.value -= 1);
  }

  int getHour() {
    return _hourController.value;
  }

  @override
  void dispose() {
    _hourController.close();
    super.dispose();
  }
}
