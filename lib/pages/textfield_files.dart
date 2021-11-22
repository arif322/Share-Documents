import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:share_files_data/buttons/share_button.dart';
import 'package:share_files_data/buttons/textfield.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldPage(controller: controller),
                SizedBox(
                  height: 20,
                ),
                ShareButtonPage(
                  onClicked: () {
                    if (controller.text.isEmpty) {
                      print("upps... is empty");
                    } else {
                      Share.share(controller.text);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
}
