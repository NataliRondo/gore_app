import 'package:flutter/material.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secret Page'),
      ),
      body: const Center(
        child: Text(
          'Log In Successful',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}