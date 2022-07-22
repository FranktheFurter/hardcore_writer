import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;

  const PageLayout({Key? key, this.header, this.body, this.footer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double padH = 8;
    const double padV = 4;

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            (header == null) ? Container() : Padding(padding: const EdgeInsets.symmetric(horizontal: padH, vertical: padV), child: header),
            (body == null)
                ? const Spacer()
                : Expanded(
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: padH, vertical: padV), child: body),
                  ),
            (footer == null) ? Container() : Padding(padding: const EdgeInsets.symmetric(horizontal: padH, vertical: padV), child: footer),
          ],
        ));
  }
}
