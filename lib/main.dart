import 'package:flutter/material.dart';

import 'moody_home_page.dart';

void main() {
  runApp(const MoodyApp());
}

class MoodyApp extends StatelessWidget {
  const MoodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoodyHomePage(),
    );
  }
}
