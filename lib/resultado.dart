import 'package:flutter/material.dart';

class ResultadoScreen extends StatelessWidget {
  final String escolhaUsuario;
  final String escolhaComputador;
  final String resultado;

  ResultadoScreen({
    required this.escolhaUsuario,
    required this.escolhaComputador,
    required this.resultado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(resultado, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Você", style: TextStyle(fontSize: 18)),
                    Image.asset("assets/$escolhaUsuario.png", width: 100, height: 100),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Text("Computador", style: TextStyle(fontSize: 18)),
                    Image.asset("assets/$escolhaComputador.png", width: 100, height: 100),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Jogar Novamente"),
            ),
          ],
        ),
      ),
    );
  }
}
