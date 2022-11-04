import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/pages/about_me.dart';
import 'package:mohit_portfolio/pages/contact.dart';
import 'package:mohit_portfolio/pages/hello.dart';
import 'package:mohit_portfolio/pages/projects.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(left: 20),
        child: Text(
          'mohit-tater',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      leadingWidth: 300,
      // shape: Border.all(color: secondaryGreyColor),
      title: Row(
        children: const [
          NavElement(
            title: '_hello',
            urlPath: HelloPage.helloPageRoute,
          ),
          NavElement(
            title: '_about_me',
            urlPath: AboutMePage.aboutMePageRoute,
          ),
          NavElement(
            title: '_projects',
            urlPath: ProjectPage.projectPageRoute,
          ),
          NavElement(
            title: '_contact_me',
            urlPath: ContactPage.contactPageRoute,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class NavElement extends StatelessWidget {
  const NavElement({
    Key? key,
    required this.title,
    required this.urlPath,
  }) : super(key: key);

  final String title;
  final String urlPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 56,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(border: Border.all(color: secondaryGreyColor)),
      child: TextButton(
        onPressed: () => {
          GoRouter.of(context).goNamed(urlPath),
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
