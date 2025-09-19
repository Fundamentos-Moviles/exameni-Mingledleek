import 'dart:math';
import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  static const int tamTablero = 6;
  static const int cantidadCuadros = tamTablero * tamTablero;
  static const int numMinas = 8; // cantidad de minas en el tablero

  late List<bool> minas; //true si es una mina
  late List<Color?> squareColors; // null = sin checar, verde = seguro, rojo = mina
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    final random = Random();
    minas = List.filled(cantidadCuadros, false);
    int placed = 0;
    while (placed < numMinas) {
      int idx = random.nextInt(cantidadCuadros);
      if (!minas[idx]) {
        minas[idx] = true;
        placed++;
      }
    }
    squareColors = List.filled(cantidadCuadros, null);
    gameOver = false;
    setState(() {});
  }

  void _revealSquare(int index) {
    if (gameOver || squareColors[index] != null) return;
    setState(() {
      if (minas[index]) {
        gameOver = true;
        for (int i = 0; i < cantidadCuadros; i++) {
          squareColors[i] = minas[i] ? Colors.red : Colors.green;
        }
      } else {
        squareColors[index] = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bucio Garcia David Alejandro: Busca minas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: tamTablero,
          shrinkWrap: true,
          children: List.generate(cantidadCuadros, (index) {
            return GestureDetector(
              onTap: () => _revealSquare(index),
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: squareColors[index] ?? Colors.grey[300],
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black12),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
