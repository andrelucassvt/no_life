import 'package:flutter/material.dart';

class AvisoDicaWidget extends StatelessWidget {
  const AvisoDicaWidget({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(32)),
      child: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Você encontrou uma dica de um enigma',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  constraints:
                      const BoxConstraints(maxHeight: 300, maxWidth: 500),
                  child:
                      Image.asset('assets/images/dica/dica_quartoHospedes.jpg'))
            ],
          ),
          Positioned(
            bottom: 20.0,
            right: 40,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(22)),
                child: const Text(
                  'Entendi',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
