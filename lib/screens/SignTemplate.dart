import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samadhan/data/constants.dart';
import 'package:samadhan/screens/deptscreen.dart';
import 'adminscreen.dart';

class SignTemp extends StatefulWidget {
  final String s1, s2;
  final Icon icon;
  SignTemp({this.s1, this.s2, this.icon});
  @override
  _SignTempState createState() => _SignTempState();
}

class _SignTempState extends State<SignTemp> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  GlobalKey<FormState> _formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                widget.icon,
                SizedBox(
                  height: 15,
                ),
                niceText(widget.s1, widget.s2),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FormUI(context),
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email + '@test.com', password: password);
                      if (user != null) {
                        if (email == 'deepakmangla') {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen();
                            },
                          ));
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen1();
                            },
                          ));
                        }
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } on PlatformException catch (e) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          Function onpressed = () {
                            Navigator.of(context).pop();
                          };
                          return PlatformAlertDialog(context, "Sign In",
                              Text(e.message), onpressed, "Retry");
                        },
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.all(15),
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text(
                    "SUMBIT",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty || value.length < 1) {
                  return 'Please enter your username';
                }
              },
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black,
                  ),
                  enabledBorder: InputBorder.none,
                  labelText: 'Userame',
                  hintText: "Enter your username",
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty || value.length < 1) {
                  return 'Please enter your password';
                }
              },
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    size: 40,
                    color: Colors.black,
                  ),
                  enabledBorder: InputBorder.none,
                  labelText: 'Password',
                  hintText: "Enter your password",
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid)),
            ),
          ),
        ],
      ),
    );
  }
}
