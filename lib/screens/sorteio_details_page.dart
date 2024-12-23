import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/sorteio.dart';

class SorteioDetailsPage extends StatelessWidget {
  final Sorteio sorteio;

  const SorteioDetailsPage({super.key, required this.sorteio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Concurso ${sorteio.concurso}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardDetalhes(),
            const SizedBox(height: 16.0),
            _buildDezenasSection(),
            const SizedBox(height: 16.0),
            _buildCardProximoConcurso(),
            const SizedBox(height: 16.0),
            _buildPremiacoesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDetalhes() {
    return Card(
      color: Colors.orange.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalhes do Sorteio',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade700,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Data: ${sorteio.data.isNotEmpty ? sorteio.data : "Não informado"}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Local: ${sorteio.local.isNotEmpty ? sorteio.local : "Não informado"}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Acumulou: ${sorteio.acumulou ? "Sim" : "Não"}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDezenasSection() {
    if (sorteio.dezenas.isEmpty) {
      return Text(
        'Nenhuma dezena sorteada.',
        style: TextStyle(color: Colors.red.shade700, fontSize: 16.0),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dezenas Sorteadas',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade700,
          ),
        ),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          children: sorteio.dezenas.map((numero) {
            return Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4.0,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                numero,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCardProximoConcurso() {
    final currencyFormatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Card(
      color: Colors.blue.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Próximo Concurso',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Concurso: ${sorteio.proximoConcurso}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Data: ${sorteio.dataProximoConcurso.isNotEmpty ? sorteio.dataProximoConcurso : "Não informado"}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Valor Acumulado: ${currencyFormatter.format(sorteio.valorAcumuladoProximoConcurso)}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiacoesSection() {
    if (sorteio.premiacoes.isEmpty) {
      return Text(
        'Nenhuma premiação disponível.',
        style: TextStyle(color: Colors.red.shade700, fontSize: 16.0),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Premiações',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade700,
          ),
        ),
        const SizedBox(height: 12.0),
        ...sorteio.premiacoes.map((premiacao) {
          final nome = premiacao['nome'] ?? 'Categoria não informada';
          final valor = premiacao['valor'] ?? 0.0;
          return Card(
            color: Colors.purple.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  Text(
                    'R\$ ${(valor as double).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
