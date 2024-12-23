import 'package:flutter/material.dart';
import '../model/sorteio.dart';

class SorteioCard extends StatelessWidget {
  final Sorteio sorteio;
  final VoidCallback onTap;

  const SorteioCard({
    super.key,
    required this.sorteio,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Define margem lateral de 10
        child: Card(
          color: Colors.green.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Concurso: ${sorteio.concurso}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Data: ${sorteio.data}'),
                Text('Local: ${sorteio.local}'),
                const SizedBox(height: 6.4),
                Wrap(
                  spacing: 6.4,
                  runSpacing: 6.4,
                  children: sorteio.dezenas.map((numero) {
                    return Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        numero,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 6.4),
                Text('Acumulou: ${sorteio.acumulou ? "Sim" : "Não"}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
