import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/TopicModel.dart';
import '../models/UserModel.dart';

class TopicProvider with ChangeNotifier {
  TopicProvider() {
    fetchTopic();
  }

  List<TopicModel> _topics = [];

  List<TopicModel> get allTopics =>
      _topics.where((topic) => topic.isPosted == false).toList();

 
  bool empty() {
    return _topics.isEmpty;
  }

  bool notEmpty() {
    return _topics.isNotEmpty;
  }



  void deleteTopic(User user, TopicModel topic) async {
    final url = 'http://10.0.2.2:8000/usera/topics/${topic.id}/';
    Map data = {
      'id': topic.id.toString(),
      'title': topic.title,
      'description': topic.description,
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
      _topics.remove(topic);
      notifyListeners();
    }
    // return _topics;
  }

  Future<void> addTopic(User user, TopicModel topic) async {
    const url = 'http://10.0.2.2:8000/usera/topics/';
    Map data = {
      'title': topic.title,
      'description': topic.description,
    };

    final response = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        'Authorization': 'Token ${user.token}',
         
      },
    );

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      topic.topicId = json.decode(response.body)['id'];
      _topics.add(topic);
      notifyListeners();
    }

 
  }

 

  fetchTopic() async {
    // final url = 'http://127.0.0.1:8000/apis/v1/?format=json';
    const url = 'http://10.0.2.2:8000/usera/topics/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _topics =
          data.map<TopicModel>((json) => TopicModel.fromJson(json)).toList();

      notifyListeners();
    } else {
      print('topic: a network error occured');
    }
  }
}
