import 'package:flutter/material.dart';

class AvisoTelaWidget extends StatelessWidget {
  const AvisoTelaWidget(
      {Key? key,
      this.image,
      required this.subtitle,
      required this.title,
      required this.onTap})
      : super(key: key);

  final String? image;
  final String subtitle;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(32)),
        child: Stack(
          children: [
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
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null)
                    SizedBox(
                        height: 150, width: 150, child: Image.asset(image!)),
                  Expanded(
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
