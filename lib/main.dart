import 'package:flutter/material.dart';
import 'package:portfolio/provider/window_manager.dart';
import 'package:portfolio/widgets/desktop/desktop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WindowManager()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Desktop(),
    );
  }
}
