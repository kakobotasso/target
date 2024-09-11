void main(List<String> arguments) {
  int givenNumber = 6;

  if(checkFibonacci(givenNumber)) {
    print('$givenNumber pertence a Fibonacci');
    return;
  }

  print('$givenNumber não pertence a Fibonacci');
}

bool checkFibonacci(int givenNumber) {
  List<int> fibonacci = [0,1];

  for(int i = 1; i <= givenNumber + 1; i++) {
    fibonacci.add(fibonacci[i-1] + fibonacci[i]);

    if(fibonacci.contains(givenNumber)) {
      return true;
    }
  }

  return false;
}