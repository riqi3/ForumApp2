import 'package:flutter/material.dart';

import '../models/TopicModel.dart';

class TopicScreen extends StatelessWidget {
  final TopicModel topic;
  const TopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 100,
     
          ),
          Container(
            color: Colors.blue,
            height: 100,
     
          ),
        ],
      ),
    );
  }
}
