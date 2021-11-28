import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob_x/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

import 'cronometro_botao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => Container(
        color: store.estaDescansando() ? Colors.green : Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.estaTrabalhando()
                  ? 'Hora de trabalhar'
                  : 'Hora de descansar',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            FittedBox(
              child: Text(
                '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CronometroBotao(
                      icone: Icons.play_arrow,
                      nomeBotao: 'Iniciar',
                      click: store.iniciar,
                    ),
                  ),
                if (store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CronometroBotao(
                      icone: Icons.stop,
                      nomeBotao: 'Parar',
                      click: store.parar,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CronometroBotao(
                    icone: Icons.refresh,
                    nomeBotao: 'Reiniciar',
                    click: store.reiniciar,
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CronometroBotao(
            //       icone: store.estaTrabalhando() ? Icons.bedtime : Icons.work,
            //       nomeBotao:
            //           store.estaTrabalhando() ? 'Descansar' : 'Trabalhar',
            //       click: store.trocarTipoIntervalo,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
