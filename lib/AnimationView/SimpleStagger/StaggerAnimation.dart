import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  StaggerAnimation({Key key, this.controller}):
        opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0, 0.100,
              curve: Curves.ease,
            ),
          ),
        ),

        width = Tween<double>(
          begin: 50,
          end: 150
        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.125, 0.25, curve: Curves.ease))),

        height = Tween<double>(
            begin: 50,
            end: 150
        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.25, 0.375, curve: Curves.easeIn))),

        padding = Tween<EdgeInsets>(
            begin: EdgeInsets.all(20),
            end: EdgeInsets.all(80)
        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.25, 0.375, curve: Curves.easeIn))),

        borderRadius = Tween<BorderRadius>(
            begin: BorderRadius.all(Radius.circular(0)),
            end: BorderRadius.all(Radius.circular(100))
        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.375, 0.5, curve: Curves.easeInOut))),

        color = ColorTween(
            begin: Colors.white,
            end: Colors.orange
        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.easeIn))),

        super(key: key);

  final AnimationController controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder:(context, child) => Container(
        padding: padding.value,
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: opacity.value,
          child: Container(
            width: width.value,
            height: height.value,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3),
              borderRadius: borderRadius.value,
              color: color.value
            ),
          ),
        ),
      ),
    );
  }
}