import 'package:flutter/material.dart';
import 'package:mob_x/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

import 'botao_adicionar_tirar_tempo.dart';

class EntradaTempo extends StatelessWidget {
  final int valor;
  final String titulo;
  final void Function()? inc;
  final void Function()? dec;
  const EntradaTempo({
    required this.valor,
    required this.titulo,
    this.inc,
    this.dec,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            BotaoMudarTempo(
              onPressed: dec!,
              icone: Icons.arrow_downward,
            ),
            Text(
              '$valor min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            BotaoMudarTempo(
              onPressed: inc!,
              icone: Icons.arrow_upward,
            ),
          ],
        ),
      ],
    );
  }
}
