import 'dart:convert';
import 'package:test/test.dart';
import '../bin/target_03.dart';

void main() {
  group('Testes da classe Revenue e leitura de JSON', () {
    test('Teste de criação de Revenue a partir de JSON', () {
      var json = {
        'dia': 1,
        'valor': 100.50,
      };

      var revenue = Revenue.fromJson(json);

      expect(revenue.dia, equals(1));
      expect(revenue.valor, equals(100.50));
    });

    test('Teste de leitura de JSON e processamento de receitas', () async {
      
      var jsonData = jsonDecode(
         '''
          [
            {
              "dia": 1,
              "valor": 100.0
            },
            {
              "dia": 2,
              "valor": 200.0
            },
            {
              "dia": 3,
              "valor": 300.0
            }
          ]
         '''
      );

      var totalRevenue = 0.0;
      var countDays = 0;
      List<Revenue> revenueList = [];

      for (var data in jsonData) {
        var revenue = Revenue.fromJson(data);

        if (revenue.valor > 0.0) {
          totalRevenue += revenue.valor;
          countDays++;
          revenueList.add(revenue);
        }
      }

      revenueList.sort((a, b) => b.valor.compareTo(a.valor));

      // Verificando se os cálculos de maior e menor faturamento estão corretos
      expect(revenueList.first.valor, equals(300.0));
      expect(revenueList.last.valor, equals(100.0));

      // Verificando se o total de receitas e o número de dias foram calculados corretamente
      expect(totalRevenue, equals(600.0));
      expect(countDays, equals(3));

      // Verificando o número de dias com receita acima da média
      var average = totalRevenue / countDays;
      var greaterThanAverage =
          revenueList.where((revenue) => revenue.valor > average).toList();
      expect(greaterThanAverage.length, equals(1));
    });
  });
}
