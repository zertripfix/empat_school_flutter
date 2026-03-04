import 'package:empat_school_flutter/widgets/animated_bar_chart.dart';
import 'package:flutter/material.dart';

class TabThreeDetail extends StatelessWidget {
  const TabThreeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab Three Detail')),
      body: Center(child: AnimatedBarChart(barsCount: 8)),
    );
  }
}
