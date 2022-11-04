import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: primaryColor,
      child: const Center(child: Text('Hello Page')),
    );
  }
}
