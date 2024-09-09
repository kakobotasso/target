int indice = 13;

void main(List<String> arguments) {
  print('A soma é ${soma(indice)}');
}

int soma(int indice) {
  int soma = 0;
  
  for(var k = 0; k < indice; k++) {
    soma += k;
  }

  return soma;
}