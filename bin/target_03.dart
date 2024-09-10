import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async{
  var jsonData = await readJsonFile('resources/dados.json');

  var totalRevenue = 0.0;
  var countDays = 0;
  List revenueList = [];

  for(var data in jsonData) {
    var revenue = Revenue.fromJson(data);
    
    if(revenue.valor > 0.0) {
      totalRevenue += revenue.valor;
      countDays++;
      revenueList.add(revenue);
    }
  }

  revenueList.sort((a,b) => b.valor.compareTo(a.valor));
  print("O menor faturamento ocorrido no mês: ${revenueList.last}");
  print("O maior faturamento ocorrido no mês: ${revenueList.first}");

  var greaterThanAverage = revenueList.where((revenue) => revenue.valor > (totalRevenue/countDays));
  print("Número de dias no mês em que o valor de faturamento diário foi superior à média mensal: ${greaterThanAverage.length}");

}

Future<List> readJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  var map = jsonDecode(input);
  return map;
}

class Revenue {
  int dia;
  double valor;

  Revenue({
    required this.dia,
    required this.valor,
  });

  factory Revenue.fromJson(Map<String, dynamic> json) => Revenue(
    dia: json['dia'],
    valor: json['valor'].toDouble(),
  );

   @override
  String toString() {
      return "Dia: $dia - Valor: $valor \n";
  }
}