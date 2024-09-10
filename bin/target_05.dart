import 'dart:io';

void main(List<String> arguments) {
  print("Digite uma palavra para ser invertida:");
  String? reversableString = stdin.readLineSync();

  print(reverse(reversableString));
}

String reverse(String? reversableString) {
  if(reversableString == null) return "";

  String finalString = "";
  for(var i = reversableString.length -1; i >= 0; i--) {
    finalString += reversableString[i];
  }

  return finalString;
}