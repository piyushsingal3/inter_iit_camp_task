import 'package:flutter/material.dart';
import 'package:bootcamp_task/lottie_pages/first_image.dart';
import 'package:bootcamp_task/lottie_pages/second_page.dart';
import 'package:bootcamp_task/component/item_list.dart';
import 'package:bootcamp_task/component/real_timepage.dart';
class ImageChanger extends StatefulWidget {
  @override
  _ImageChangerState createState() => _ImageChangerState();
}

class _ImageChangerState extends State<ImageChanger> {
  bool isImageChanged = false;

  void changeImage() {
    setState(() {
      isImageChanged = !isImageChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Funny enough?')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display a widget conditionally
          isImageChanged 
              ? const First()  // This will display the Notransaction widget
              : const Second(),

          SizedBox(height: 20),

          // Button to change image
          ElevatedButton(
            onPressed: changeImage,
            child: Text('Change Image'),
          ),
           
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>RealTimeDataPage ()),
              );
            },
            child: Text('Go to Real time data Page'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemListPage()),
              );
            },
            child: Text('Go to Second Page'),
          ),
          SizedBox(height: 20),
          

        ],
      ),
    );
  }
}
