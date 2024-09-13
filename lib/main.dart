import 'package:flutter/material.dart';
import './component/image_changer.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inter IIT Tech meet',
      home: ImageChanger(),
    );
  }
}