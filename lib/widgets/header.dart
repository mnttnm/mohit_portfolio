import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/constants/social_links.dart';
import 'package:mohit_portfolio/widgets/footer.dart';
import 'package:mohit_portfolio/pages/aboutme/about_me.dart';
import 'package:mohit_portfolio/pages/contact_me/contact.dart';
import 'package:mohit_portfolio/pages/hello/hello.dart';
import 'package:mohit_portfolio/pages/projects/projects.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: primaryColor,
      // todo: geturedetector is not getting applied on the whole leading widget \
      // only kicking in when the cursor is on the lines, probably it won't be an issue
      // as user will click with fingers.
      leading: GestureDetector(
        onTap: () {
          print('Open');
          Scaffold.of(context).openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ResponsiveRowColumn(
                  layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  columnSpacing: 3,
                  children: const [
                    ResponsiveRowColumnItem(
                      child: TitleBarDefaultButton(
                        buttonColor: closeButtonColor,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: TitleBarDefaultButton(
                        buttonColor: minimiseButtonColor,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: TitleBarDefaultButton(
                        buttonColor: fullscreenButtonColor,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              ResponsiveVisibility(
                hiddenWhen: const [
                  Condition.smallerThan(
                    name: DESKTOP,
                  )
                ],
                child: Expanded(
                  child: Text(
                    'mohit-tater',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      leadingWidth: ResponsiveValue(
        context,
        defaultValue: 400.0,
        valueWhen: const [
          Condition.smallerThan(
            name: DESKTOP,
            value: 100.0,
          )
        ],
      ).value,
      shape: Border.all(color: secondaryGreyColor),
      actions: [
        ResponsiveValue(context,
            defaultValue: Tooltip(
              message: 'Download Resume',
              child: TextButton(
                onPressed: () async {
                  await launchUrlString(resumeUrl);
                },
                style: TextButton.styleFrom(
                  foregroundColor: accentOrangeColor,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.download,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Resume',
                    ),
                    SizedBox(
                      width: 4,
                    )
                  ],
                ),
              ),
            ),
            valueWhen: const [
              Condition.smallerThan(
                  name: DESKTOP,
                  value: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('mohit_tater'),
                  ))
            ]).value!
      ],
      title: const ResponsiveVisibility(
        hiddenWhen: [
          Condition.smallerThan(name: DESKTOP, value: Text('mohit_tater')),
        ],
        child: TabBar(
          isScrollable: true,
          indicatorColor: accentOrangeColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 8,
          labelPadding: EdgeInsets.zero,
          labelColor: secondaryWhiteColor,
          unselectedLabelColor: primaryColorLight,
          tabs: [
            TabElement(title: '_hello'),
            TabElement(title: '_about_me'),
            TabElement(title: '_projects'),
            TabElement(title: '_contact_me'),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class TitleBarDefaultButton extends StatelessWidget {
  const TitleBarDefaultButton({
    super.key,
    required this.buttonColor,
  });

  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ResponsiveValue(
      context,
      defaultValue: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundColor: buttonColor,
          radius: 8,
        ),
      ),
      valueWhen: [
        Condition.smallerThan(
          name: DESKTOP,
          value: Container(
            width: 30,
            height: 5,
            color: buttonColor,
          ),
        )
      ],
    ).value!;
  }
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
      child: DecoratedBox(
        decoration: const BoxDecoration(
            border: Border(
          left: BorderSide(
            color: primaryColorLight,
          ),
        )),
        child: Tab(
          height: 42,
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
      child: SafeArea(
        child: Scaffold(
          appBar: Header(),
          drawer: Drawer(),
          body: TabBarView(
            children: [
              HelloPage(),
              AboutMePage(),
              ProjectPage(),
              ContactPage(),
            ],
          ),
          bottomNavigationBar: Footer(),
        ),
      ),
    );
  }
}
