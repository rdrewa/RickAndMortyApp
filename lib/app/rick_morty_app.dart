import 'package:flutter/material.dart';
import '../feature/home/presentation/screen/home_screen.dart';

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
