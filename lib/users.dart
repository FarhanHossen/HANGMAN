class Users {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;

  Users({this.uid, this.email, this.firstName, this.lastName});

  //Receiving Data From Server
  factory Users.fromMap(map){
    return Users(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName']
    );
  }

  //Sending Data To Server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName
    };
  }
}