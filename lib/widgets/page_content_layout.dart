import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';

class PageContentLayout extends StatelessWidget {
  const PageContentLayout(
      {super.key,
      required this.sideBarChild,
      required this.mainAreaChild,
      required this.pageTitle});

  final Widget sideBarChild;
  final Widget mainAreaChild;
  final String pageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorDark,
      body: Row(
        children: [
          Container(
            width: 360,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: secondaryGreyColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(height: 30, child: Text(pageTitle)),
                ),
                Expanded(
                  child: Container(
                    width: 360,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: secondaryGreyColor,
                      ),
                    ),
                    child: sideBarChild,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: mainAreaChild)
        ],
      ),
    );
  }
}
