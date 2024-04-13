import 'package:flutter/material.dart';

class ProgressWheel extends StatelessWidget {
  final double size;
  final double margin;
  final double stroke;

  const ProgressWheel(
      {super.key, required this.size, required this.margin, this.stroke = 4.0});

  @override
  Widget build(BuildContext context) => Center(
      child: Container(
          width: size,
          height: size,
          margin: EdgeInsets.all(margin),
          child: CircularProgressIndicator(strokeWidth: stroke)));
}

class SmallProgressWheel extends StatelessWidget {
  const SmallProgressWheel({super.key});

  @override
  Widget build(BuildContext context) =>
      const ProgressWheel(size: 20, margin: 40);
}

class LargeProgressWheel extends StatelessWidget {
  const LargeProgressWheel({super.key});

  @override
  Widget build(BuildContext context) =>
      const ProgressWheel(size: 80, margin: 0, stroke: 10);
}
