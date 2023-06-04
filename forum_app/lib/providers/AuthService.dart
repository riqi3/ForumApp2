// import 'dart:async';
// import 'dart:convert';
// import 'package:forum_app/models/UserModel.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/UserModel.dart';



class AuthService {


  // Future<RegistrationResponse?> registration(
  //     String username, String password, String email) async {
  //   var response = await http.post(registrationUri, body: {
  //     "username": username,
  //     "email": email,
  //     "password": password,
  //   });
  //   return RegistrationResponse.fromJson(jsonDecode(response.body));
  // }

// Future<LoginResponse?> login(
  Future<dynamic>? userAuth(
      String username, String email, String password) async {
    Map body = {
      "username": username,
      "email": email,
      "password": password,
    };
    var response = await http.post(loginUri, body: body);
    // return LoginResponse.fromJson(jsonDecode(response.body));
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      String token = json['key'];
      var box = await Hive.openBox(tokenBox);
      box.put('token', token);
      User? user = await getUser(token);
      return user;
    } else {
      Map json = jsonDecode(response.body);
      if (json.containsKey('email')) {
        return json['email'][0];
      }
      if (json.containsKey('password')) {
        return json['password'][0];
      }
      if (json.containsKey('non_field_errors')) {
        return json['non_field_errors'][0];
      }
    }
  }

  Future<dynamic>? userRegister(
      String username, String email, String password1, String password2) async {
    Map body = {
      "username": username,
      "email": email,
      "password1": password1,
      "password2": password2,
    };
    var response = await http.post(registrationUri, body: body);
    // return LoginResponse.fromJson(jsonDecode(response.body));
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map json = jsonDecode(response.body);
      String token = json['key'];
      var box = await Hive.openBox(tokenBox);
      box.put('token', token);
      User? user = await getUser(token);
      return user;
    } else if (response.statusCode == 400) {
      Map json = jsonDecode(response.body);
      if (json.containsKey('email')) {
        return json['email'][0];
      }
      if (json.containsKey('password')) {
        return json['password'][0];
      }
      if (json.containsKey('non_field_errors')) {
        return json['non_field_errors'][0];
      }
      return const Response(statusCode: 400);
    } else if (response.statusCode == 204) {
      return const Response(statusCode: 204);
      // Map json = jsonDecode(response.body);
      // if (json.containsKey('email')) {
      //   return json['email'][0];
      // }
      // if (json.containsKey('password')) {
      //   return json['password'][0];
      // }
      // if (json.containsKey('non_field_errors')) {
      //   return json['non_field_errors'][0];
      // }
    }
  }

  Future<User?> getUser(String token) async {
    var response = await http.get(userUri, headers: {
      'Authorization': 'Token $token',
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      User user = User.fromJson(json);
      user.token = token;
      return user;
    } else {
      return null;
    }
  }

    Future<void> logoutUser(String token) async {
    var response = await http.post(logoutUri, headers: {
      'Authorization': 'Token $token',
    });
print(response.body);
 
  }

  // Future<User?> postUser(
  //     String username, String email, String password1, String password2) async {
  //   var response = await http.post(registrationUri, headers: {
  //     "username": username,
  //     "email": email,
  //     "password1": password1,
  //     "password2": password2,
  //   });

  //   if (response.statusCode == 200) {
  //     var json = jsonDecode(response.body);
  //     User user = User.fromJson(json);
  //     user.token = token;//tiwason
  //     return user;
  //   } else {
  //     return null;
  //   }
  // }
}


// class LoginResponse {
//   dynamic? key;
//   List<dynamic>? non_field_errors;
//   LoginResponse({this.key, this.non_field_errors});

//   factory LoginResponse.fromJson(mapOfBody) {
//     return LoginResponse(
//       key: mapOfBody['key'],
//       non_field_errors: mapOfBody['non_field_errors'],
//     );
//   }
// }

// class RegistrationResponse {
//   List<dynamic>? non_field_errors;
//   List<dynamic>? password;
//   List<dynamic>? username;
//   List<dynamic>? email;
//   dynamic? key;

//   RegistrationResponse({
//     this.email,
//     this.non_field_errors,
//     this.password,
//     this.username,
//     this.key,
//   });

//   factory RegistrationResponse.fromJson(mapOfBody) {
//     return RegistrationResponse(
//       username: mapOfBody['username'],
//       password: mapOfBody['password'],
//       email: mapOfBody['email'],
//       key: mapOfBody['key'],
//       non_field_errors: mapOfBody['non_field_errors'],
//     );
//   }
// }
