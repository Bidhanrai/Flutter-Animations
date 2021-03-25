import 'package:animation_kit/AnimationView/Hero/HeroAnimationView.dart';
import 'package:animation_kit/AnimationView/SimpleStagger/StaggerDemo.dart';
import 'package:animation_kit/AnimationView/AnimatedListDemo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Animation Kit", style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            ListTile(
              title: Text("Hero Widget"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroAnimationView()));
              },
            ),
            ListTile(
              title: Text("Stagger Animation"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StaggerDemo()));
              },
            ),

            ListTile(
              title: Text("AnimatedList"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimatedListDemo()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
