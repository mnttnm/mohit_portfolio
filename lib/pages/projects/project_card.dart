import 'package:flutter/material.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/constants/icon_assets.dart';
import 'package:mohit_portfolio/pages/projects/project.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                    blurRadius: 10,
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
                        widget.project.thumbnail != null
                            ? 'assets/images/projects/${widget.project.thumbnail}'
                            : 'assets/images/project-placeholder.jpeg',
                    ),
                      fit: BoxFit.contain
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: isHovered == true
                          ? accentOrangeColor
                          : secondaryWhiteColor,
                      width: 3,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.project.projectDescription,
                                style: const TextStyle(
                                  color: secondaryGreyColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (widget.project.highlights != null) ...[
                                const Text(
                                  'Highlights',
                                  style: TextStyle(
                                    color: accentOrangeColor,
                                    fontSize: 14,
                                  ),
                                ),
                                ...widget.project.highlights!.map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text('- $e'),
                                  ),
                                )
                              ],
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  ...widget.project.techStackUsed!.map(
                                    (e) => Text(
                                      '#${e.name} ',
                                      style: const TextStyle(
                                        color: accentOrangeColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.project.githubLink != null ||
                          widget.project.liveProjectLink != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Spacer(),
                            if (widget.project.liveProjectLink != null) ...[
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: secondaryWhiteColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    await launchUrlString(
                                        widget.project.liveProjectLink!);
                                  },
                                  child: const Text(
                                    'Demo',
                                    style: TextStyle(
                                      color: secondaryWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                            if (widget.project.githubLink != null)
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: secondaryWhiteColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    await launchUrlString(
                                        widget.project.githubLink!);
                                  },
                                  child: Row(
                                    children: [
                                      const Text(
                                        'source-code',
                                        style: TextStyle(
                                          color: secondaryWhiteColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Image.asset(
                                        githubIconPath,
                                        width: 18,
                                        height: 18,
                                        color: secondaryWhiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ],
                        )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
