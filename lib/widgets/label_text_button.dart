import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LabelTextButton extends StatelessWidget {
  const LabelTextButton({
    super.key,
    required this.buttonLabel,
    required this.linkUrl,
    required this.linkLabel,
    this.linkTextColor,
    this.buttonLabelColor,
  });

  final String buttonLabel;
  final String linkUrl;
  final String linkLabel;
  final Color? linkTextColor;
  final Color? buttonLabelColor;
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
        TextButton(
          onPressed: () async => await launchUrlString(linkUrl),
          child: Text(
            linkLabel,
            style: TextStyle(color: linkTextColor ?? secondaryBlueColor),
          ),
        ),
      ],
    );
  }
}
