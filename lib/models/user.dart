class User{

  final String uid ;
  final String email ;
  final String? username ;
  final String? address ;
  final String? phone;


  User( {
    required this.uid,
    required this.email,
    this.username,
    this.address,
    this.phone,

});


  factory User.fromMap(Map<String ,dynamic> map){

    return User(
      uid : map['uid'] as String ,
      email: map['email'] as String ,
      username: map['username'] as String?,
      address: map['address'] as String?,
      phone: map['phone']  as String?,
    );
  }

  Map<String ,dynamic> toMap(){
    return {
      'uid':uid,
      'email': email,
      'username': username ,
      'address' : address,
      'phone' : phone
    };
  }

}