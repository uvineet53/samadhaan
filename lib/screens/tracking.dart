import 'package:flutter/material.dart';
import 'package:samadhan/data/constants.dart';
import 'package:samadhan/services/firestoreService.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _trackingController = new TextEditingController();
  AnimationController _animationController;
  Animation<double> _animation;
  @override
  void dispose() {
    _trackingController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 600));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc);
    _animation.addListener(() => this.setState(() {}));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/track.jpg",
                width: _animation.value * 400,
              ),
              SizedBox(
                height: 10,
              ),
              trackText,
              Container(
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.fromLTRB(20, 7, 30, 7),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(35)),
                child: TextField(
                  controller: _trackingController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(fontSize: 17),
                      enabledBorder: InputBorder.none,
                      labelText: 'Tracking ID',
                      hintText: "Enter your Tracking ID",
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: IconButton(
                    onPressed: () async {
                      if (_trackingController.text != null &&
                          _trackingController.text.length == 16) {
                        String trackID = _trackingController.text;
                        bool check = await checkExist(trackID: trackID);
                        print(check);
                        if (check) {
                          String name =
                              await getTrackingDetails(trackID: trackID);
                          String phone =
                              await getPhoneDetails(trackID: trackID);
                          String dept = await getDeptDetails(trackID: trackID);
                          String currDept =
                              await getCurrDetails(trackID: trackID);
                          String status =
                              await getStatusDetails(trackID: trackID);
                          String date = await getDateDetails(trackID: trackID);
                          trackSheet(name, phone, date, dept, currDept, status,
                              context);
                        } else {
                          showDialog(
                              context: context,
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text(
                                  "TRY AGAIN",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Text("The Tracking ID is incorrect"),
                                actions: <Widget>[
                                  MaterialButton(
                                    child: Text(
                                      "RETRY",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                        }
                      } else {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 800),
                          backgroundColor: Colors.grey,
                          content: Text(
                            "Invalid Tracking ID",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ));
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
