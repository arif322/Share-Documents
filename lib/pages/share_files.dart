import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:share_files_data/buttons/share_button.dart';
import 'package:share_files_data/buttons/textfield.dart';
import 'package:share_plus/share_plus.dart';

class ShareFilePage extends StatefulWidget {
  @override
  _ShareFilePageState createState() => _ShareFilePageState();
}

class _ShareFilePageState extends State<ShareFilePage> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> filePaths = [];
  @override
  Widget build(BuildContext context) {
    final RenderObject? box = context.findRenderObject();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldPage(controller: controller),
              SizedBox(
                height: 32,
              ),
              ShareButtonPage(
                onClicked: () async {
                  final result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);
                  if (result != null) {
                    PlatformFile fileList = result.files.first;
                    setState(() {
                      filePaths.add(fileList.path!);
                    });
                  } else {
                    print("file not selected");
                  }
                  if (filePaths.isNotEmpty) {
                    await Share.shareFiles(filePaths, text: controller.text);
                  } else {
                    print("object");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
