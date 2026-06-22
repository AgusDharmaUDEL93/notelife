import 'package:flutter/material.dart';

class LinkView extends StatelessWidget {
  const LinkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Link View')),
      body: const Center(child: Text('This is the Link View')),
    );
  }
}
