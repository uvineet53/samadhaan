import 'package:flutter/material.dart';

List<String> depts = [
  "None",
  "Nagar Parishad",
  "PWD",
  "PUBLIC HEALTH(Water)",
  "Public health(severage)",
  "Public health (reny well)",
  "Irrigation",
  "DHBVN(urban)",
  "DHBVN(rural)",
  "HNPN",
  "Civil Hospital",
  "Fire department",
  "Dist Town planner ",
  "Social Welfare",
  "Education(Elementary)",
  "Education(Higher)",
  "Animal Husbandry",
  "BTPO",
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
