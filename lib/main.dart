import 'dart:math';
import 'package:flutter/material.dart';
import 'resultado.dart';

void main() {
  runApp(PedraPapelTesouraApp());
}

class PedraPapelTesouraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedra, Papel e Tesoura',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<String> opcoes = ['pedra', 'papel', 'tesoura'];

  void _jogar(BuildContext context, String escolhaUsuario) {
    final escolhaComputador = opcoes[Random().nextInt(3)];
    final resultado = _determinarResultado(escolhaUsuario, escolhaComputador);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoScreen(
          escolhaUsuario: escolhaUsuario,
          escolhaComputador: escolhaComputador,
          resultado: resultado,
        ),
      ),
    );
  }

  String _determinarResultado(String usuario, String computador) {
    if (usuario == computador) return "Empate!";
    if ((usuario == "pedra" && computador == "tesoura") ||
        (usuario == "papel" && computador == "pedra") ||
        (usuario == "tesoura" && computador == "papel")) {
      return "Você Venceu!";
    }
    return "Você Perdeu!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha uma opção')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Escolha Pedra, Papel ou Tesoura", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: opcoes.map((opcao) {
              return GestureDetector(
                onTap: () => _jogar(context, opcao),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset("assets/$opcao.png", width: 100, height: 100),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
