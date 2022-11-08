import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/pages/projects/projects_state_notifier.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  isHovered == true ? accentOrangeColor : secondaryWhiteColor,
              width: isHovered == true ? 4 : 3),
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHovered == true
              ? [
                  BoxShadow(
                    color: accentOrangeColor.withAlpha(200),
                    blurRadius: 20,
                    blurStyle: BlurStyle.outer,
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: projectCardColor,
                  image: DecorationImage(
                    image: AssetImage(
                      widget.project.thumbnail ??
                          'assets/images/project-placeholder.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.project.projectDescription,
                        style: const TextStyle(
                          color: secondaryGreyColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: () {}, child: const Text('Demo')),
                        IconButton(
                            padding: const EdgeInsets.all(4),
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/icons/github_png256.png',
                              width: 28,
                              height: 28,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
