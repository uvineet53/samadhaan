import 'package:flutter/material.dart';

List<String> depts = [
  "None",
  "Animal Husbandry",
  "BDPO",
  "Civil Hospital",
  "DHBVN(Urban)",
  "DHBVN(Rural)",
  "Distt. Town planner ",
  "Education(Elementary)",
  "Education(Higher)",
  "Fire Department",
  "HVPNL",
  "Irrigation",
  "Nagar Parishad",
  "PWD",
  "PUBLIC HEALTH(Water)",
  "Public health(Sewage)",
  "Public health (Reny Well)",
  "Social Welfare",
  "Tehsil"
];

List<int> getWardsList() {
  List<int> wards = [];
  for (int i = 1; i <= 31; i++) {
    wards.add(i);
  }
  return wards;
}

var brandText = RichText(
  text: TextSpan(
      text: "Sama",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 44,
          letterSpacing: 1,
          color: Colors.black),
      children: <TextSpan>[
        TextSpan(
            text: "dhaan",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 44,
                color: Colors.grey[500],
                fontFamily: "Sans Serif"))
      ]),
);
Widget niceText(String s1, String s2) {
  return RichText(
    text: TextSpan(
        text: s1,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 44,
            letterSpacing: 1,
            color: Colors.black),
        children: <TextSpan>[
          TextSpan(
              text: s2,
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 44,
                  color: Colors.grey[500],
                  fontFamily: "Sans Serif"))
        ]),
  );
}

var complaintText = RichText(
  text: TextSpan(
      text: "File",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 44,
          letterSpacing: 1,
          color: Colors.black),
      children: <TextSpan>[
        TextSpan(
            text: "Complaint",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 44,
                color: Colors.grey[500],
                fontFamily: "Sans Serif"))
      ]),
);

var trackText = RichText(
  text: TextSpan(
      text: "Track",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 44,
          letterSpacing: 1,
          color: Colors.black),
      children: <TextSpan>[
        TextSpan(
            text: "Complaint",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 44,
                color: Colors.grey[500],
                fontFamily: "Sans Serif"))
      ]),
);

var villages = [
  "Dhatir",
  "Allika",
  "Ghughera",
  "Yadupur",
  "Karna",
  "Rajolka",
  "Kakrali",
  "Lalwa",
  "Assavat",
  "Channgu Nagar",
  "Chirwadi",
  "Lalpur Kadim",
  "Milak Ganniki",
  "Pelk",
  "Sihaul",
  "Sujwadi",
  "Taraka",
  "Acheja",
  "Aaya Nagar",
  "Akbarpur Dakor",
  "Badoli",
  "Baadka",
  "Bagpur Kala",
  "Balie",
  "Bholdha",
  "Bhued",
  "Chandhut",
  "Farizanpur Khelda",
  "Ghodi",
  "Gurwadi",
  "Hunsapur",
  "Hoshangabad",
  "Munirgadi",
  "Jevabad Khadli",
  "Kamravali",
  "Kulena",
  "Maksudpur",
  "Kusak",
  "Lalghad",
  "Mustafabad",
  "Mala Singh Farm",
  "Misa",
  "Nagliya Khurd",
  "Zhuppa",
  "Nandawal",
  "Pehruka",
  "Prhaladpur",
  "Rampur Khor",
  "Rasulpur",
  "Dostpur",
  "Rahimpur",
  "Shekpur",
  "Behrampur",
  "Soldha",
  "Sunheri ka Nagla",
  "Bambu Nagla",
  "Sultanpur",
  "Tekri Gujjar",
  "Thantari",
  "Patli Khurd",
  "Ahota",
  "Hidyatpur",
  "Ladhiyaka",
  "Nagal Bhraman",
  "Rundhi",
  "Amroli",
  "Aatva",
  "Ajijabad",
  "Baata",
  "Bela",
  "Bilochpur",
  "Bamariyaka",
  "Bharatgadh",
  "Shedev Nangla",
  "Bhavana",
  "Chvavan ka Nagla",
  "Fatsko Nagar",
  "Gundvas",
  "Hafzavas(Surjan Nagla)",
  "Karimpur",
  "Kashipur",
  "Lulwadhi",
  "Nai Nagla",
  "Peer Gaadi",
  "Raydaska",
  "Sheru ka Nagla",
  "Aatar Chahta",
  "Thappa",
];

Widget bottomSheet(String title, String refNum, BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 46),
            ),
            SizedBox(
              height: 15,
            ),
            Icon(
              Icons.check_circle_outline,
              size: 200,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tracking Number:",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              refNum,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
          ],
        ),
      );
    },
  );
}

Widget trackSheet(String name, String phone, String date, String dept,
    String currdept, String status, BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Name:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Phone Number:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                phone,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Date of Filing Complaint:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                date,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Department",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                dept,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Current Department",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                currdept,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Status",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                status,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget PlatformAlertDialog(BuildContext context, String title, var message,
    Function onPressed, String btnTitle) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    title: Text(title),
    content: message,
    actions: <Widget>[
      FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.black,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(btnTitle),
      )
    ],
  );
}
