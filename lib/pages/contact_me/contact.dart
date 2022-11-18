import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_card.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_form.dart';
import 'package:mohit_portfolio/widgets/page_content_layout.dart';

class ContactPage extends StatelessWidget {
  static const contactPageRoute = 'contact';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageContentLayout(
      sideBarChild: ContactSideBar(),
      mainAreaChild: ContactPageMainContent(),
      pageTitle: contactPageRoute,
    );
  }
}

class ContactPageMainContent extends StatelessWidget {
  const ContactPageMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
          border: Border.all(color: secondaryGreyColor),
        ),
        child: const ContactTabElement(),
      ),
        const ContactCard()
      ],
    );
  }
}

class ContactTabElement extends ConsumerWidget {
  const ContactTabElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(2.0),
        color: primaryColorDark,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onHover: (hover) {},
              onPressed: () {},
              child: const Text(
                'Contact',
              ),
            ),
            IconButton(
              mouseCursor: SystemMouseCursors.click,
              splashRadius: 12,
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                size: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
class ContactSideBar extends StatelessWidget {
  const ContactSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ContactSideBarElement(
          entryIcon: Icon(Icons.contact_phone),
          entryTitle: 'mohit_tater.card',
        ),
        ContactSideBarElement(
          entryIcon: Icon(Icons.message),
          entryTitle: 'mohit_tater.message',
        ),
      ],
    );
  }
}

class ContactSideBarElement extends StatelessWidget {
  const ContactSideBarElement({
    Key? key,
    required this.entryTitle,
    required this.entryIcon,
  }) : super(key: key);

  final String entryTitle;
  final Icon entryIcon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: entryIcon,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(entryTitle),
          ),
        ],
      ),
    );
  }
}
