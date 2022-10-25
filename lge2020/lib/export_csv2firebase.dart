/*
Exports data from CSV text file to Firebase JSON database
 */

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'firebase_firestore_service.dart';
import 'common_classes.dart';
import 'dart:io';
import 'user.dart';

FirebaseFirestoreService db=new FirebaseFirestoreService();
class ExportData extends StatefulWidget {

  @override
  _ExportState createState() => new _ExportState();
}

class _ExportState extends State<ExportData> {
  List<List<dynamic>> data=[];

  exportConstituencies() async {
    Constituency c=new Constituency.newConstituency("","");
    db.init();
    print("Adding...");
    final myData=await rootBundle.loadString("res/firebase_constituencies.csv");
    print(myData);
    List<List<dynamic>> csvTable=CsvToListConverter().convert(myData);
    data=csvTable;

    for(var i = 0; i < data.length; i++){
      print("Adding: " + data[i][1]) ;
        c=new Constituency(data[i][0].toString(), data[i][1],data[i][2],
            data[i][3],data[i][4],data[i][5],           // Voters
            data[i][6],data[i][7],data[i][8],data[i][9],  // Polling Stations
            data[i][10],data[i][11],data[i][12],        // Booths
            data[i][13],data[i][14]); // RO
        sleep(const Duration(milliseconds:800));
        db.addConstituency(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    db.init();
    // TODO: implement build
    return MaterialApp(
      title: 'Export CSV to Firebase',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(title: new Text("Export CSV to Firebase")),
        body: Column (
          children: <Widget>[
            RaisedButton(

                child: MyButton("Constituencies"),
                onPressed: () async {
                  await exportConstituencies();
                }),
            RaisedButton(
                child: MyButton("Polling Stations"),
                onPressed: () async {
                  await exportPollingStations();
                }),
            RaisedButton(
                child: MyButton("Contesting Candidates"),
                onPressed: () async {
                  await exportCandidates();
                }),
            RaisedButton(
                child: MyButton("Users"),
                onPressed: () async {
                  await exportUsers();
                }),

          ],

        ),

      ),
    );
  }

  Widget MyButton(String str)
  {
    return Container(
        width: double.infinity,
        child: Center(
      child: Text(str),

    )
    );
  }
  exportPollingStations() async {
    PollingStation ps;
    db.init();
    print("Adding Polling Stations...");
    final myData=await rootBundle.loadString("res/firebase_pollingstations.csv");
    //print(myData);
    List<List<dynamic>> csvTable=CsvToListConverter().convert(myData);
    data=csvTable;
    //db.addAllPollingStations(data);


    for(var i = 0; i < data.length; i++){
      ps=new PollingStation(data[i][0].toString(), // psCode
          data[i][1], data[i][2], // NA, PA id
          data[i][3],  data[i][4], // NApsNo, PApsNo
          data[i][5],  data[i][6], // PS Name, type
          data[i][7], data[i][8],data[i][9],           // Voters
          data[i][10], data[i][11],data[i][12],"");    //  Booths

        //if(ps.NAid=="NA-1" || ps.NAid=="NA-2"  || ps.NAid=="NA-10") {
         // print("Adding: " + data[i][0].toString());
          print(data[i].toString());
         // sleep(const Duration(milliseconds:500));
          db.addPollingStation(ps);
        //}
    }
    //sleep(const Duration(minutes: 2));
    print("Completed...");
  }

  exportCandidates() async {
    Candidate c;
    db.init();
    print("Adding Candidates...");
    final myData=await rootBundle.loadString("res/firebase_candidates.csv");
    //print(myData);
    List<List<dynamic>> csvTable=CsvToListConverter().convert(myData);
    data=csvTable;

    for(var i = 0; i < data.length; i++){
      c=new Candidate(data[i][0], // constituency
          data[i][1], data[i][2], // sno, name,
          data[i][3],  data[i][4], // nameUrdu, father
          data[i][5],  data[i][6], data[i][7],// address, party, symbol
           0);    //  Votes
      //if(c.constituency=="NA-10" || c.constituency=="NA-1" || c.constituency=="NA-2") {
        print("Adding: " + data[i][0].toString());
        db.addCandidate(c);
      //}
    }
  }

  exportUsers() async {
    User user;
    db.init();
    print("Adding Users...");
    final myData=await rootBundle.loadString("res/firebase_users.csv");
    //print(myData);
    List<List<dynamic>> csvTable=CsvToListConverter().convert(myData);
    data=csvTable;

    for(var i = 0; i < data.length; i++){
      print("Adding: " + data[i][0].toString());
      user=new User( "+" + data[i][0].toString(), // id
          data[i][1], data[i][2], // name, category
          data[i][3],  "", // jurisdiction, photourl
          0);
          //int.parse(data[i][4]));    //  psCodeAssigned

        db.addUser(user);

    }
  }




}
