import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/colors/colors.dart';
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

class ExpandableComponent extends StatefulWidget {
  const ExpandableComponent({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final Resource resource;
  @override
  State<ExpandableComponent> createState() => _ExpandableComponentState();
}

class _ExpandableComponentState extends State<ExpandableComponent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: secondaryGreyColor,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded == false
                    ? '> ${widget.resource.name}'
                    : 'v ${widget.resource.name}',
                style: const TextStyle(
                  color: secondaryWhiteColor,
                ),
                textAlign: TextAlign.start,
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
              isActive == true ? accentOrangeColor : secondaryBlueColor,
        ),
        child: Text(
          '|_ ${file.name}',
        ),
        onPressed: () {
          ref.read(aboutMeProvider.notifier).onSidePanelFileSelection(file);
        },
      ),
    );
  }
}
