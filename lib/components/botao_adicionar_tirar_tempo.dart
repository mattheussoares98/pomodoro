import 'package:flutter/material.dart';

class BotaoMudarTempo extends StatelessWidget {
  final void Function() onPressed;
  final IconData icone;
  const BotaoMudarTempo({
    required this.onPressed,
    required this.icone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:  Icon(
        icone,
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        primary: Colors.red,
      ),
    );
  }
}
