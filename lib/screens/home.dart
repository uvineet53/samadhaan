import 'package:flutter/material.dart';
import 'package:samadhan/data/constants.dart';
import 'package:samadhan/screens/SignTemplate.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "assets/sign.png",
                  height: MediaQuery.of(context).size.height * .55,
                ),
                SizedBox(
                  height: 10,
                ),
                brandText,
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        var icon = Icon(
                          Icons.verified_user,
                          size: 200,
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignTemp(
                            s1: "Admin",
                            s2: "Login",
                            icon: icon,
                          ),
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.verified_user,
                              color: Colors.black,
                              size: 70,
                            ),
                            Text("ADMIN",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        var icon = Icon(
                          Icons.local_printshop,
                          size: 200,
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignTemp(
                            s1: "Dept",
                            s2: "Login",
                            icon: icon,
                          ),
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.local_printshop,
                              color: Colors.black,
                              size: 70,
                            ),
                            Text("DEPARTMENT",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
