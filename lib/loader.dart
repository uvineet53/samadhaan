import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:samadhan/screens/home.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  void moveToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }

  @override
  void initState() {
    super.initState();
    moveToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.black,
          size: 100,
        ),
      ),
    );
  }
}
