import 'package:flutter/material.dart';

class HeroAnimationDestination extends StatefulWidget {
  @override
  _HeroAnimationDestinationState createState() => _HeroAnimationDestinationState();
}

class _HeroAnimationDestinationState extends State<HeroAnimationDestination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: CustomPaint(
                  size: Size.infinite,
                  painter: ProfileCardPainter(color: Colors.orangeAccent),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_outlined, color: Colors.white, size: 30,),
                  ),
                ),
              ),
              // Positioned(
              //   top: 10,
              //   child: SafeArea(child: Text('I am Cat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)),
              // ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.18,
                child: Hero(
                  tag: "cat",
                  //createRectTween: ,
                  transitionOnUserGestures: true,
                  child: Image.asset(
                    "assets/cat.png",height: 180,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileCardPainter extends CustomPainter {
  ProfileCardPainter({@required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0,size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.2, size.height, size.width,size.height * 0.8);
    path.lineTo(size.width,0);
    path.lineTo(0,0);
    path.close();
    // canvas.drawLine(Offset(0,size.height * 0.2), Offset(size.width,size.height * 0.8), paint);
    // canvas.drawLine(Offset(size.width,0), Offset(size.width,size.height * 0.8), paint);
    canvas.drawPath(path, paint);
  }


  @override
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
