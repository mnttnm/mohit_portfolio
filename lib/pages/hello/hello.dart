import 'package:flutter/material.dart';
import 'package:mohit_portfolio/constants/colors.dart';

class HelloPage extends StatelessWidget {
  static const helloPageRoute = 'hello';
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryColorDarker,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.waving_hand,
                          color: accentOrangeColor,
                          size: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Hello there, I am;',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: primaryColorLight,
                                  ),
                        ),
                      ],
                    ),
                    Text(
                      'Mohit Tater',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '> Software Developer',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: secondaryBlueColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '/* I am currently looking for new Opportunity!',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: secondaryGreyColor,
                          ),
                    ),
                    Row(
                      children: [
                        const Text(' * Let\'s'),
                        TextButton(
                            onPressed: () {
                              DefaultTabController.of(context)!.animateTo(3);
                            },
                            child: const Text(
                              'connect,',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                        const Text('if you are looking'),
                      ],
                    ),
                    const Text(' * for Flutter developer'),
                    const Text(' */'),
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
