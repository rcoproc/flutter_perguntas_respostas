import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 5 },
        {'texto': 'Vermelho', 'pontuacao': 3 },
        {'texto': 'Verde', 'pontuacao': 2 },
        {'texto': 'Branco', 'pontuacao': 9 },
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 8 },
        {'texto': 'Cachorro', 'pontuacao': 4 },
        {'texto': 'Gato', 'pontuacao': 3 },
        {'texto': 'Leão', 'pontuacao': 5 },
      ]
    },
    {
      'texto': 'Qual a sua Linguagem de programação favorita?',
      'respostas': [
       { 'texto': 'Ruby', 'pontuacao': 10 },
       { 'texto': 'Csharp', 'pontuacao': 2 },
       { 'texto': 'GOLang', 'pontuacao': 4 },
       { 'texto': 'Elixir', 'pontuacao': 7 },
       { 'texto': 'Dart', 'pontuacao': 6 },
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int _pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += _pontuacao;
      });
      print(_pontuacaoTotal);
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgets = respostas.map((t) {
    //     return Resposta(t,_responder);
    // }).toList();

    // for(String textoResp in respostas) {
    //   respostas.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}
