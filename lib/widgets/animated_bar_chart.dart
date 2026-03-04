import 'package:flutter/material.dart';

class AnimatedBarChart extends StatefulWidget {
  const AnimatedBarChart({super.key, required this.maxWidth, required this.duration, this.curve = Curves.easeInOut});

  final double maxWidth;
  final int duration;
  final Curve curve;

  @override
  State<AnimatedBarChart> createState() => _AnimatedBarChartState();
}

class _AnimatedBarChartState extends State<AnimatedBarChart>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    _widthAnimation = Tween<double>(begin: 10, end: widget.maxWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);

    _controller.repeat(reverse: true);
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 50,
              width: _widthAnimation.value,
              color: _colorAnimation.value,
            ),
          );
        },
      ),
    );
  }
}