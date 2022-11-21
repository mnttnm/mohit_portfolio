import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_card.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_form.dart';
import 'package:mohit_portfolio/widgets/page_content_layout.dart';

enum ContactTab { card, contact }

class ContactPage extends StatefulWidget {
  static const contactPageRoute = 'contact';
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ContactTab activeTab = ContactTab.card;

  void onTabSelectionChange(ContactTab selection) {
    setState(() {
      activeTab = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageContentLayout(
      sideBarChild: ContactSideBar(
          onSelectionChange: onTabSelectionChange, activeTab: activeTab),
      mainAreaChild: ContactPageMainContent(
        activeTab: activeTab,
        onTabSelection: onTabSelectionChange,
      ),
      pageTitle: ContactPage.contactPageRoute,
    );
  }
}

class ContactPageMainContent extends StatelessWidget {
  const ContactPageMainContent(
      {super.key, required this.activeTab, required this.onTabSelection});

  final ContactTab activeTab;
  final Function onTabSelection;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 35,
          width: double.infinity,
          color: primaryColorDark,
          child: Row(
            children: [
              ContactTabElement(
                isActive: activeTab == ContactTab.card,
                tabType: ContactTab.card,
                onTabSelection: onTabSelection,
              ),
              ContactTabElement(
                isActive: activeTab == ContactTab.contact,
                tabType: ContactTab.contact,
                onTabSelection: onTabSelection,
              ),
            ],
          ),
        ),
        if (activeTab == ContactTab.card) ...[
          const Expanded(child: ContactCard())
        ] else ...[
          const Expanded(child: ContactForm())
        ]
      ],
    );
  }
}

class ContactTabElement extends ConsumerWidget {
  const ContactTabElement({
    required this.isActive,
    required this.tabType,
    required this.onTabSelection,
    Key? key,
  }) : super(key: key);

  final ContactTab tabType;
  final Function onTabSelection;
  final bool isActive;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(2.0),
        color: isActive ? primaryColorDarker : primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                onTabSelection(tabType);
              },
              child: Text(
                tabType.name.toUpperCase(),
                style: TextStyle(
                  color: isActive ? secondaryWhiteColor : secondaryGreyColor,
                ),
              ),
              
            ),
            IconButton(
              mouseCursor: SystemMouseCursors.click,
              splashRadius: 12,
              onPressed: () {
                onTabSelection(tabType);
              },
              icon: Icon(
                isActive ? Icons.circle : Icons.circle_outlined,
                size: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContactSideBar extends StatelessWidget {
  const ContactSideBar(
      {super.key, required this.onSelectionChange, required this.activeTab});

  final Function onSelectionChange;
  final ContactTab activeTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactSideBarElement(
          isActive: activeTab == ContactTab.card,
          entryIcon: const Icon(Icons.contact_phone),
          tabType: ContactTab.card,
          onTabSelectionChange: onSelectionChange,
        ),
        ContactSideBarElement(
          isActive: activeTab == ContactTab.contact,
          entryIcon: const Icon(Icons.message),
          tabType: ContactTab.contact,
          onTabSelectionChange: onSelectionChange,
        ),
      ],
    );
  }
}

class ContactSideBarElement extends StatelessWidget {
  const ContactSideBarElement({
    Key? key,
    required this.entryIcon,
    required this.tabType,
    required this.onTabSelectionChange,
    required this.isActive,
  }) : super(key: key);

  final ContactTab tabType;
  final Icon entryIcon;
  final Function onTabSelectionChange;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          isActive ? BoxDecoration(color: darkGreyColor.withAlpha(128)) : null,
      child: TextButton(
        onPressed: () {
          onTabSelectionChange(tabType);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: entryIcon,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'mohit_tater.${tabType.name}',
                style: TextStyle(
                    color: isActive ? accentOrangeColor : secondaryGreyColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
