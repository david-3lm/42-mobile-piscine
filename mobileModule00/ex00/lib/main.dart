import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('A simple text'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => debugPrint('Button pressed'),
                child: Text('Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
