import 'package:flutter_riverpod/flutter_riverpod.dart';
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
