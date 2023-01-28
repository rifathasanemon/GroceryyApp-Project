import 'package:flutter/material.dart';
import 'package:grocery2/Pages/auth_page.dart';

import 'Pages/login_or_register_page.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(

        children: [


          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 40, top: 160),
            child: Image.asset('lib/images/avocado.png'),
          ),


          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "Shop Your Daily Groceries",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          const Text("Fresh Items Everyday"),


          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AuthPage();
                },
              ),
            ),


            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}