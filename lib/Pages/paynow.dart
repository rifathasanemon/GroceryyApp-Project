import 'package:flutter/material.dart';


class PayNow extends StatelessWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text("Payment",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.green[600],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child:
          Image.network(
            "https://media.tenor.com/IY_nPuVFAiMAAAAC/one-loop-gif.gif"
          ),
      ),

    );
  }
}