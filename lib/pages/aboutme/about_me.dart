import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/pages/aboutme/aboutme_resources_structure.dart';
import 'package:mohit_portfolio/resource.dart';

class AboutMePage extends StatelessWidget {
  static const aboutMePageRoute = 'aboutme';
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
            color: secondaryGreyColor,
          )),
        ),
        Container(
          width: 360,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
            color: secondaryGreyColor,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(aboutMeResourceStructure.treeTitle),
              CategoryStructure(
                categoryResourceTree: aboutMeResourceStructure,
              )
            ],
          ),
        ),
      ],
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
            return TextButton(
              child: Text(
                e.name,
              ),
              onPressed: () => {},
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
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                    child: Text('|_ ${e.name}'),
                    onPressed: () {},
                  ),
                );
              }
            },
          ).toList()
        ]
      ],
    );
  }
}
