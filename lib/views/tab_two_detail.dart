import 'package:flutter/material.dart';

class TabTwoDetail extends StatelessWidget {
  const TabTwoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab Two Detail')),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: Colors.primaries.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Item $index'),
              tileColor: Colors.primaries[index % Colors.primaries.length],
            ),
          );
        },
      ),
    );
  }
}
