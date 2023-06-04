import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/SectionModel.dart';
 
import '../models/UserModel.dart';


class SectionProvider with ChangeNotifier {
  SectionProvider() {
    fetchSection();
  }
 
  List<SectionModel> _sections = [];
  // final List<SectionModel> _topics = [];

  List<SectionModel> get allSections =>
      _sections.where((section) => section.isPosted == false).toList();
  // List<SectionModel> get allTopics =>
  //     _topics.where((section) => section.isPosted == false).toList();
 

  // void toggleSection(SectionModel section) {
  //   final sectionIndex = sections.indexOf(section);
  //   sections[sectionIndex].toggleCompleted();
  //   notifyListeners();
  // }

 

  bool empty() {
    return _sections.isEmpty;
  }

  bool notEmpty() {
    return _sections.isNotEmpty;
  }

 

  void deleteSection(User user, SectionModel section) async {
    final url = 'http://10.0.2.2:8000/usera/sections/${section.id}/';
    Map data = {
      'id': section.id.toString(),
      'title': section.title,
    };
    final response = await http.delete(
      Uri.parse(url),
      body: data,
      headers: {
        'Authorization': 'Token ${user.token}',
        // 'Content-Type': 'application/json'
      },
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 204) {
      _sections.remove(section);
      notifyListeners();
    }
    // return _sections;
  }

  //add assync
  addSection(User user, SectionModel section) async {
    const url = 'http://10.0.2.2:8000/usera/sections/';
    Map data = {
      'title': section.title,
    };

    final response = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        'Authorization': 'Token ${user.token}',
        // 'Content-Type': 'application/json'
      },
    );

//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 201) {
//       section.sectionId = json.decode(response.body)['id'];
//       _sections.add(section);
//       notifyListeners();
//     }

    // const url = 'http://10.0.2.2:8000/usera/sections/';

//working
    // final response = await http.post(Uri.parse(url),
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode(section));

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      section.sectionId = json.decode(response.body)['id'];
      _sections.add(section);
      notifyListeners();
    }

    //     _sections.add(section);
    // notifyListeners();
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

 

  fetchSection() async {
    // final url = 'http://127.0.0.1:8000/apis/v1/?format=json';
    const url = 'http://10.0.2.2:8000/usera/sections/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _sections = data
          .map<SectionModel>((json) => SectionModel.fromJson(json))
          .toList();

      notifyListeners();
    } else {
      print('sections: a network error occured');
    }
  }

 
}
