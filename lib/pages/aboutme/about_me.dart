import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/pages/aboutme/file_view.dart';
import 'package:mohit_portfolio/pages/aboutme/about_me_state_notifier.dart';
import 'package:mohit_portfolio/pages/aboutme/aboutme_resources_structure.dart';
import 'package:mohit_portfolio/resource.dart';
import 'package:mohit_portfolio/widgets/page_content_layout.dart';

class AboutMePage extends StatelessWidget {
  static const aboutMePageRoute = 'aboutme';
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContentLayout(
      pageTitle: aboutMePageRoute,
      mainAreaChild: const FileView(),
      sideBarChild: CategoryStructure(
        categoryResourceTree: aboutMeResourceStructure,
      ),
    );
  }
}

class CategoryStructure extends StatelessWidget {
  const CategoryStructure({super.key, required this.categoryResourceTree});

  final ResourceTree categoryResourceTree;
  @override
  Widget build(BuildContext context) {
    if (categoryResourceTree.treeStructure == null ||
        categoryResourceTree.treeStructure!.isEmpty == true) {
      return const Text('No structure to show');
    } else {
      return Column(
        children: categoryResourceTree.treeStructure!.map((e) {
          if (e.type == ResourceType.folder) {
            return ExpandableComponent(resource: e);
          } else {
            return ExpandedFile(
              file: e,
            );
          }
        }).toList(),
      );
    }
  }
}

class ExpandableComponent extends ConsumerStatefulWidget {
  const ExpandableComponent({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final Resource resource;
  @override
  ExpandableComponentState createState() => ExpandableComponentState();
}

class ExpandableComponentState extends ConsumerState<ExpandableComponent> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    if (ref.read(aboutMeProvider).openFiles != null &&
        ref.read(aboutMeProvider).openFiles!.length == 1 &&
        widget.resource.name == 'personal') {
      isExpanded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                children: [
                  Text(
                    isExpanded == false ? '>' : 'v',
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.folder,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.resource.name,
                    style: const TextStyle(
                      color: secondaryWhiteColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded == true &&
            widget.resource.children!.isEmpty != true) ...[
          ...widget.resource.children!.map(
            (e) {
              if (e.type == ResourceType.folder) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ExpandableComponent(resource: e),
                );
              } else {
                return ExpandedFile(
                  file: e,
                );
              }
            },
          ).toList()
        ]
      ],
    );
  }
}

class ExpandedFile extends ConsumerWidget {
  const ExpandedFile({
    Key? key,
    required this.file,
  }) : super(key: key);

  final Resource file;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AboutMePageState aboutMePageState = ref.watch(aboutMeProvider);

    final isActive = aboutMePageState.activeFile != null &&
        aboutMePageState.activeFile!.name == file.name;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: TextButton(
        // Todo: fix issue where the active file color is not restoring to default if \
        // it is the last file which is being closed.
        style: TextButton.styleFrom(
          foregroundColor:
              isActive == true ? accentOrangeColor : primaryColorLight,
        ),
        child: Row(
          children: [
            const Text(
              '|_',
            ),
            Image.asset(
              'assets/icons/markdown.webp',
              color: secondaryWhiteColor,
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(file.name),
          ],
        ),
        onPressed: () {
          ref.read(aboutMeProvider.notifier).onSidePanelFileSelection(file);
        },
      ),
    );
  }
}
