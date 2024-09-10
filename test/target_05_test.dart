import 'package:test/test.dart';

import '../bin/target_05.dart';

void main() {
  group('Testes da função reverse', () {
    test('Inversão de string comum', () {
      expect(reverse("dart"), equals("trad"));
    });

    test('Inversão de string vazia', () {
      expect(reverse(""), equals(""));
    });

    test('Inversão de string com espaços', () {
      expect(reverse("hello world"), equals("dlrow olleh"));
    });

    test('Inversão de string com caracteres especiais', () {
      expect(reverse("123@abc!"), equals("!cba@321"));
    });

    test('Inversão de string com apenas um caractere', () {
      expect(reverse("a"), equals("a"));
    });

    test('Inversão de string com apenas números', () {
      expect(reverse("123"), equals("321"));
    });

    test('Inversão de string nula retorna string vazia', () {
      expect(reverse(null), equals(""));
    });
  });
}