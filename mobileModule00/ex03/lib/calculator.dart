import 'package:ex03/calculator_logic.dart';

class Calculator {
  String input = '0';
  String result = '0';
  bool _justEvaluated = false;

  void press(String label) {
    switch (label) {
      case 'AC':
        _clearAll();
        break;
      case 'C':
        _clearInput();
        break;
      case '=':
        _evaluate();
        break;
      case '+' || '-' || '*' || '/':
        _addOperator(label);
        break;
      case '.':
        _addDecimal();
        break;
      case '00':
        _addZeros();
        break;
      default:
        _addDigit(label);
    }
  }

  void _clearAll() {
    input = '0';
    result = '0';
  }

  void _clearInput() {
    input = '0';
  }

  void _evaluate() {
    CalculatorLogic().calculate(input);
  }

  void _addDecimal() {
    final currentNumber = input.split(RegExp(r'[+\-*/]')).last;
    if (!currentNumber.contains('.')) input += '.';
  }

  void _addOperator(String label) {
    if (RegExp(r'[+\-*/]$').hasMatch(input)) return;
    if (input == '0') input = '';
    input += label;
  }

  void _addDigit(String label) {
    if (_justEvaluated) _startFresh();
    if (input == '0' && label != '.') {
      input = label;
    } else {
      input += label;
    }
  }

  void _addZeros(){
    if (input != '0') input += '00';
  }

  void _startFresh() {
    input = '';
  }
}
