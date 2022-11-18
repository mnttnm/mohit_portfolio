import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard>
    with TickerProviderStateMixin {
  double currentWidth = 500;
  double currentHeight = 300;
  double perspectiveValue = -0.001;
  late Widget cardContent;
  String cardFlipButtonTitle = "Social";
  @override
  void initState() {
    super.initState();
    cardContent = const CardContentProfessionalLinks();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _rotateAnimation =
        Tween<double>(begin: 0, end: pi / 2).animate(_controller);

    _controller.addListener(() {
      setState(() {
        if (_controller.isCompleted == true) {
          perspectiveValue = perspectiveValue * -1;
          if (cardFlipButtonTitle == 'Social') {
            cardContent = const ContactCardSocialLinks();
          } else {
            cardContent = const CardContentProfessionalLinks();
          }
          cardFlipButtonTitle =
              cardFlipButtonTitle == 'Social' ? "Professional" : 'Social';
          _controller.reverse();
        }
      });
    });
  }

  late final AnimationController _controller;
  late Animation<double> _rotateAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: currentWidth,
          height: currentHeight,
          // padding: const EdgeInsets.all(30),
          transformAlignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, perspectiveValue)
            ..rotateY(_rotateAnimation.value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            gradient: const LinearGradient(
              colors: [
                cardGradientColor,
                cardGradientColorLight,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),

            // border: Border.all(color: secondaryGreyColor, width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurStyle: BlurStyle.outer,
                blurRadius: 5,
              ),
            ],
          ),
          child: cardContent,
        ),
        const SizedBox(
          height: 50,
        ),
        IconButton(
          onPressed: () {
            _controller.forward();
          },
          icon: const Icon(
            Icons.flip_camera_android_rounded,
            size: 36,
            color: secondaryWhiteColor,
            shadows: [
              BoxShadow(
                  color: secondaryWhiteColor,
                  blurRadius: 20,
                  spreadRadius: 10,
                  blurStyle: BlurStyle.outer)
            ],
          ),
        ),
      ],
    );
  }
}

class ContactCardSocialLinksLandscape extends StatelessWidget {
  const ContactCardSocialLinksLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: secondaryWhiteColor,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 40),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: primaryColorDark,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Say,',
                        style: TextStyle(
                            color: accentOrangeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                offset: Offset(0, 3),
                                color: primaryColorDark,
                              )
                            ]),
                      ),
                      Text(
                        'Hello!',
                        style: TextStyle(
                          color: secondaryWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: darkGreyColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // width: 200,
              // height: 50,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: secondaryWhiteColor,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SocialMediaLinkIcon(
                      imagePath: 'assets/icons/linkedin.png',
                      url: 'https://linkedin.com/in/tatermohit/',
                    ),
                    SocialMediaLinkIcon(
                      imagePath: 'assets/icons/github.png',
                      url: 'https://github.com/mnttnm',
                    ),
                    SocialMediaLinkIcon(
                      imagePath: 'assets/icons/twitter.png',
                      url: 'https://twitter.com/tatermohit/',
                    ),
                    SocialMediaLinkIcon(
                      imagePath: 'assets/icons/instagram.png',
                      url: 'https://instagram.com/_mohit_tater_/',
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class ContactCardSocialLinks extends StatelessWidget {
  const ContactCardSocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                width: 250,
                height: double.infinity,
                padding: const EdgeInsets.only(left: 40),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(2),
                  ),
                  color: primaryColorDark,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Say,',
                      style: TextStyle(
                          color: accentOrangeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          shadows: [
                            Shadow(
                              blurRadius: 2,
                              offset: Offset(0, 3),
                              color: primaryColorDark,
                            )
                          ]),
                    ),
                    Text(
                      'Hello!',
                      style: TextStyle(
                        color: secondaryWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 80,
                  height: double.infinity,
                  padding: const EdgeInsets.only(left: 40),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    color: darkGreyColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                  ),
                  height: 200,
                  width: 50,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: secondaryWhiteColor,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        SocialMediaLinkIcon(
                          imagePath: 'assets/icons/linkedin.png',
                          url: 'https://linkedin.com/in/tatermohit/',
                        ),
                        SocialMediaLinkIcon(
                          imagePath: 'assets/icons/github.png',
                          url: 'https://github.com/mnttnm',
                        ),
                        SocialMediaLinkIcon(
                          imagePath: 'assets/icons/twitter.png',
                          url: 'https://twitter.com/tatermohit/',
                        ),
                        SocialMediaLinkIcon(
                          imagePath: 'assets/icons/instagram.png',
                          url: 'https://instagram.com/_mohit_tater_/',
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SocialMediaLabel(
                  url: 'https://www.linkedin.com/in/tatermohit/',
                  displayLabel: 'tatermohit',
                ),
                SocialMediaLabel(
                    url: 'https://github.com/mnttnm', displayLabel: 'mnttnm'),
                SocialMediaLabel(
                    url: 'https://twitter.com/tatermohit/',
                    displayLabel: '@tatermohit'),
                SocialMediaLabel(
                    url: 'https://www.instagram.com/_mohit_tater_/',
                    displayLabel: '_mohit_tater_'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SocialMediaLabel extends StatelessWidget {
  const SocialMediaLabel({
    Key? key,
    required this.url,
    required this.displayLabel,
    this.labelColor,
  }) : super(key: key);

  final String url;
  final String displayLabel;
  final Color? labelColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await launchUrlString(url);
      },
      child: Text(
        displayLabel,
        style: TextStyle(
            letterSpacing: 1.3,
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: labelColor ?? primaryColor,
            shadows: const [
              BoxShadow(
                color: primaryColorDark,
                offset: Offset(0.9, 0.7),
              ),
              BoxShadow(
                color: secondaryWhiteColor,
                offset: Offset(-0.5, 0),
              ),
            ]),
      ),
    );
  }
}

class SocialMediaLinkIcon extends StatelessWidget {
  const SocialMediaLinkIcon({
    Key? key,
    required this.imagePath,
    this.iconColor,
    required this.url,
  }) : super(key: key);

  final String imagePath;
  final Color? iconColor;
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrlString(url);
      },
      child: Image(
        image: AssetImage(imagePath),
        width: 32,
        height: 32,
        color: iconColor ?? primaryColor,
      ),
    );
  }
}

class CardContentProfessionalLinks extends StatelessWidget {
  const CardContentProfessionalLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohit Tater'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'Software Developer',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ProfessionalLink(
                        linkText: 'mohittater.iiita@gmail.com',
                        linkIcon: Icons.mail,
                      ),
                      ProfessionalLink(
                        linkText: 'Bangalore, India',
                        linkIcon: Icons.location_on,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: darkGreyColor,
                    )),
                    child: const Image(
                      image: AssetImage('assets/images/mohit-contact-qr.png'),
                      width: 100,
                      height: 100,
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}

class ProfessionalLink extends StatelessWidget {
  const ProfessionalLink({
    Key? key,
    required this.linkText,
    required this.linkIcon,
  }) : super(key: key);

  final String linkText;
  final IconData linkIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: primaryColor,
                width: 2,
              )),
          child: Icon(
            linkIcon,
            color: primaryColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          linkText,
          style: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    );
  }
}
