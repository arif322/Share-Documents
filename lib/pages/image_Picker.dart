import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';

import 'package:share_files_data/buttons/share_button.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? filePath;
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                filePath != null ? Image.file(File("$filePath")) : Container(),
                SizedBox(
                  height: 35,
                ),
                ShareButtonPage(
                  text: "video Picker",
                  onClicked: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? video = await _picker.pickVideo(
                        source: ImageSource.gallery,
                        maxDuration: Duration(minutes: 2));
                    // await _playVideo(video);
                    print("image pic : $video");

                    if (video != null) {
                      setState(() {
                        filePath = video.path;
                        print("video path : ${video.path}");
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
}
