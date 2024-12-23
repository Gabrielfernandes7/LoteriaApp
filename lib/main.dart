import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MegaSenaApp());
}

class MegaSenaApp extends StatelessWidget {
  const MegaSenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MegaSena',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MegaSenaHomePage(),
      debugShowCheckedModeBanner: false,
      locale: Locale('pt', 'BR'), // Example for Brazilian Portuguese
    );
  }
}
