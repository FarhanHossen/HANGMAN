class Users {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? region;
  String? gender;
  int? highScoreEasy;
  int? highScoreMedium;
  int? highScoreHard;
  String? birthDate;
  String? age;
  String? contact;

  Users({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.region,
    this.gender,
    this.highScoreEasy,
    this.highScoreMedium,
    this.highScoreHard,
    this.birthDate,
    this.age,
    this.contact,
  });

  //Receiving Data From Server
  factory Users.fromMap(map) {
    return Users(
      uid: map['Uid'],
      email: map['Email'],
      firstName: map['First Name'],
      lastName: map['Last Name'],
      gender: map['Gender'],
      region: map['Region'],
      highScoreEasy: map['Easy High Score'],
      highScoreMedium: map['Medium High Score'],
      highScoreHard: map['Hard High Score'],
      birthDate: map['Birth Date'],
      age: map['Age'],
      contact: map['Contact'],
    );
  }

  //Sending Data To Server
  Map<String, dynamic> toMap() {
    return {
      'Uid': uid,
      'Email': email,
      'First Name': firstName,
      'Last Name': lastName,
      'Gender': gender,
      'Region': region,
      'Easy High Score': highScoreEasy,
      'Medium High Score': highScoreMedium,
      'Hard High Score': highScoreHard,
      'Birth Date': birthDate,
      'Age': age,
      'Contact': contact,
    };
  }

  Users.fromFirestore(Map<String, dynamic> firestore)
      : email = firestore['Email'],
        firstName = firestore['First Name'],
        lastName = firestore['Last Name'],
        gender = firestore['Gender'],
        region = firestore['Region'],
        highScoreEasy = firestore['Easy High Score'],
        highScoreMedium = firestore['Medium High Score'],
        highScoreHard = firestore['Hard High Score'],
        birthDate = firestore['Birth Date'],
        age = firestore['Age'],
        contact = firestore['Contact'];
}
