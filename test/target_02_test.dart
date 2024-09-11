import 'package:test/test.dart';

import '../bin/target_02.dart';

void main() {
  group('Testes para a função checkFibonacci', () {
    test('Número que pertence à sequência de Fibonacci', () {
      expect(checkFibonacci(0), isTrue);
      expect(checkFibonacci(1), isTrue);
      expect(checkFibonacci(2), isTrue);
      expect(checkFibonacci(3), isTrue);
      expect(checkFibonacci(5), isTrue);
    });

    test('Número que não pertence à sequência de Fibonacci', () {
      expect(checkFibonacci(4), isFalse);
      expect(checkFibonacci(6), isFalse);
      expect(checkFibonacci(7), isFalse);
    });

    test('Números grandes na sequência de Fibonacci', () {
      expect(checkFibonacci(21), isTrue);
      expect(checkFibonacci(34), isTrue);
    });
  });
}