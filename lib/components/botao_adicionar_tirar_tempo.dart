import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob_x/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class BotaoMudarTempo extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icone;
  const BotaoMudarTempo({
    this.onPressed,
    required this.icone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => ElevatedButton(
        onPressed: onPressed,
        child: Icon(
          icone,
        ),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
          primary: store.estaDescansando() ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
