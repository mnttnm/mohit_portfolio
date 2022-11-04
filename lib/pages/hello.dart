import 'package:flutter/material.dart';
import 'package:mohit_portfolio/header.dart';

class HelloPage extends StatelessWidget {
  static const helloPageRoute = 'hello';
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: Center(
        child: Text('Hello Page'),
      ),
    );
  }
}
