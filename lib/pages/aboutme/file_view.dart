import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/widgets/markdown_renderer.dart';
import 'package:mohit_portfolio/pages/aboutme/about_me_state_notifier.dart';
import 'package:mohit_portfolio/resource.dart';

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
              ),
              Expanded(
                child: MarkdownFromFileWidget(
                  filePath: 'assets/markdowns/${currentState.activeFile!.name}',
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
        mainAxisSize: MainAxisSize.min,
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
