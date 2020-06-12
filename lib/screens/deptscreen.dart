import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samadhan/data/constants.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
String email;

class ChatScreen1 extends StatefulWidget {
  @override
  _ChatScreenState1 createState() => _ChatScreenState1();
}

class _ChatScreenState1 extends State<ChatScreen1> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        email = loggedInUser.email;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Complaints',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              MessagesStream(),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('complaints').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final ignored = message.data['Ignored'];
          final currentDepartment = message.data['current department'];
          final department = message.data['department'];
          final details = message.data['details'];
          final colony = message.data['colony'];
          final consumerId = message.data['consumerId'];
          final house = message.data['house no'];
          final name = message.data['name'];
          final phone = message.data['phone'];
          final status = message.data['status'];
          final date = message.data['date'];
          final ward = message.data['ward no'];
          final village = message.data['village'];
          final complaintId = message.data['trackingId'];
          final adminremark = message.data['Adminremark'] == null
              ? "No Remarks"
              : message.data['Adminremark'];
          final deptremark = message.data['Departmentremark'] == null
              ? "No Remarks"
              : message.data['Departmentremark'];
          String address;
          if (ward == null) {
            address = '$house,$colony,$village';
          } else {
            address = '$house,$colony, Ward Number:$ward';
          }
          final currentUser = loggedInUser.email;
          print('$currentUser');
          final messageBubble = MessageBubble(
            name: name,
            phone: phone,
            complaintId: complaintId.toString(),
            status: status,
            date: date,
            department: department,
            address: address,
            complaint: details,
            adminremark: adminremark,
            deptremark: deptremark,
            ignored: ignored,
            currentDepartment: currentDepartment,
          );

          if (ignored == "") {
            dept(currentDepartment, messageBubbles, messageBubble);
          }
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }

  void dept(department, List<MessageBubble> messageBubbles,
      MessageBubble messageBubble) {
    if (email == 'animalhusb@test.com') {
      if (department == depts[1]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'bdpo@test.com') {
      if (department == depts[2]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'civilhosp@test.com') {
      if (department == depts[3]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'dhbvnurban@test.com') {
      if (department == depts[4]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'dhbvnrural@test.com') {
      if (department == depts[5]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'dtp@test.com') {
      if (department == depts[6]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'eduelementary@test.com') {
      if (department == depts[7]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'eduhigher@test.com') {
      if (department == depts[8]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'firedept@test.com') {
      if (department == depts[9]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'hvpnl@test.com') {
      if (department == depts[10]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'irrigation@test.com') {
      if (department == depts[11]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'nagarparishad@test.com') {
      if (department == depts[12]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'pwd@test.com') {
      if (department == depts[13]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'phwater@test.com') {
      if (department == depts[14]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'phsewage@test.com') {
      if (department == depts[15]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'phwell@test.com') {
      if (department == depts[16]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'socialwelfare@test.com') {
      if (department == depts[17]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'tehsil@test.com') {
      if (department == depts[18]) {
        messageBubbles.add(messageBubble);
      }
    }
  }
}

class MessageBubble extends StatefulWidget {
  MessageBubble(
      {this.complaintId,
      this.name,
      this.isMe,
      this.phone,
      this.address,
      this.date,
      this.remark,
      this.status,
      this.complaint,
      this.department,
      this.trackingId,
      this.adminremark,
      this.deptremark,
      this.ignored,
      this.currentDepartment});

  final String ignored;
  final String currentDepartment;
  final String complaintId;
  final String name;
  final bool isMe;
  final String phone;
  final String address;
  final String date;
  final String remark;
  final String status;
  final String complaint;
  final String department;
  final String trackingId;
  final String adminremark;
  final String deptremark;

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  TextEditingController _controller = new TextEditingController();
  String _selectedDepartment;
  Color _color = Colors.red;
  double width = 200;
  String _status;
  @override
  Widget build(BuildContext context) {
    _selectedDepartment = widget.department;
    _status = widget.status;
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                // ignore: missing_return
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            width: double.infinity,
                            color: Colors.black,
                            child: Text(
                              widget.complaintId,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Status :",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("tapped");
                              setState(() {
                                _firestore
                                    .collection("complaints")
                                    .document(widget.complaintId)
                                    .updateData(
                                  {
                                    'status': widget.status == "Processing"
                                        ? 'Completed'
                                        : 'Processing'
                                  },
                                );
                                _status = widget.status;
                                if (_color == Colors.red) {
                                  _color = Colors.green;
                                } else {
                                  _color = Colors.red;
                                }
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: _color,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                _status,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  var message = Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                    ),
                                    child: TextField(
                                      controller: _controller,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 20),
                                      decoration: InputDecoration(
                                          hintText: widget.adminremark,
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.grey[600],
                                          )),
                                    ),
                                  );
                                  Function onpressed = () {
                                    _firestore
                                        .collection("complaints")
                                        .document(widget.complaintId)
                                        .updateData(
                                      {'Departmentremark': _controller.text},
                                    );
                                    Navigator.of(context).pop();
                                  };
                                  return PlatformAlertDialog(
                                      context,
                                      "Edit Remark",
                                      message,
                                      onpressed,
                                      "Save");
                                },
                              );
                            },
                            child: Text("Change Remark"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Change Department :",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
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
                                      _firestore
                                          .collection("complaints")
                                          .document(widget.complaintId)
                                          .updateData(
                                        {'department': newValue},
                                      );
                                    });
                                    Navigator.pop(context);
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
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
//              _firestore
//                  .collection("complaints")
//                  .document(trackingId)
//                  .updateData(
//                {'colony': 'hi'},
//              );
              print('${widget.address}');
            },
            child: Card(
              elevation: 10,
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey[700],
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '#${widget.complaintId}',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: widget.status == 'Processing'
                        ? Colors.red
                        : Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '${widget.status}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Name:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' ${widget.name}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Phone Number:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' ${widget.phone}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Address:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' ${widget.address}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Date:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' ${widget.date}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Department:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' ${widget.currentDepartment}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Complaint:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' ${widget.complaint}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Admin Remark:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ' ${widget.adminremark}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Dept Remark:',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  ' ${widget.deptremark}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                            _firestore
                                .collection("complaints")
                                .document(widget.complaintId)
                                .updateData(
                              {'Ignored': "yes"},
                            );
                          },
                          child: Text("Ignore"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
