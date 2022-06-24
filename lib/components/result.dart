import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restart;
  const Result({Key? key, required this.score, required this.restart})
      : super(key: key);

  String get resultFrase {
    if (score < 8) {
      return 'parabéns';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante';
    } else {
      return 'Nivel Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultFrase,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: restart,
          child: const Text('Reiniciar?'),
        ),
      ],
    );
  }
}
