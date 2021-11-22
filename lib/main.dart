import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_files_data/pages/image_Picker.dart';
import 'package:share_files_data/pages/share_files.dart';
import 'package:share_files_data/pages/textfield_files.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = " Sharing Documents";
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        bottomNavigationBar: buildBottomBar(),
        body: buildPage(),
      );
  Widget buildBottomBar() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: " picked Image",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: "Share Text",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: "Share files",
          ),
        ],
        onTap: (int index) => setState(() => this.index = index),
      );

  Widget buildPage() {
    switch (index) {
      case 0:
        return ImagePickerPage();
      case 1:
        return ShareFilePage();
      case 2:
        return TextPage();
      default:
        return Container();
    }
  }
}
