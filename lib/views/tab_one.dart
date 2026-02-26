import 'package:empat_school_flutter/models/enums/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class TabOne extends StatelessWidget {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab One'),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: Colors.cyan[50],
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String? selectedOption = await context.pushNamed(
              AppPages.tabOneDetail.name,
              extra: ['Option A', 'Option B', 'Option C'],
            );

            if (selectedOption != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You selected: $selectedOption')),
              );
            }
          },
          child: Text('Choose an option'),
        ),
      ),
    );
  }
}
