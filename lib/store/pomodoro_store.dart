import 'dart:async';
import 'package:mobx/mobx.dart';
part 'pomodoro_store.g.dart';

//flutter packages pub run build_runner build
//flutter packages pub run build_runner watch
class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoTrabalho { descanso, trabalho }

abstract class _PomodoroStore with Store {
  @observable
  TipoTrabalho tipoTrabalho = TipoTrabalho.trabalho;

  @observable
  bool iniciado = false;

  @observable
  int tempoDescanso = 5;

  @observable
  int minutos = 15;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 15;

  @action
  void iniciar() {
    iniciado = true;
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
    cronometro = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (minutos == 0 && segundos == 0) {
          trocarTipoIntervalo();
        } else if (segundos == 0 && minutos > 0) {
          minutos--;
          segundos = 59;
        } else {
          segundos--;
        }
      },
    );
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
    if (estaTrabalhando()) {
      minutos = tempoTrabalho;
      segundos = 0;
    } else {
      minutos = tempoDescanso;
      segundos = 0;
    }
  }

  @action
  void incrementarDescanso() {
    tempoDescanso++;
    // if (estaDescansando()) {
      minutos = tempoDescanso;
      segundos = 0;
    // }
    if (iniciado == false) {
      tipoTrabalho = TipoTrabalho.descanso;
    }
  }

  @action
  void incrementarTrabalho() {
    tempoTrabalho++;
    // if (estaTrabalhando()) {
      minutos = tempoTrabalho;
      segundos = 0;
    // }
    if (iniciado == false) {
      tipoTrabalho = TipoTrabalho.trabalho;
    }
  }

  @action
  void decrementarDescanso() {
    if (tempoDescanso > 1) {
      tempoDescanso--;
      // if (estaDescansando()) {
        minutos = tempoDescanso;
        segundos = 0;
      // }
    }
    if (iniciado == false) {
      tipoTrabalho = TipoTrabalho.descanso;
    }
  }

  @action
  void decrementarTrabalho() {
    if (tempoTrabalho > 1) {
      tempoTrabalho--;
      // if (estaTrabalhando()) {
        minutos = tempoTrabalho;
        segundos = 0;
      // }
    }
    if (iniciado == false) {
      tipoTrabalho = TipoTrabalho.trabalho;
    }
  }

  bool estaDescansando() {
    return tipoTrabalho == TipoTrabalho.descanso;
  }

  bool estaTrabalhando() {
    return tipoTrabalho == TipoTrabalho.trabalho;
  }

  Timer? cronometro;

  void trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoTrabalho = TipoTrabalho.descanso;
      minutos = tempoDescanso;
    } else {
      tipoTrabalho = TipoTrabalho.trabalho;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}
