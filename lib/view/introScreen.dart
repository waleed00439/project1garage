import 'package:flutter/material.dart';
import '../constFiles/colors.dart';
import 'home.dart';

class introScreen extends StatelessWidget {
// const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Wafeer',
              style: TextStyle(
                color: primaryColor,
                fontSize: 70,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              onPrimary: Colors.white,
              shadowColor: Colors.teal,
              elevation: 7,
              textStyle: const TextStyle(fontSize: 23),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(220, 50),
            ),
            child: Text('Git Started'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ],
      ),
    );
  }
}
