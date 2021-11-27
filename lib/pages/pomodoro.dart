import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob_x/components/cronometro_botao.dart';
import 'package:mob_x/components/cronometro.dart';
import 'package:mob_x/components/entrada_tempo.dart';
import 'package:mob_x/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Cronometro(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntradaTempo(
                      valor: store.tempoTrabalho,
                      titulo: 'Trabalho',
                      inc: store.incrementarTrabalho,
                      dec: store.decrementarTrabalho,
                    ),
                    EntradaTempo(
                      valor: store.tempoDescanso,
                      titulo: 'Descanso',
                      inc: store.incrementarDescanso,
                      dec: store.decrementarDescanso,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
