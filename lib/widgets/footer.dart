import 'package:flutter/material.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/constants/icon_assets.dart';
import 'package:mohit_portfolio/constants/social_links.dart';
import 'package:mohit_portfolio/widgets/icon_label_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            linkUrl: linkedinProfileUrl,
            iconWidget: Image.asset(
              linkedinIconPath,
              color: secondaryWhiteColor,
            ),
            buttonLabelColor: secondaryGreyColor,
          ),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          IconButton(
            onPressed: () async {
              await launchUrlString(twitterProfileUrl);
            },
            icon: Image.asset(
              twitterIconPath,
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
              githubIconPath,
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
