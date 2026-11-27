import 'package:ex03/calculator.dart';
import 'package:material_ui/material_ui.dart';

const Color backgroundColor = Color(0xFFE5EDF6);
const Color buttonColor = Color(0xFF9BBCD8);
const Color buttonBorderColor = Color(0xFF4687D9);
const Color accentColor = Color(0xFF355370);
const Color textColor = Color(0xFF0D213B);

const TextStyle textStyle = TextStyle(color: textColor, fontSize: 35);
const TextStyle appBarTextStyle = TextStyle(
  color: backgroundColor,
  fontSize: 35,
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final String title = 'Calculator 4200';
  final _calculator = Calculator();

  void _onButtonPressed(String label) {
    debugPrint('Pressed $label');
    setState(() => _calculator.press(label));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: accentColor),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: ThemeData.light().textTheme.apply(bodyColor: textColor),
      ),
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: accentColor,
            title: Text(title, style: appBarTextStyle),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(_calculator.input, style: textStyle),
                        Text(_calculator.result, style: textStyle),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: _buildKeypad()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    const labels = <String>[
      '7',
      '8',
      '9',
      'C',
      'AC',
      '4',
      '5',
      '6',
      '+',
      '-',
      '1',
      '2',
      '3',
      '*',
      '/',
      '0',
      '.',
      '00',
      '=',
    ];
    return Column(
      children: [
        for (var start = 0; start < labels.length; start += 5)
          Expanded(
            child: Row(
              children: [
                for (final label in labels.skip(start).take(5))
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed(label),
                      style: TextButton.styleFrom(
                        backgroundColor: buttonColor,
                        minimumSize: Size.infinite,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: buttonBorderColor),
                        ),
                      ),
                      child: Text(label, style: textStyle),
                    ),
                  ),
                if (labels.length - start < 5)
                  const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
      ],
    );
  }


}
