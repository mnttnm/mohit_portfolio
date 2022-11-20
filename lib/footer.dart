import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/widgets/icon_label_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      decoration: const BoxDecoration(
        color: primaryColorDark,
        border: Border(
            top: BorderSide(
          color: primaryColorLight,
        )),
      ),
      height: 40,
      child: Row(
        children: [
          IconLabelButton(
            buttonLabel: 'Design By',
            linkUrl: 'https://www.behance.net/darelova',
            iconWidget: Image.asset(
              'assets/icons/yana-darelova.png',
            ),
            buttonLabelColor: secondaryGreyColor,
          ),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          IconLabelButton(
            buttonLabel: 'Built with',
            linkUrl: 'https://flutter.dev/',
            iconWidget: Image.asset(
              'assets/icons/icon_flutter.png',
            ),
            buttonLabelColor: secondaryGreyColor,
          ),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          IconLabelButton(
            buttonLabel: 'Find me on',
            linkUrl: 'https://www.linkedin.com/in/tatermohit/',
            iconWidget: Image.asset(
              'assets/icons/linkedin.png',
              color: secondaryWhiteColor,
            ),
            buttonLabelColor: secondaryGreyColor,
          ),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/twitter.png',
              color: secondaryWhiteColor,
              width: 18,
              height: 18,
            ),
          ),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          const Spacer(),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          IconLabelButton(
            buttonLabel: 'Source code @',
            linkUrl: 'https://github.com/mnttnm/mohit_portfolio',
            iconWidget: Image.asset(
              'assets/icons/github.png',
              color: secondaryWhiteColor,
            ),
            buttonLabelColor: secondaryGreyColor,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
