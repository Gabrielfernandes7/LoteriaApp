class Sorteio {
  final int concurso;
  final String data;
  final String local;
  final List<String> dezenas;
  final bool acumulou;
  final int proximoConcurso;
  final String dataProximoConcurso;
  final double valorAcumuladoProximoConcurso;
  final List<Map<String, dynamic>> premiacoes;

  Sorteio({
    required this.concurso,
    required this.data,
    required this.local,
    required this.dezenas,
    required this.acumulou,
    required this.proximoConcurso,
    required this.dataProximoConcurso,
    required this.valorAcumuladoProximoConcurso,
    required this.premiacoes,
  });

  factory Sorteio.fromJson(Map<String, dynamic> json) {
    return Sorteio(
      concurso: json['concurso'],
      data: json['data'],
      local: json['local'],
      dezenas: List<String>.from(json['dezenas']),
      acumulou: json['acumulou'],
      proximoConcurso: json['proximoConcurso'],
      dataProximoConcurso: json['dataProximoConcurso'],
      valorAcumuladoProximoConcurso: json['valorAcumuladoProximoConcurso'].toDouble(),
      premiacoes: List<Map<String, dynamic>>.from(json['premiacoes']),
    );
  }
}
