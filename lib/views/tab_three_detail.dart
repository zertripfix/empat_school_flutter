import 'package:empat_school_flutter/widgets/animated_bar_chart.dart';
import 'package:flutter/material.dart';

class TabThreeDetail extends StatelessWidget {
  const TabThreeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab Three Detail')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedBarChart(maxWidth: 300, duration: 900),
          AnimatedBarChart(maxWidth: 200, duration: 500, curve: const Interval(0.0, 0.6, curve: Curves.easeOut)),
          AnimatedBarChart(maxWidth: 100, duration: 800, curve: const Interval(0.2, 0.6, curve: Curves.easeIn)),
          AnimatedBarChart(maxWidth: 150, duration: 600, curve: const Interval(0.4, 0.6, curve: Curves.elasticInOut)),
          AnimatedBarChart(maxWidth: 220, duration: 900, curve: const Interval(0.6, 1.0, curve: Curves.elasticOut)),
          AnimatedBarChart(maxWidth: 220, duration: 950, curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn)),

        ],
      ),
    );
  }
}
