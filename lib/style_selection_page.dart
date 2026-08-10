import 'package:flutter/material.dart';

class StyleSelectionPage extends StatelessWidget {
  const StyleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите стиль')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Какой мир ты хочешь увидеть?',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Выбран стиль Fairy')),
                );
              },
              child: const Text('Fairy'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Выбран стиль Steampunk')),
                );
              },
              child: const Text('Steampunk'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Выбран стиль Military')),
                );
              },
              child: const Text('Military'),
            ),
          ],
        ),
      ),
    );
  }
}
