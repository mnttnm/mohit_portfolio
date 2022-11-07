import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownFromFileWidget extends StatelessWidget {
  const MarkdownFromFileWidget({super.key, required this.filePath});

  final String filePath;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(filePath),
        builder: (context, snapshot) {
          return Markdown(data: snapshot.data ?? '# No Data');
        });
  }
}
