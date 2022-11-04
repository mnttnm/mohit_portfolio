import 'package:flutter/material.dart';
import 'package:mohit_portfolio/header.dart';

class ContactPage extends StatelessWidget {
  static const contactPageRoute = 'contact';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: Center(
        child: Text('Contact Page'),
      ),
    );
  }
}
