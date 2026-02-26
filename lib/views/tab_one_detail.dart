import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabOneDetail extends StatelessWidget {
  final List<String> options;

  const TabOneDetail({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose an option')),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                context.pop(options[index]);
              },
              child: Text('Choose ${options[index]}'),
            );
          },
        ),
      ),
    );
  }
}
