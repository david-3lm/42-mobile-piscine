import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_clicked ? 'Hello world!' : 'A simple text'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Button pressed');
                  setState(() => _clicked = !_clicked);
                },
                child: Text('Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
