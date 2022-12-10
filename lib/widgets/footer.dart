import 'package:flutter/material.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/constants/icon_assets.dart';
import 'package:mohit_portfolio/constants/social_links.dart';
import 'package:mohit_portfolio/widgets/icon_label_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      decoration: const BoxDecoration(
        color: primaryColorDarker,
        border: Border(
            top: BorderSide(
          color: primaryColorLight,
        )),
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconLabelButton(
            buttonLabel: 'Design By',
            linkUrl: 'https://www.behance.net/darelova',
            iconWidget: Image.asset(
              'assets/icons/yana-darelova.png',
            ),
            buttonLabelColor: secondaryGreyColor,
            toolTip: 'Yanka Darelova',
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
            toolTip: 'Flutter',
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
            toolTip: 'Mohit Tater - Linkedin',
          ),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          Tooltip(
            message: 'Mohit Tater - Twitter',
            child: IconButton(
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
          ),
          const VerticalDivider(
            color: secondaryGreyColor,
          ),
          const ResponsiveVisibility(
            hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
            child: Spacer(),
          ),
          IconLabelButton(
            buttonLabel: 'Source code @',
            linkUrl: 'https://github.com/mnttnm/mohit_portfolio',
            iconWidget: Image.asset(
              githubIconPath,
              color: secondaryWhiteColor,
            ),
            buttonLabelColor: secondaryGreyColor,
            toolTip: 'Github',
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
