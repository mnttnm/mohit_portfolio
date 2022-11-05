import 'package:flutter/material.dart';
class HelloPage extends StatelessWidget {
  static const helloPageRoute = 'hello';
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Hello Page'),
    );
  }
}
