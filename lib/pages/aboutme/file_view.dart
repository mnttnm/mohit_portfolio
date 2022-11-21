import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/pages/aboutme/about_me_state_notifier.dart';
import 'package:mohit_portfolio/resource.dart';

class FileView extends ConsumerWidget {
  const FileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AboutMePageState currentState = ref.watch(aboutMeProvider);

    return currentState.openFiles!.isEmpty == true
        ? const Center(
            child: Text(
              'You can start with about_me section on the left to review profile of Mohit Tater',
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                  color: primaryColor,
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
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: FutureBuilder(
                        future: DefaultAssetBundle.of(context).loadString(
                            'assets/markdowns/${currentState.activeFile!.name}'),
                        builder: (context, snapshot) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data ?? 'No information to show!',
                                style: const TextStyle(
                                  color: secondaryGreyColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: MarkdownFromFileWidget(
                    //     filePath:
                    //         'assets/markdowns/${currentState.activeFile!.name}',
                    //   ),
                    // ),
                  ],
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
      color: isSelected == true ? primaryColorDark : primaryColor,
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
              style: TextStyle(
                color: isSelected == true
                    ? secondaryWhiteColor
                    : primaryColorLight,
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
                size: 14,
              ),
            )
        ],
      ),
    );
  }
}
