import 'package:flutter/material.dart';
import 'package:mohit_portfolio/header.dart';

class AboutMePage extends StatelessWidget {
  static const aboutMePageRoute = 'aboutme';
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: Center(
        child: Text('AboutMe Page'),
      ),
    );
  }
}
