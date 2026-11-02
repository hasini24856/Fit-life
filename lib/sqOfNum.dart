import 'dart:io';
void square(int n){
  print("Square = ${n*n}");
}
void main(){
  print("Enter a number:");
  int num = int.parse(stdin.readLineSync()!);
  square(num);
}