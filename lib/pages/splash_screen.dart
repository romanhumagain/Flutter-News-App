import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Correct widget navigation
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade100,
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "News",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                    ),
                    Text(
                      "Flash",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 37,
                          color: Colors.blue),
                    )
                  ],
                ),
                Text(
                  "Latest News at Your Fingertips.",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            right: 0,
            left: 0,
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.blue, // Adjust color as needed
              size: 50, // Adjust size to a reasonable value (e.g., 50-100)
            ),
          )
        ]),
      ),
    );
  }
}
