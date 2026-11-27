import 'package:material_ui/material_ui.dart';

class CalculatorLogic {
  // A '-' starts a negative number only at the beginning or right after
  // an operator; otherwise it is the subtraction operator.
  static final RegExp _tokenPattern =
      RegExp(r'(?<!\d)-?\d+(?:\.\d+)?|[+\-*/]');

  static List<String> splitInput(String input) => _tokenPattern
      .allMatches(input)
      .map((match) => match.group(0)!)
      .toList();
  

  void calculate(String input)
  {
    List<String> _operands = splitInput(input);

    for (var o in _operands) {
      debugPrint(o);
    }
  }
}
