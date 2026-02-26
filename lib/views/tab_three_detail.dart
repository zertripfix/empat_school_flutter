import 'package:flutter/material.dart';

class TabThreeDetail extends StatelessWidget {
  const TabThreeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab Three Detail')),
      body: Center(
        child: Text('This is the detail view for Tab Three'),
      ),
    );
  }
}
