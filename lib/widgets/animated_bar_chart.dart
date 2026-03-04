import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBarChart extends StatefulWidget {
  const AnimatedBarChart({
    super.key,
    required this.barsCount,
    this.duration = 1000,
    this.endColorsList = const [
      Colors.pink,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.red,
    ],
  });

  final int barsCount;
  final List<Color> endColorsList;
  final int duration;

  @override
  State<AnimatedBarChart> createState() => _AnimatedBarChartState();
}

class _AnimatedBarChartState extends State<AnimatedBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _widthAnimation;
  late List<Animation<Color?>> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    _widthAnimation = List.generate(widget.barsCount, (index) {
      return Tween<double>(
        begin: 10,
        end: (100 + Random().nextInt(250).toDouble()),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: _buildInterval(index),
        ),
      );
    });

    _colorAnimation = List.generate(widget.barsCount, (index) {
      final colorIndex = index % widget.endColorsList.length;

      return ColorTween(
        begin: Colors.blue,
        end: widget.endColorsList[colorIndex],
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: _buildInterval(index),
        ),
      );
    });

    _controller.repeat(reverse: true);
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Interval _buildInterval(int index) {
    final step = 1.0 / widget.barsCount;
    final start = index * step * 0.7;
    final end = (start + step).clamp(0.0, 1.0);

    return Interval(start.clamp(0.0, 1.0), end, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ListView.builder(
          itemCount: widget.barsCount,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 50,
                width: _widthAnimation[index].value,
                color: _colorAnimation[index].value,
              ),
            );
          },
        );
      },
    );
  }
}
