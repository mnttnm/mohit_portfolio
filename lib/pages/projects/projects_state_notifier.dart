import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TechStack { flutter, react, python, typescript, javascript, dart }

const Map<TechStack, bool> initialMapping = {
  TechStack.flutter: false,
  TechStack.react: false,
  TechStack.python: false,
  TechStack.dart: false,
  TechStack.javascript: false,
  TechStack.typescript: false
};

const List<Project> listOfProjects = [
  Project(
      title: 'project 1',
      projectDescription: 'this is project 1',
      techStackUsed: [
        TechStack.dart,
        TechStack.flutter,
      ]),
  Project(
      title: 'project 2',
      projectDescription: 'this is project 2',
      techStackUsed: [TechStack.typescript, TechStack.react]),
  Project(
      title: 'project 3',
      projectDescription: 'this is project 3',
      techStackUsed: [TechStack.python]),
];

class Project {
  final String title;
  final List<TechStack>? techStackUsed;
  final String projectDescription;
  final String? githubLink;
  final String? liveProjectLink;
  final String? thumbnail;

  const Project({
    required this.title,
    this.techStackUsed,
    required this.projectDescription,
    this.githubLink,
    this.liveProjectLink,
    this.thumbnail,
  });
}

@immutable
class ProjectsViewState {
  const ProjectsViewState({
    required this.techStackToSelectionMapping,
    required this.activeProjects,
  });

  final Map<TechStack, bool>? techStackToSelectionMapping;
  final List<Project>? activeProjects;

  ProjectsViewState copyWith({
    Map<TechStack, bool>? techStackMapping,
    List<Project>? projects,
  }) {
    return ProjectsViewState(
      techStackToSelectionMapping: techStackMapping ?? {},
      activeProjects: projects ?? [],
    );
  }
}

class ProjectStateNotifier extends StateNotifier<ProjectsViewState> {
  ProjectStateNotifier()
      : super(const ProjectsViewState(
          techStackToSelectionMapping: initialMapping,
          activeProjects: listOfProjects,
        ));

  void onTechStackSelectionToggle(TechStack selectedTechStack) {
    final currentMapping =
        Map<TechStack, bool>.from(state.techStackToSelectionMapping!);
    currentMapping.update(selectedTechStack, (value) => !value);
    // apply filter on the projects, only show the projects which has all the selected
    // tech stacks

    List<Project> selectedProjects = listOfProjects;
    currentMapping.forEach((key, value) {
      if (value == true) {
        selectedProjects = selectedProjects
            .where(
              (element) => element.techStackUsed!.contains(key),
            )
            .toList();
      }
    });

    state = state.copyWith(
      projects: selectedProjects,
      techStackMapping: currentMapping,
    );
  }
}
