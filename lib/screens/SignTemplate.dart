import 'package:flutter/material.dart';
import 'package:samadhan/data/constants.dart';

class SignTemp extends StatelessWidget {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  final String s1, s2;
  final Icon icon;
  GlobalKey<FormState> _formKey = new GlobalKey();
  SignTemp({this.s1, this.s2, this.icon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                icon,
                SizedBox(
                  height: 15,
                ),
                niceText(s1, s2),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FormUI(context),
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {},
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
              controller: _nameController,
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty || value.length < 1) {
                  return 'Please enter your username';
                }
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
              controller: _passController,
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty || value.length < 1) {
                  return 'Please enter your password';
                }
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
