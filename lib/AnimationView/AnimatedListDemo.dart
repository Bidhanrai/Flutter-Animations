import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  @override
  _AnimatedListDemoState createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {

  List cityName = ["Kathmandu", "New York", "London"];

  final _myListKey = GlobalKey<AnimatedListState>();

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
      body: SafeArea(
        child: AnimatedList(
          key: _myListKey,
          initialItemCount: cityName.length,
          itemBuilder: (context, index, animation)=>
              slideIt(cityName[index], index, animation),
        ),
      ),
    );
  }

  Widget slideIt(String city, int index, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: ListTile(
        onTap: () {
          removeItem(index, animation);
        },
        title: Text(city),
      ),
    );
  }

  removeItem(int index, Animation<double> animation) async{
    final item = cityName.removeAt(index);
    _myListKey.currentState.removeItem(index, (context, animation) =>
        slideIt(item, index, animation),duration: Duration(milliseconds: 500));
  }
}

