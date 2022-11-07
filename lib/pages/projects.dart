import 'package:flutter/material.dart';
import 'package:mohit_portfolio/widgets/page_content_layout.dart';

class ProjectPage extends StatelessWidget {
  static const projectPageRoute = 'projects';

  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageContentLayout(
      sideBarChild: Text('sidebar content'),
      mainAreaChild: Text('projects Page '),
      pageTitle: projectPageRoute,
    );
  }
}
