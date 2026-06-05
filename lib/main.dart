import 'package:flutter/material.dart';
import 'presentation/pages/Auth/Login.dart';

void main() {
  runApp(const DulceAromaApp());
}

class DulceAromaApp extends StatelessWidget {
  const DulceAromaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dulce Aroma',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const LoginDulce(),
    );
  }
}
