import 'package:flutter/material.dart';

class BarraDeCimaFasesWidget extends StatefulWidget {
  const BarraDeCimaFasesWidget({Key? key}) : super(key: key);

  @override
  State<BarraDeCimaFasesWidget> createState() => _BarraDeCimaFasesWidgetState();
}

class _BarraDeCimaFasesWidgetState extends State<BarraDeCimaFasesWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white24,
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(32)),
              child: IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: const Icon(Icons.warning_amber_rounded)),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                '11:00',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
