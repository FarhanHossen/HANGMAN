class Users {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? region;
  String? imagePath;
  String? gender;

  Users(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.region,
      this.imagePath,
      this.gender});

  //Receiving Data From Server
  factory Users.fromMap(map) {
    return Users(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        gender: map['gender'],
        region: map['region']);
  }

  //Sending Data To Server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'region': region,
    };
  }
}
