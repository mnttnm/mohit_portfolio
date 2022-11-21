import 'package:flutter/material.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IconLabelButton extends StatelessWidget {
  const IconLabelButton({
    super.key,
    required this.buttonLabel,
    required this.linkUrl,
    required this.iconWidget,
    this.iconColor,
    this.buttonLabelColor,
    this.toolTip,
  });

  final String buttonLabel;
  final String linkUrl;
  final Widget iconWidget;
  final Color? iconColor;
  final Color? buttonLabelColor;
  final String? toolTip;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          buttonLabel,
          style: TextStyle(
            color: buttonLabelColor ?? secondaryGreyColor,
          ),
        ),
        Tooltip(
          message: toolTip ?? '',
          child: IconButton(
            color: iconColor ?? secondaryWhiteColor,
            onPressed: () async {
              await launchUrlString(linkUrl);
            },
            icon: iconWidget,
          ),
        )
      ],
    );
  }
}
