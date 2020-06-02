import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samadhan/data/constants.dart';

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint>
    with SingleTickerProviderStateMixin {
  final databaseReference = Firestore.instance;
  AnimationController _animationController;
  Animation<double> _animation;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _houseController = new TextEditingController();
  TextEditingController _colonyController = new TextEditingController();
  TextEditingController _detailsController = new TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _selectedDepartment;
  int _wardNumber;
  String _village;
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _houseController.dispose();
    _colonyController.dispose();
    _detailsController.dispose();
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/edit.jpg",
                    width: _animation.value * 350,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          complaintText,
                          SizedBox(
                            height: 25,
                          ),
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
                                  return 'Please enter your name';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Name',
                                  hintText: "Enter your name",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              autocorrect: false,
                              controller: _phoneController,
                              maxLines: 1,
                              validator: (value) {
                                if (value.isEmpty ||
                                    value.length < 1 && value.length > 10) {
                                  return 'Please enter a valid phone number';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Phone',
                                  hintText: "Enter your phone number",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _houseController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.home,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'House No.',
                                  hintText: "Enter your House Number",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _colonyController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.location_city,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Colony',
                                  hintText: "Enter your Colony",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.assignment,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                DropdownButton(
                                  iconEnabledColor: Colors.white,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  focusColor: Colors.black,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[600]),
                                  elevation: 2,
                                  hint: Text(
                                    'Please choose a Department ',
                                    style: TextStyle(color: Colors.grey),
                                  ), // Not necessary for Option 1
                                  value: _selectedDepartment,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedDepartment = newValue;
                                    });
                                  },
                                  items: depts.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.confirmation_number,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                DropdownButton(
                                  iconEnabledColor: Colors.white,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  focusColor: Colors.black,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[600]),
                                  elevation: 2,
                                  hint: Text('  Choose your Ward Number   ',
                                      style: TextStyle(
                                          color: Colors
                                              .grey)), // Not necessary for Option 1
                                  value: _wardNumber,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _wardNumber = newValue;
                                    });
                                  },
                                  items: getWardsList().map((value) {
                                    return DropdownMenuItem(
                                      child: new Text(value.toString()),
                                      value: value,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.assignment,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                DropdownButton(
                                  iconEnabledColor: Colors.white,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  focusColor: Colors.black,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[600]),
                                  elevation: 2,
                                  hint: Text(
                                    'Please choose your Village     ',
                                    style: TextStyle(color: Colors.grey),
                                  ), // Not necessary for Option 1
                                  value: _village,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _village = newValue;
                                    });
                                  },
                                  items: villages.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _detailsController,
                              maxLines: null,
                              validator: (value) {
                                if (value.isEmpty || value.length < 1) {
                                  return 'Please enter details about your issue';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Details of the Issue',
                                  hintText:
                                      "Enter all the details about the issue",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(16),
                            onPressed: () async {
                              if (_selectedDepartment == null &&
                                      _wardNumber == null ||
                                  _village == null) {
                                showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: Text(
                                        "TRY AGAIN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Text(
                                          "Department and either Ward Number or Village is mandatory"),
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
                              if (_formkey.currentState.validate()) {
                                String refNum =
                                    "PWL${_nameController.text.substring(0, 3).toUpperCase()}${_phoneController.text}";
                                print(refNum);
                                await databaseReference
                                    .collection("complaints")
                                    .document(refNum)
                                    .setData({
                                  'name': _nameController.text,
                                  'phone': _phoneController.text,
                                  'house no': _houseController.text,
                                  'colony': _colonyController.text,
                                  'department': _selectedDepartment,
                                  'ward no': _wardNumber,
                                  'village': _village,
                                  'details': _detailsController.text,
                                  'current department': _selectedDepartment,
                                  'date': DateTime.now().toString(),
                                  'status': "Processing"
                                }).then((value) => print("Success"));
                                bottomSheet("SUCCESS!", refNum, context);
                              }
                            },
                            color: Colors.black,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
