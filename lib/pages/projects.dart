import 'package:flutter/material.dart';
import 'package:mohit_portfolio/header.dart';

class ProjectPage extends StatelessWidget {
  static const projectPageRoute = 'projects';

  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: Center(
        child: Text('Projects Page'),
      ),
    );
  }
}
