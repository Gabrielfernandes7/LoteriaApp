import 'package:flutter/material.dart';
import '../model/sorteio.dart';
import '../service/api_service.dart';
import '../widget/sorteio_card.dart';
import 'sorteio_details_page.dart';

class MegaSenaHomePage extends StatefulWidget {
  const MegaSenaHomePage({super.key});

  @override
  MegaSenaHomePageState createState() => MegaSenaHomePageState();
}

class MegaSenaHomePageState extends State<MegaSenaHomePage> {
  final ApiService apiService = ApiService();
  late Future<List<Sorteio>> futureSorteios;

  @override
  void initState() {
    super.initState();
    futureSorteios = apiService.fetchLastFiveResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MegaSena',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: FutureBuilder<List<Sorteio>>(
        future: futureSorteios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final sorteios = snapshot.data!;
            return ListView.builder(
              itemCount: sorteios.length,
              itemBuilder: (context, index) {
                final sorteio = sorteios[index];
                return SorteioCard(
                  sorteio: sorteio,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SorteioDetailsPage(sorteio: sorteio),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Nenhum sorteio encontrado.'));
          }
        },
      ),
    );
  }
}
