import 'package:empat_school_flutter/views/tab_three_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabThree extends StatelessWidget {
  const TabThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Three'),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: Colors.orange[50],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TabThreeDetail()),
            );
          },
          child: Text('Go to Tab Three Detail'),
        ),
      ),
    );
  }
}
