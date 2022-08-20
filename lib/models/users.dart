class Users {
  String? uid;
  String? email;
  String? userName;
  String? region;
  int? highScoreEasy;
  int? highScoreMedium;
  int? highScoreHard;

  Users({
    this.uid,
    this.email,
    this.userName,
    this.region,
    this.highScoreEasy,
    this.highScoreMedium,
    this.highScoreHard,
  });

  //Receiving Data From Server
  factory Users.fromMap(map) {
    return Users(
      uid: map['Uid'],
      email: map['Email'],
      userName: map['User Name'],
      region: map['Region'],
      highScoreEasy: map['Easy High Score'],
      highScoreMedium: map['Medium High Score'],
      highScoreHard: map['Hard High Score'],
    );
  }

  //Sending Data To Server
  Map<String, dynamic> toMap() {
    return {
      'Uid': uid,
      'Email': email,
      'User Name': userName,
      'Easy High Score': highScoreEasy,
      'Medium High Score': highScoreMedium,
      'Hard High Score': highScoreHard,
    };
  }

  Users.fromFirestore(Map<String, dynamic> firestore)
      : email = firestore['Email'],
        userName = firestore['User Name'],
        region = firestore['Region'],
        highScoreEasy = firestore['Easy High Score'],
        highScoreMedium = firestore['Medium High Score'],
        highScoreHard = firestore['Hard High Score'];
}
