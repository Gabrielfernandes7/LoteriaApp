import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/sorteio.dart';

class ApiService {
  final String baseUrl = 'https://loteriascaixa-api.herokuapp.com';

  /// Busca os últimos 5 resultados da Mega-Sena
  Future<List<Sorteio>> fetchLastFiveResults() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/megasena'));

      if (response.statusCode == 200) {
        // Decodificar a resposta corretamente
        final decodedBody = utf8.decode(response.bodyBytes);

        // Parsear o JSON
        final List<dynamic> sorteiosJson = jsonDecode(decodedBody);

        // Retornar apenas os 5 últimos sorteios
        return sorteiosJson
            .take(5)
            .map((json) => Sorteio.fromJson(json))
            .toList();
      } else {
        // Lançar exceção com o motivo do erro
        throw Exception(
            'Erro ao buscar dados da API: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      // Capturar e relançar erros
      throw Exception('Erro inesperado: $e');
    }
  }
}
