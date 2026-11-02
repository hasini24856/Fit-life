import 'dart:io';
void main() {
  print("Enter age:");
  int age = int.parse(stdin.readLineSync()!);

  print("Enter percentage:");
  double percentage = double.parse(stdin.readLineSync()!);

  print("Enter name:");
  String name = stdin.readLineSync()!;

  print("Are you a student? (true/false):");
  bool isStudent = stdin.readLineSync()! == "true";

  List<String> subjects = [];

  print("Enter Subject 1:");
  subjects.add(stdin.readLineSync()!);

  print("Enter Subject 2:");
  subjects.add(stdin.readLineSync()!);

  print("Enter Subject 3:");
  subjects.add(stdin.readLineSync()!);

  Map<String, dynamic> student = {
    "Name": name,
    "Age": age,
    "Percentage": percentage,
    "Student": isStudent,
  };

  print("\n----- Output -----");
  print("Integer: $age");
  print("Double: $percentage");
  print("String: $name");
  print("Boolean: $isStudent");
  print("List: $subjects");
  print("Map: $student");
}