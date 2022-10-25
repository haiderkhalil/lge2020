library my_prj.globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'firebase_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
//import 'user.dart';
FirebaseFirestoreService db=new FirebaseFirestoreService();

//bool isLoggedIn=false;
String userName="null";
String userId="null";
String category="null";
String jurisdiction="null";
String photoUrl="https://firebasestorage.googleapis.com/v0/b/haiderfirebaseproject.appspot.com/o/food%2Fuser_photos%2F00.png?alt=media&token=b50a8e7f-f117-44d2-bd46-a6004654f9bb";
String address="null";
String constituency="null";
String constID="null";
int psCode=0;
String district="null";
int psCodeAssigned=0;


Future<bool> isRegistered() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('registered')==null ? false : prefs.getBool('registered');
}

void show()
{

  print("Preferences: userId: " + userId + ", name: " + userName +
          ", cat: " + category + ", Jurisdiction: " + jurisdiction +
          ", constId: " + constID + ", Constituency: " + constituency +
          ", psCode: " + psCode.toString() +
          ", psCodeAssigned: " + psCodeAssigned.toString());
}

void savePreference(String key, String val) async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, val);
}
Future<void> readPreferences () async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getString("userId")==null) {
    userId = "null";
  }
  else {
    userId=prefs.getString("userId");

    readFromPreferences();
    await db.getUserDetails(userId);

    print("After getUserDetails......");
    show();
    prefs.setString("userId", userId);
    prefs.setString("userName", userName);
    prefs.setString("userName", userName);
    prefs.setString("category", category);
    prefs.setString("jurisdiction", jurisdiction);
    prefs.setString("address", address);
    prefs.setString("photoUrl", photoUrl);
    prefs.setInt("psCodeAssigned", psCodeAssigned); // for Polling Staff


  }

  print("After when compelte.......");
  // User Selections
  constID=prefs.getString("constId") ?? "null";
  constituency=prefs.getString("constituency") ?? "null";
  psCode=prefs.getInt("psCode") ?? 0;

  if(category=="Polling Staff")
    constID = jurisdiction;

  if(category=="RO" || category=="DEO")
    constID=jurisdiction;
  if(category=="DEC")
    district=jurisdiction;
  //print("Inside global....");
  //show();
}
void setVariables()
{
  if(category=="DEO")
    constID=jurisdiction;
  if(category=="RO" && constID=="null")
    constID=jurisdiction;
  if(category=="ECP" && constID=="null")
    constID="PK-100";


}
void readFromPreferences() async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //userId=prefs.getString("userId")==null ? "null" : prefs.getString("userId");
  userId=prefs.getString("userId") ?? "null";
  userName=prefs.getString("userName") ?? "null";
  category=prefs.getString("category") ?? "null";
  jurisdiction=prefs.getString("jurisdiction") ?? "null";
  address=prefs.getString("address") ?? "null";
  photoUrl=prefs.getString("photoUrl") ?? "null";
  psCodeAssigned=prefs.getInt("psCodeAssiogned") ?? 0; // for Polling Staff
  constID=prefs.getString("constID") ?? "null";

}