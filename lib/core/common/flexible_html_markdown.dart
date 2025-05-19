import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class FlexibleHtmlMarkdown extends StatelessWidget {
  final String? data;
  const FlexibleHtmlMarkdown({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Html(
        data: data ?? "",
        style: {
          "*": Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
          ),
        },
      ),
    );
  }
}