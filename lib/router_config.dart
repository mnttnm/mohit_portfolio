import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mohit_portfolio/widgets/header.dart';
import 'package:mohit_portfolio/pages/aboutme/about_me.dart';

import 'pages/contact.dart';
import 'pages/hello/hello.dart';
import 'pages/projects.dart';

GoRouter getRouterConfig(BuildContext context) => GoRouter(
      routes: <GoRoute>[
        GoRoute(
            path: '/',
            name: HelloPage.helloPageRoute,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage(
                  child: TabbedHeader(),
                ),
            routes: [
              GoRoute(
                name: AboutMePage.aboutMePageRoute,
                path: AboutMePage.aboutMePageRoute,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(
                  child: AboutMePage(),
                ),
              ),
              GoRoute(
                name: ProjectPage.projectPageRoute,
                path: ProjectPage.projectPageRoute,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(
                  child: ProjectPage(),
                ),
              ),
              GoRoute(
                name: ContactPage.contactPageRoute,
                path: ContactPage.contactPageRoute,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(
                  child: ContactPage(),
                ),
              ),
            ]),
      ],
    );
