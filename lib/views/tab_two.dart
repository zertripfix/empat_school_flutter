import 'package:empat_school_flutter/models/enums/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class TabTwo extends StatelessWidget {
  const TabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Two'),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: Colors.green[50],

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppPages.tabTwoDetail.name);
          },
          child: Text('Go to Tab Two Detail'),
        ),
      ),
    );
  }
}
