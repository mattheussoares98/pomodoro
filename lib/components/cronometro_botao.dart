import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final IconData icone;
  final String nomeBotao;
  final Function()? click;
  const CronometroBotao({
    this.click,
    required this.icone,
    required this.nomeBotao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: click,
      child: Row(
        children: [
          Icon(
            icone,
          ),
          const SizedBox(width: 10),
          Text(nomeBotao),
        ],
      ),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 25,
        ),
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
      ),
    );
  }
}
