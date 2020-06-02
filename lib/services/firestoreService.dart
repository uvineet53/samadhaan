import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
Future<String> getTrackingDetails({String trackID}) async {
  String res = '';
  await _firestore.collection('complaints').document(trackID).get().then((doc) {
    if (doc.exists) {
      res = doc.data['name'];
    } else {
      // doc.data() will be undefined in this case
      print("No such document!");
    }
  });
  return res;
}

Future<String> getPhoneDetails({String trackID}) async {
  String res = '';
  await _firestore.collection('complaints').document(trackID).get().then((doc) {
    if (doc.exists) {
      res = doc.data['phone'];
    } else {
      // doc.data() will be undefined in this case
      print("No such document!");
    }
  });
  return res;
}

Future<String> getDeptDetails({String trackID}) async {
  String res = '';
  await _firestore.collection('complaints').document(trackID).get().then((doc) {
    if (doc.exists) {
      res = doc.data['department'];
    } else {
      // doc.data() will be undefined in this case
      print("No such document!");
    }
  });
  return res;
}

Future<String> getDateDetails({String trackID}) async {
  String res = '';
  await _firestore.collection('complaints').document(trackID).get().then((doc) {
    if (doc.exists) {
      res = doc.data['date'];
    } else {
      // doc.data() will be undefined in this case
      print("No such document!");
    }
  });
  return res;
}

Future<String> getCurrDetails({String trackID}) async {
  String res = '';
  await _firestore.collection('complaints').document(trackID).get().then((doc) {
    if (doc.exists) {
      res = doc.data['current department'];
    } else {
      // doc.data() will be undefined in this case
      print("No such document!");
    }
  });
  return res;
}

Future<String> getStatusDetails({String trackID}) async {
  String res = '';
  await _firestore.collection('complaints').document(trackID).get().then((doc) {
    if (doc.exists) {
      res = doc.data['status'];
    } else {
      // doc.data() will be undefined in this case
      print("No such document!");
    }
  });
  return res;
}

Future<bool> checkExist({String trackID}) async {
  bool exists = false;
  try {
    await Firestore.instance.document("complaints/$trackID").get().then((doc) {
      if (doc.exists)
        exists = true;
      else
        exists = false;
    });
    return exists;
  } catch (e) {
    return false;
  }
}
