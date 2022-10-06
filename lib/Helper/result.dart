import 'package:flutter/material.dart';

class Result extends ChangeNotifier {
  String _result = "0";
  String get getResult {
    return _result;
  }
  void calculate(String num1,String num2,int _value) {
    if(num1!=""&&num2!=""){
      double result = 0;
      double a = double.parse(num1);
      double b = double.parse(num2);
      if (_value == 4 && b == 0) {

          _result = "Error";
          notifyListeners();
      } else {
        switch (_value) {
          case 1:
            result = a + b;
            break;
          case 2:
            result = a - b;
            break;
          case 3:
            result = a * b;
            break;
          case 4:
            result = a / b;
            break;
        }
          _result= result.toString();
          notifyListeners();
      }}
  }
}