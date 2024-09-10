import 'package:test/test.dart';

import '../bin/target_04.dart';

void main() {
  group('Testes da classe Company', () {
    test('Teste de adicionar subsidiária e cálculo da receita total', () {
      var mainCompany = Company("Main", 0.0);

      var sp = Company("SP", 67836.43);
      var rj = Company("RJ", 36678.66);
      var mg = Company("MG", 29229.88);

      mainCompany.addSubsidiary(sp);
      mainCompany.addSubsidiary(rj);
      mainCompany.addSubsidiary(mg);

      expect(mainCompany.subsidiaries.length, equals(3));
      expect(mainCompany.subsidiariesRevenue, equals(133744.97));
    });

    test('Teste de geração de porcentagens', () {
      var mainCompany = Company("Main", 0.0);

      var sp = Company("SP", 50.00);
      var rj = Company("RJ", 25.00);
      var mg = Company("MG", 25.00);

      mainCompany.addSubsidiary(sp);
      mainCompany.addSubsidiary(rj);
      mainCompany.addSubsidiary(mg);

      mainCompany.generatePercentage();

      expect(sp.percentage, closeTo(50.0, 0.01));
      expect(rj.percentage, closeTo(25.0, 0.01));
      expect(mg.percentage, closeTo(25.0, 0.01));
    });

    test('Teste de toString na classe Company', () {
      var sp = Company("SP", 67836.43);
      sp.percentage = 50.71;

      expect(sp.toString(), equals("SP - R\$ 67836.43 - 50.71% \n"));
    });
  });
}