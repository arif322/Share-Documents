import 'package:flutter/material.dart';

class ShareButtonPage extends StatelessWidget {
  final VoidCallback? onClicked;
  final String? text;
  const ShareButtonPage({Key? key, this.text, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        label: Text(
          text ?? "share",
          style: TextStyle(fontSize: 18),
        ),
        icon: Icon(Icons.share),
        onPressed: onClicked,
      );
}
