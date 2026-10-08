
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: KoresawaGacha()));

class KoresawaGacha extends StatefulWidget {
  const KoresawaGacha({super.key});

  @override
  State<KoresawaGacha> createState() => _KoresawaGachaState();
}

class _KoresawaGachaState extends State<KoresawaGacha> {
  int n = 0, e = 0;
  bool loading = false;

  final emojis = ['🐻', '🎀', '❤️', '✨'];

  final images = [
  'images/reko1.jpg',
  'images/reko2.jpg',
  'images/reko3.webp',
  'images/reko4.jpg',
  'images/reko5.jpg',
];

  Future<void> gacha() async {
    setState(() => loading = true);

    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }

    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('🐻 Koresawa Gacha')),

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.network(images[n], fit: BoxFit.cover),
          ),

          const SizedBox(height: 30),

          const Text('🎀', style: TextStyle(fontSize: 72)),

          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),
  );
}
