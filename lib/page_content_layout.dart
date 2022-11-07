import 'package:flutter/material.dart';

class PageContentLayout extends StatefulWidget {
  const PageContentLayout(
      {super.key, required this.sideBarChild, required this.mainAreaChild});

  final Widget sideBarChild;
  final Widget mainAreaChild;
  @override
  State<PageContentLayout> createState() => _PageContentLayoutState();
}

class _PageContentLayoutState extends State<PageContentLayout> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
