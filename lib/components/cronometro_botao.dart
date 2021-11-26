import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final IconData icone;
  final String nomeBotao;
  const CronometroBotao({
    required this.icone,
    required this.nomeBotao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(icone),
          Text(nomeBotao),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
    );
  }
}
