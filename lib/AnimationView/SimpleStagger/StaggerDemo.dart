import 'package:animation_kit/AnimationView/SimpleStagger/StaggerAnimation.dart';
import 'package:flutter/material.dart';

class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin{

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation(AnimationController controller) async {
    try{
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    }
    on TickerCanceled {
      print("AnimationController is disposed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: Colors.red,
        title: Text("Touch the box", style: TextStyle(color: Colors.black),),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: InkWell(
        onTap: () {
          _playAnimation(controller);
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(
                color:  Colors.black45,
                width: 2
              ),
            ),
            child: StaggerAnimation(
              controller: controller.view,
            ),
          ),
        ),
      ),
    );
  }
}




