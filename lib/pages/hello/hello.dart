import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';

class HelloPage extends StatelessWidget {
  static const helloPageRoute = 'hello';
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryColorDark,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Hi all. I am'),
                    Text(
                      'Mohit Tater',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      '> Flutter Developer',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: secondaryBlueColor),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const SweepGradient(
                    colors: [
                      gradientColorGreen,
                      gradientColorBlue,
                      gradientColorGreen
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: gradientColorGreen.withAlpha(200),
                      blurRadius: 30,
                    )
                  ],
                ),
                child: const CircleAvatar(
                  radius: 300,
                  backgroundImage: AssetImage('images/mohit-profile-pic.jpeg'),
                ),
              ),
            )
          ],
        ));
  }
}
