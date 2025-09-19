import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("6x6 Grid")),
      body: Center(
        child: GridView.count(
          crossAxisCount: 6, // 6 columns
          children: List.generate(36, (index) {
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  '${index + 1}', // optional numbering
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
