import 'package:mohit_portfolio/pages/projects/project.dart';

const List<Project> listOfProjects = [
  Project(
    id: 'mohit-portfolio',
    title: 'Mohit Tater - Portfolio Website',
    projectDescription:
        'A personal portfolio portal for myself. I built it using Flutter and enjoyed working on various new things while working on it',
    techStackUsed: [
      TechStack.dart,
      TechStack.flutter,
    ],
    githubLink: 'https://github.com/mnttnm/mohit_portfolio',
    liveProjectLink: 'https://mnttnm.github.io/mohit_portfolio/#/',
    highlights: [
      'VSCode like theme',
      'Flip widget Animation',
      'Riverpod state management',
      'CI/CD support through github actions/pages'
    ],
    thumbnail: 'mohit-portfolio/1.png',
  ),
  Project(
    id: 'brain-basket',
    title: 'Brain Basket',
    projectDescription: 'A book selling platform built with Flutter',
    techStackUsed: [TechStack.dart, TechStack.flutter],
    githubLink: 'https://github.com/mnttnm/brain-basket',
    highlights: [
      'Responsive Design',
      'Payment gateway integration with Razorpay',
      'Thirdparty shipping integration with Shiprocket'
    ],
    thumbnail: 'brain-basket/1.png',
  ),
  Project(
      id: 'equity-trading-clone',
      title: 'Clone: Equity Trading website',
      projectDescription:
          'Built using react and Javascript, the website has most of the UI features that are required for a stock broker platform',
      techStackUsed: [TechStack.react, TechStack.javascript],
      githubLink: 'https://github.com/mnttnm/Equity-Trading-UI',
      highlights: [
        'Real time price change UI',
        'Order basket implementation',
      ]),
  Project(
    id: 'cc-slack-bot',
    title: 'Slack bot for Coding Coach',
    projectDescription:
        'Developed Slack bot for their community channel. Active contribution in their roadmap planning and feature implementations',
    techStackUsed: [
      TechStack.javascript,
    ],
    githubLink: 'https://github.com/Coding-Coach/slack-bot',
    highlights: [
      'Open Source project',
      'Built using slack Botkit',
    ],
    thumbnail: 'cc-bot/1.png',
  ),
  Project(
    id: 'workitout',
    title: 'WorkItOut-Platform for curated workout routines',
    projectDescription:
        'Built using Softr, It was my first attempt of building a website using a nocode tool. It has basic UI but the workout routines are my personal favorite ;)',
    techStackUsed: [TechStack.typescript, TechStack.react],
    liveProjectLink: 'https://kena249.preview.softr.app/',
    highlights: [
      'Exposure to Airtable and Softr',
      'Fun little project built using NoCode tool',
    ],
    thumbnail: 'workitout/1.png',
  ),
];
