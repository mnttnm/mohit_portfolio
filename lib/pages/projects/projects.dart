import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/colors/colors.dart';
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
      children:
          providerState.activeProjects!.map((e) => Text(e.title)).toList(),
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
