import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,  // Ensures the column does not take infinite height
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation for processing
            SizedBox(  // Wrapping in a SizedBox to give it a specific size
              width: 300,
              height: 300,
              child: Lottie.asset(
                'assets/404.json',
              ),
            ),
            const SizedBox(height: 20),  // Space between animation and text
            // Descriptive text
           Text(
              'You are on the second image!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),  // Space between text and progress message
            // Progress message or tagline
            Text(
              'Press the button to change the image',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
