import 'package:flutter/material.dart';

class BotaoPadraoWidget extends StatelessWidget {
  const BotaoPadraoWidget({
    Key? key,
    required this.onTap,
    required this.textoBotao,
    this.corBotao,
  }) : super(key: key);

  final VoidCallback onTap;
  final String textoBotao;
  final Color? corBotao;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: corBotao ?? Colors.green,
            borderRadius: BorderRadius.circular(22)),
        child: Text(
          textoBotao,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
