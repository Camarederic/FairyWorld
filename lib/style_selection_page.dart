import 'package:flutter/material.dart';
import 'world_page.dart';

class StyleSelectionPage extends StatefulWidget {
  const StyleSelectionPage({super.key});

  @override
  State<StyleSelectionPage> createState() => _StyleSelectionPageState();
}

class _StyleSelectionPageState extends State<StyleSelectionPage> {
  String? selectedStyle;

  void selectStyle(String style) {
    setState(() {
      selectedStyle = style;
    });
  }

  void continueToWorld() {
    if (selectedStyle == null) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WorldPage(style: selectedStyle!)),
    );
  }

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
              onPressed: () => selectStyle('Fairy'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedStyle == 'Fairy' ? Colors.green : null,
              ),
              child: const Text('🧚 Fairy'),
            ),

            ElevatedButton(
              onPressed: () => selectStyle('Steampunk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedStyle == 'Steampunk'
                    ? Colors.green
                    : null,
              ),
              child: const Text('⚙️ Steampunk'),
            ),

            ElevatedButton(
              onPressed: () => selectStyle('Military'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedStyle == 'Military'
                    ? Colors.green
                    : null,
              ),
              child: const Text('🪖 Military'),
            ),

            const SizedBox(height: 30),

            if (selectedStyle != null)
              Text(
                'Выбран стиль: $selectedStyle',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: selectedStyle == null ? null : continueToWorld,
              child: const Text('Продолжить →'),
            ),
          ],
        ),
      ),
    );
  }
}
