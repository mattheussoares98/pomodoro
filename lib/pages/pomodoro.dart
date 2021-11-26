import 'package:flutter/material.dart';
import 'package:mob_x/components/cronometro_botao.dart';
import 'package:mob_x/components/cronometro.dart';
import 'package:mob_x/components/entrada_tempo.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  EntradaTempo(
                    valor: 2,
                    titulo: 'Trabalho',
                  ),
                  EntradaTempo(
                    valor: 2,
                    titulo: 'Contador',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
