class User {
  int? userId;
  String? username;
  String? email;
  String? password;
  String? token;
 

  User({
    this.userId,
    this.username,
    this.email,
 
    this.password,
    this.token,
  });

  // factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
  //       id: data['id'],
  //       username: data['username'],
  //       password: data['password'],
  //       token: data['token'],
  //     );

  
//   {
//     "pk": 4,
//     "username": "user4A",
//     "email": "u4@gmail.com",
//     "first_name": "",
//     "last_name": ""
// }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['pk'],
      username: json['username'],
      email: json['email'],
 
    );
  }

  dynamic toJson() => {
        'id': userId,
        'username': username,
        'password': password,
        'token': token,
      };
}
