import 'package:test/test.dart';

import '../bin/target_01.dart';

void main() {
  group('Testes da função soma', () {
    test('Soma dos números de 0 a 12 (indice = 13)', () {
      expect(soma(13), equals(78));
    });

    test('Soma dos números de 0 a 9 (indice = 10)', () {
      expect(soma(10), equals(45));
    });

    test('Soma dos números de 0 a 0 (indice = 1)', () {
      expect(soma(1), equals(0));
    });

    test('Soma dos números de 0 a 4 (indice = 5)', () {
      expect(soma(5), equals(10));
    });

    test('Soma dos números de 0 a 0 (indice = 0)', () {
      expect(soma(0), equals(0));
    });
  });
}
