import 'package:animation_kit/AnimationView/Hero/HeroAnimationDestination.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroAnimationView extends StatefulWidget {
  @override
  _HeroAnimationViewState createState() => _HeroAnimationViewState();
}

class _HeroAnimationViewState extends State<HeroAnimationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: Colors.red,
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
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroAnimationDestination()));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Touch Me",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Hero(
                tag: "cat",
                //createRectTween: ,
                transitionOnUserGestures: true,
                child: Image.asset("assets/cat.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
