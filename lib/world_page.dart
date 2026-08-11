import 'package:flutter/material.dart';

class WorldPage extends StatefulWidget {
  final String style;

  const WorldPage({super.key, required this.style});

  @override
  State<WorldPage> createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  final TextEditingController descriptionController = TextEditingController();

  String getWorldName() {
    switch (widget.style) {
      case 'Fairy':
        return 'Зачарованный лес';
      case 'Steampunk':
        return 'Механический город';
      case 'Military':
        return 'Военная база';
      default:
        return 'Неизвестный мир';
    }
  }

  String getWorldEmoji() {
    switch (widget.style) {
      case 'Fairy':
        return '🌳';
      case 'Steampunk':
        return '⚙️';
      case 'Military':
        return '🏕️';
      default:
        return '🌍';
    }
  }

  void createWorld() {
    final description = descriptionController.text.trim();

    if (description.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Сначала опиши свой мир')));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Создаём мир: $description')));
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final worldName = getWorldName();
    final worldEmoji = getWorldEmoji();

    return Scaffold(
      appBar: AppBar(title: const Text('Твой мир')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '$worldEmoji $worldName',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              'Стиль: ${widget.style}',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Опиши свой мир',
                hintText:
                    'Например: сказочный лес с замком, '
                    'водопадом и маленькими драконами',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.deepPurple, width: 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(worldEmoji, style: const TextStyle(fontSize: 80)),
                      const SizedBox(height: 20),
                      const Text(
                        'Здесь появится твой мир',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: createWorld,
                child: const Text(
                  '✨ Создать мир',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
