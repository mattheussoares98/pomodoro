import 'package:flutter/material.dart';

import 'cronometro_botao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hora de trabalhar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CronometroBotao(
                icone: Icons.play_arrow,
                nomeBotao: 'Iniciar',
              ),
              CronometroBotao(
                icone: Icons.refresh,
                nomeBotao: 'Reiniciar',
              ),
              CronometroBotao(
                icone: Icons.play_arrow,
                nomeBotao: 'Iniciar',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
