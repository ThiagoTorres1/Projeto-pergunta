import 'package:flutter/material.dart';
import 'question.dart';
import 'answers.dart';
import 'result.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Quiz({Key? key}) : super(key: key);
  int _arrayPostion = 0;

  int _finalScore = 0;

  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];

  void _alternativeResultAndPosition(int score) {
    if (hasAlternativeSelection) {
      setState(() {
        _arrayPostion++;
        _finalScore += score;
      });
    }
  }

  void _restartAplication() {
    setState(() {
      _arrayPostion = 0;
      _finalScore = 0;
    });
  }

  bool get hasAlternativeSelection {
    return _arrayPostion < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> alternative = hasAlternativeSelection
        ? _perguntas[_arrayPostion].cast()['respostas']
        : [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto Perguntas'),
      ),
      body: hasAlternativeSelection
          ? Column(
              children: [
                Question(
                  text: _perguntas[_arrayPostion]['texto'].toString(),
                ),
                ...alternative.map((resp) {
                  return Answers(
                    text: resp['texto'].toString(),
                    onPressed: () => _alternativeResultAndPosition(
                        int.parse(resp['pontuacao'].toString())),
                  );
                }).toList(),
              ],
            )
          : Result(
              restart: _restartAplication,
              score: _finalScore,
            ),
    );
  }
}
