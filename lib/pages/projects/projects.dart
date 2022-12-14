import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/pages/projects/project.dart';
import 'package:mohit_portfolio/pages/projects/project_card.dart';
import 'package:mohit_portfolio/pages/projects/projects_state_notifier.dart';
import 'package:mohit_portfolio/widgets/page_content_layout.dart';

final projectProvider =
    StateNotifierProvider<ProjectStateNotifier, ProjectsViewState>((ref) {
  return ProjectStateNotifier();
});

class ProjectPage extends StatelessWidget {
  static const projectPageRoute = 'projects';

  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageContentLayout(
      sideBarChild: ProjectsSideBar(),
      mainAreaChild: ProjectsMainContent(),
      pageTitle: projectPageRoute,
    );
  }
}

class ProjectsMainContent extends ConsumerWidget {
  const ProjectsMainContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerState = ref.watch(projectProvider);

    return Column(
      children: [
        Container(
          height: 35,
          width: double.infinity,
          color: primaryColorDark,
          child: const ProjectsTabElement(),
        ),
        if (providerState.activeProjects!.isEmpty) ...[
          const Expanded(
            child: Center(
              child: Text(
                  'No projects to show with the selected TechStack combination, \n Scope for improvement, one thing at a time ;)'),
            ),
          )
        ] else ...[
          Expanded(
            // Wrap with row/column is another way to implement Grid
            child: SingleChildScrollView(
              child: SizedBox(
                // Required as the scrollbar was not being shown up at the extreme right
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  runSpacing: 30,
                  spacing: 40,
                  children: providerState.activeProjects!
                      .map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      e.title.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: accentPurpleColor),
                                    ),
                                  ),
                                ),
                              ),
                              ProjectCard(project: e),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          // GridView.count(
          //   padding: const EdgeInsets.all(20),
          //   scrollDirection: Axis.vertical,
          //   crossAxisCount: 3,
          //   crossAxisSpacing: 20.0,
          //   mainAxisSpacing: 20.0,
          //   children: providerState.activeProjects!
          //       .map((e) => Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               SizedBox(
          //                 height: 60,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text(
          //                     e.title.toUpperCase(),
          //                     style: Theme.of(context)
          //                         .textTheme
          //                         .labelMedium!
          //                         .copyWith(color: projectTitleColor),
          //                   ),
          //                 ),
          //               ),
          //               Expanded(child: ProjectCard(project: e)),
          //             ],
          //           ))
          //       .toList(),
          // ),
        ]
      ],
    );
  }
}

class ProjectsTabElement extends ConsumerWidget {
  const ProjectsTabElement({
    Key? key,
  }) : super(key: key);

  String getTabTitleForSelection(
      Map<TechStack, bool>? techStackToSelectionMapping) {
    String titleString = '';
    if (techStackToSelectionMapping == null) {
      return titleString;
    }

    techStackToSelectionMapping.forEach((key, value) {
      if (value == true) {
        titleString =
            '${titleString.isEmpty ? '' : '$titleString,'} # ${key.name.toUpperCase()}';
      }
    });
    return titleString.isEmpty ? 'Projects-All' : titleString;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsState = ref.watch(projectProvider);
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        color: primaryColorDarker,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onHover: (hover) {},
              onPressed: () {},
              child: Text(
                getTabTitleForSelection(
                    projectsState.techStackToSelectionMapping),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            IconButton(
              mouseCursor: SystemMouseCursors.click,
              splashRadius: 12,
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                size: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectsSideBar extends ConsumerWidget {
  const ProjectsSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMapping = ref.watch(projectProvider);
    return Column(
      children: TechStack.values
          .map(
            (e) => CheckboxListTile(
              value: currentMapping.techStackToSelectionMapping![e],
              activeColor:
                  currentMapping.techStackToSelectionMapping![e] == true
                      ? accentOrangeColor
                      : accentPurpleColor,
              title: Text(
                e.name,
                style: TextStyle(
                  color: currentMapping.techStackToSelectionMapping![e] == true
                      ? accentOrangeColor
                      : accentPurpleColor,
                ),
              ),
              onChanged: (value) {
                ref
                    .read(projectProvider.notifier)
                    .onTechStackSelectionToggle(e);
              },
            ),
          )
          .toList(),
    );
  }
}
