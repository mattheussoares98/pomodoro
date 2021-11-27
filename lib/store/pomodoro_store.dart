import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

//flutter packages pub run build_runner build
class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int tempoDescanso = 1;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 5;

  @action
  void iniciar() {
    iniciado = true;
  }

  @action
  void parar() {
    iniciado = false;
  }

  @action
  void reiniciar() {
    iniciado = false;
  }

  @action
  void incrementarDescanso() {
    tempoDescanso++;
  }

  @action
  void incrementarTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarDescanso() {
    tempoDescanso--;
  }

  @action
  void decrementarTrabalho() {
    tempoTrabalho--;
  }
}
