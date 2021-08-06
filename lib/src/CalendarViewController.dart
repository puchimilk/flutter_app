import 'package:flutter/material.dart';

class Dog {
  // プロパティ
  String? name;
  int? age;

  // コンストラクタ
  Dog(this.name, this.age);

  // メソッド
  void printer() {
    print(name! + ': ' + age.toString());
  }
}

class Cat extends Dog {
  // プロパティ
  String? name;
  int? age;
  String? gender;
  
  // コンストラクタ
  Cat(this.name, this.age) : super(name, age);
  // 名前付きコンストラクタ
  Cat.pet(this.name, this.age, this.gender) : super(name, age);
  
  void printer() {
    print(name! + ': ' + age.toString() + '[$gender]');
  }
}
