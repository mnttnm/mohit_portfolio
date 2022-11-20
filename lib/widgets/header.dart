import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/footer.dart';
import 'package:mohit_portfolio/pages/aboutme/about_me.dart';
import 'package:mohit_portfolio/pages/contact_me/contact.dart';
import 'package:mohit_portfolio/pages/hello/hello.dart';
import 'package:mohit_portfolio/pages/projects/projects.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      backgroundColor: primaryColor,
      leading: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(left: 20),
        child: Text(
          'mohit-tater',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      leadingWidth: 400,
      shape: Border.all(color: secondaryGreyColor),
      title: const TabBar(
        isScrollable: true,
        indicatorColor: accentOrangeColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 8,
        labelPadding: EdgeInsets.zero,
        labelColor: secondaryWhiteColor,
        unselectedLabelColor: secondaryGreyColor,
        tabs: [
          TabElement(title: '_hello'),
          TabElement(title: '_about_me'),
          TabElement(title: '_projects'),
          TabElement(title: '_contact_me'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class TabElement extends StatelessWidget {
  const TabElement({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            border: Border(
          left: BorderSide(
            color: primaryColorLight,
          ),
        )),
        child: Tab(
          text: title,
        ),
      ),
    );
  }
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
    final String location = GoRouter.of(context).location;
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
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: title.contains(location.substring(1)) == true
                  ? Theme.of(context).textTheme.bodyText1!.color
                  : secondaryWhiteColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TabbedHeader extends StatelessWidget {
  const TabbedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: Header(),
        body: TabBarView(children: [
          HelloPage(),
          AboutMePage(),
          ProjectPage(),
          ContactPage(),
          ],
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
