import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body: Center(
        child: ElevatedButton(child: const Icon(Icons.arrow_forward_ios_outlined),
          onPressed: () {

          },

        ),
      ),
    );
  }
}
