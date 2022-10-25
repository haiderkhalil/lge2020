import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;
import 'dart:async';
import 'package:location/location.dart';

//====================================================
class District {
  String _userId;

  set userId(String n) => userId = n;

  District(this._userId);

  District.map(dynamic obj) {
    this._userId = obj['userId'];
  }

  String get userId => _userId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_userId != null) {
      map['userId'] = _userId;
    }
    return map;
  }

  District.fromMap(Map<String, dynamic> map) {
    this._userId = map['userId'];
  }
}
//===================================================
//====================================================
class Candidate {
  String _constituency;
  int _sno;
  String _name, _nameUrdu, _father, _address, _party, _symbol;
  int _votes;
  String _photoUrl;

  set userId(String n) => userId = n;
  set votes(int n) => _votes=n;

  Candidate(this._constituency, this._sno, this._name, this._nameUrdu,
            this._father, this._address, this._party, this._symbol, this._votes);

  Candidate.map(dynamic obj) {
    this._constituency = obj['constituency'];
    this._sno = obj['sno'];
    this._name = obj['name'];
    this._nameUrdu = obj['nameUrdu'];
    this._father = obj['father'];
    this._address = obj['address'];
    this._party = obj['party'];
    this._symbol = obj['symbol'];
    this._votes = obj['votes'];
    this._photoUrl = obj['photoUrl'];
  }

  String get constituency => _constituency;
  int get sno => _sno ;
  String get name => _name ;
  String get nameUrdu => _nameUrdu;
  String get father => _father;
  String get address => _address;
  String get party => _party;
  String get symbol => _symbol;
  int get votes => _votes;
  String get photoUrl => _photoUrl;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_constituency != null) {
      map['constituency'] = _constituency;
      map['sno'] = _sno;
      map['name'] = _name;
      map['nameUrdu'] = _nameUrdu;
      map['father'] = _father;
      map['address'] = _address;
      map['party'] = _party;
      map['symbol'] = _symbol;
      map['votes'] = _votes;
      map['photoUrl'] = _photoUrl;
    }
    return map;
  }

  Candidate.fromMap(Map<String, dynamic> map) {
    this._constituency = map['constituency'];
    this._sno = map['sno'];
    this._name = map['name'];
    this._nameUrdu = map['nameUrdu'];
    this._father = map['father'];
    this._address = map['address'];
    this._party = map['party'];
    this._symbol = map['symbol'];
    this._votes = map['votes'];
    this._photoUrl = map['photoUrl'];
  }
}
//====================================================
class CandidatePSVotes {
  String _constituency;
  int _sno;
  String _name, _nameUrdu,  _party, _symbol;
  int _votes;
  String _enteredBy;


  set userId(String n) => userId = n;
  set name(String n) => _name = n;
  set nameUrdu(String n) => _nameUrdu = n;
  set party(String n) => _party = n;
  set symbol(String n) => _symbol = n;
  set votes(int n) => _votes=n;
  set enteredBy(String n) => _enteredBy = n;

  CandidatePSVotes(this._sno, this._name, this._nameUrdu,
       this._party, this._symbol, this._votes);

  CandidatePSVotes.map(dynamic obj) {
    this._constituency = obj['constituency'];
    this._sno = obj['sno'];
    this._name = obj['name'];
    this._nameUrdu = obj['nameUrdu'];
    this._party = obj['party'];
    this._symbol = obj['symbol'];
    this._votes = obj['votes'];
    this._enteredBy = obj['enteredBy'];
  }

  String get constituency => _constituency ;
  int get sno => _sno ;
  String get name => _name ;
  String get nameUrdu => _nameUrdu;
  String get party => _party;
  String get symbol => _symbol;
  int get votes => _votes;
  String get enteredBy => _enteredBy;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
      map['constituency'] = _constituency;
      map['sno'] = _sno;
      map['name'] = _name;
      map['nameUrdu'] = _nameUrdu;
      map['party'] = _party;
      map['symbol'] = _symbol;
      map['votes'] = _votes;
      map['enteredBy'] = _enteredBy;
    return map;
  }

  CandidatePSVotes.fromMap(Map<String, dynamic> map) {
    this._constituency = map['constituency'];
    this._sno = map['sno'];
    this._name = map['name'];
    this._nameUrdu = map['nameUrdu'];
    this._party = map['party'];
    this._symbol = map['symbol'];
    this._votes = map['votes'];
    this._enteredBy = map['enteredBy'];
  }
}

//===================================================

class Constituency {
  String _constituency;
  String _id;
  String _district;

  int _votersMale, _votersFemale, _votersTotal,
      _psMale, _psFemale, _psCombined, _psTotal,
      _pbMale, _pbFemale, _pbTotal;
  String _ro, _roContact;

  Constituency.newConstituency(this._id, this._constituency);
  Constituency(this._id, this._constituency, this._district,
              this._votersMale, this._votersFemale, this._votersTotal,
              this._psMale, this._psFemale, this._psCombined, this._psTotal,
              this._pbMale, this._pbFemale, this._pbTotal,
              this._ro, this._roContact);



  Constituency.map(dynamic obj)
  {
    this._constituency=obj['constituency'];
    this._id=obj['id'];
    this._district=obj['district'];
    this._votersMale=obj['votersMale'];
    this._votersFemale=obj['votersFemale'];
    this._votersTotal=obj['votersTotal'];
    this._psMale=obj['psMale'];
    this._psFemale=obj['psFemale'];
    this._psCombined=obj['psCombined'];
    this._psTotal=obj['psTotal'];
    this._pbMale=obj['pbMale'];
    this._pbFemale=obj['pnFemale'];
    this._pbTotal=obj['pbTotal'];
    this._ro=obj['ro'];
    this._roContact=obj['roContact'];
  }



  String get constituency => _constituency;
  String get id => _id;
  String get district => _district;

  int get votersMale => _votersMale;
  int get votersFemale => _votersFemale;
  int get  votersTotal => _votersTotal;

  int get  psMale => _psMale;
  int get  psFemale => _psFemale;
  int get  psCombined => _psCombined;

  int get  psTotal => _psTotal;
  int get  pbMale => _pbMale;
  int get  pbFemale => _pbFemale ;
  int get  pbTotal => _pbTotal;

  String get ro => _ro;
  String get roContact => _roContact;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['constituency'] = _constituency;
    map['id'] = _id;

    map['district'] = _district;
    map['votersMale'] = _votersMale;
    map['votersFemale'] = _votersFemale;
    map['votersTotal'] = _votersTotal;

    map['psMale'] = _psMale;
    map['psFemale'] = _psFemale;
    map['psCombined'] = _psCombined;
    map['psTotal'] = _psTotal;

    map['pbMale'] = _pbMale;
    map['pbFemale'] = _pbFemale;
    map['pbTotal'] = _pbTotal;

    map['ro'] = _ro;
    map['roContact'] = _roContact;
    return map;
  }

  Constituency.fromMap(Map<String, dynamic> map) {
    this._constituency = map['constituency'];
    this._id = map['id'];
    this._district = map['district'];

    this._votersMale = map['votersMale'];
    this._votersFemale = map['votersFemale'];
    this._votersTotal = map['votersTotal'];

    this._psMale = map['psMale'];
    this._psFemale = map['psFemale'];
    this._psCombined = map['psCombined'];
    this._psTotal = map['psTotal'];

    this._pbMale = map['pbMale'];
    this._pbFemale = map['pbFemale'];
    this._pbTotal = map['pbTotal'];

    this._ro = map['ro'];
    this._roContact = map['roContact'];
  }

}

//==============================================================//
class PollingStation {
  String _psCode, _NAid, _PAid;
  int _NApsNo, _PApsNo;
  String _psName, _psType;
  int _votersMale, _votersFemale, _votersTotal,
      _pbMale, _pbFemale, _pbTotal;
  String _resultStatus;  // Uploaded, Entered, Rejected, Awaited
 // PollingStation.newPS(this._id );
  PollingStation(this._psCode, this._NAid, this._PAid,
      this._NApsNo, this._PApsNo,
      this._psName, this._psType,
      this._votersMale, this._votersFemale, this._votersTotal,
      this._pbMale, this._pbFemale, this._pbTotal, this._resultStatus);

  PollingStation.map(dynamic obj)
  {
    this._psCode=obj['psCode'];
    this._NAid=obj['NAid'];
    this._PAid=obj['PAid'];
    this._NApsNo=obj['NApsNo'];
    this._PApsNo=obj['PApsNo'];
    this._psName=obj['psName'];
    this._psType=obj['psType'];

    this._votersMale=obj['votersMale'];
    this._votersFemale=obj['votersFemale'];
    this._votersTotal=obj['votersTotal'];
    this._pbMale=obj['pbMale'];
    this._pbFemale=obj['pnFemale'];
    this._pbTotal=obj['pbTotal'];
    this._resultStatus=obj['resultStatus'];
  }



  String get psCode => _psCode;
  String get NAid => _NAid;
  String get PAid => _PAid;
  int get NApsNo => _NApsNo;
  int get PApsNo => _PApsNo;
  String get psName => _psName;
  String get psType => _psType;

  int get votersMale => _votersMale;
  int get votersFemale => _votersFemale;
  int get  votersTotal => _votersTotal;

  int get  pbMale => _pbMale;
  int get  pbFemale => _pbFemale ;
  int get  pbTotal => _pbTotal;
  String get resultStatus => _resultStatus;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['psCode'] = _psCode;
    map['NAid'] = _NAid;
    map['PAid'] = _PAid;
    map['NApsNo'] = _NApsNo;
    map['PApsNo'] = _PApsNo;
    map['psName'] = _psName ;
    map['psType'] = _psType;

    map['votersMale'] = _votersMale;
    map['votersFemale'] = _votersFemale;
    map['votersTotal'] = _votersTotal;


    map['pbMale'] = _pbMale;
    map['pbFemale'] = _pbFemale;
    map['pbTotal'] = _pbTotal;
    map['resultStatus'] = _resultStatus;

    return map;
  }

  PollingStation.fromMap(Map<String, dynamic> map) {
    this._psCode = map['psCode'];
    this._NAid = map['NAid'];
    this._PAid = map['PAid'];
    this._NApsNo = map['NApsNo'];
    this._PApsNo = map['PApsNo'];
    this._psName = map['psName'];
    this._psType = map['psType'];

    this._votersMale = map['votersMale'];
    this._votersFemale = map['votersFemale'];
    this._votersTotal = map['votersTotal'];


    this._pbMale = map['pbMale'];
    this._pbFemale = map['pbFemale'];
    this._pbTotal = map['pbTotal'];
    this._resultStatus = map['resultStatus'];

  }

}
//==============================================================//
// Polling Station Result
// Polling Station Result

//=======================================================
class PSResultPhoto {
  int _psCode;
  String _NAPA, _NAPAId;
  int _psNo;
  String _timestamp;
  String _sender, _enteredBy, _status;
  Location _location;
  String _photoUrl;

  PSResultPhoto(this._psCode, this._NAPA, this._NAPAId,
  this._psNo, this._timestamp, this._sender, this._enteredBy,
  this._status, this._location, this._photoUrl);

  void display()
  {
    print(_NAPAId +  " psno: " + _psNo.toString() + ", timestamp: " + _timestamp);
  }
  PSResultPhoto.map(dynamic obj)
  {
    this._psCode=obj['psCode'];
    this._NAPA=obj['NAPA'];
    this._NAPAId=obj['NAPAid'];
    this._psNo=obj['psNo'];

    this._sender=obj['sender'];
    this._enteredBy=obj['enteredBy'];
    this._status=obj['status'];
    this._location=obj['location'];
    this._photoUrl=obj['photoUrl'];
    this._timestamp=obj['timestamp'];
  }


  int get psCode => _psCode;
  String get NAPA => _NAPA;
  String get NAPAid => _NAPAId;
  int get psNo => _psNo;

  String get sender => _sender;
  String get enteredBy => _enteredBy;
  String get  status => _status;
  Location get  location => _location;
  String get  photoUrl => _photoUrl;
  String get  timestamp => _timestamp;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['psCode'] = _psCode;
    map['NAPA'] = _NAPA;
    map['NAPAId'] = _NAPAId;
    map['psNo'] = _psNo;

    map['sender'] = _sender;
    map['enteredBy'] = _enteredBy;
    map['status'] = _status;
    map['location'] = _location;
    map['photoUrl'] = _photoUrl;
    map['timestamp'] = _timestamp;


    return map;
  }

  PSResultPhoto.fromMap(Map<String, dynamic> map) {
    this._psCode = map['psCode'];
    this._NAPA = map['NAPA'];
    this._NAPAId = map['NAPAId'];
    this._psNo = map['psNo'];

    this._sender = map['sender'];
    this._status = map['status'];
    this._enteredBy = map['enteredBy'];
    this._location = map['location'];
    this._photoUrl = map['photoUrl'];
    this._timestamp = map['timestamp'];
  }
}

/*
void updatePrefrences({String userId, String userName,
  String category, String photoUrl}) async  {
  print("Inside-1 common funcs");

  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(userId!=null)
    await prefs.setString("userId", userId);
  if(userId!=null)
    await prefs.setString("userName", userName);
  if(category!=null)
    await prefs.setString("category", category);
  if(photoUrl!=null)
    await prefs.setString("photoUrl", category);
  print("Inside-2 common funcs");

  globals.userId=prefs.getString("userId") ?? 'null';
  globals.userName=prefs.getString("userName") ?? '';
  globals.userCategory=prefs.getString("category") ?? 'Customer';
  globals.photoUrl=prefs.getString("photoUrl") ?? '';
  // print("Preferences: userId: " + userId + ", name: " + userName + ", cat: " + category);
}

class CommonFuncs {
}

*/
