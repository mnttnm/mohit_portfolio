import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/resource.dart';

class AboutMePageState {
  const AboutMePageState({required this.openFiles, required this.activeFile});

  final List<Resource>? openFiles;
  final Resource? activeFile;

  AboutMePageState copyWith({List<Resource>? openFiles, Resource? activeFile}) {
    return AboutMePageState(
        openFiles: openFiles ?? this.openFiles,
        activeFile: activeFile ?? this.activeFile);
  }
}

class AboutMeResourceChangeNotifier extends StateNotifier<AboutMePageState> {
  AboutMeResourceChangeNotifier()
      : super(const AboutMePageState(
          openFiles: [],
          activeFile: null,
        ));

  void onSidePanelFileSelection(Resource currentResource) {
    final currentFileIndex = state.openFiles != null
        ? state.openFiles!
            .indexWhere((element) => element.name == currentResource.name)
        : -1;

    if (currentFileIndex < 0) {
      // File is not open, open file and set it to active
      state = state.copyWith(
          openFiles: [...state.openFiles!, currentResource],
          activeFile: currentResource);
    } else {
      // file is already present just set it to the active file
      state = state.copyWith(activeFile: currentResource);
    }
  }

  void onTabPanelFileSelection(Resource currentResource) {
    state = state.copyWith(activeFile: currentResource);
  }

  void onFileClose(Resource activeResource) {
    // we need to remove the selected file and also select new active file
    final tempOpenFiles = [...state.openFiles!];
    final selectedFileIndex = tempOpenFiles
        .indexWhere((element) => element.name == activeResource.name);

    final previousIndex = selectedFileIndex - 1;
    final nextIndex = selectedFileIndex + 1;

    final newActiveFile = previousIndex >= 0
        ? tempOpenFiles[previousIndex]
        : nextIndex < tempOpenFiles.length
            ? tempOpenFiles[nextIndex]
            : null;
    tempOpenFiles.removeAt(selectedFileIndex);

    state = state.copyWith(openFiles: tempOpenFiles, activeFile: newActiveFile);
  }
}

final aboutMeProvider =
    StateNotifierProvider<AboutMeResourceChangeNotifier, AboutMePageState>(
        (ref) {
  return AboutMeResourceChangeNotifier();
});

class FileView extends ConsumerWidget {
  const FileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AboutMePageState currentState = ref.watch(aboutMeProvider);

    return currentState.openFiles!.isEmpty == true
        ? const Text(
            'You can start with about_me section on the left to review profile of Mohit Tater')
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                  color: primaryColorLight,
                  border: Border.all(color: secondaryGreyColor),
                ),
                child: Row(
                  children: currentState.openFiles!.map((e) {
                    return FileTabElement(
                      resource: e,
                    );
                  }).toList(),
                ),
              )
            ],
          );
  }
}

class FileTabElement extends ConsumerWidget {
  const FileTabElement({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final Resource resource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(aboutMeProvider).activeFile == resource;

    return Container(
      padding: const EdgeInsets.all(4.0),
      color: isSelected == true ? primaryColorDark : primaryColorLight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onHover: (hover) {},
            onPressed: () {
              ref
                  .read(aboutMeProvider.notifier)
                  .onTabPanelFileSelection(resource);
            },
            child: Text(
              resource.name,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          if (isSelected == true)
            IconButton(
              mouseCursor: SystemMouseCursors.click,
              splashRadius: 12,
              onPressed: () {
                ref.read(aboutMeProvider.notifier).onFileClose(resource);
              },
              icon: const Icon(
                Icons.close,
                size: 12,
              ),
            )
        ],
      ),
    );
  }
}
