import 'package:flutter/material.dart';
 
 
 
import 'package:provider/provider.dart';

import '../../providers/TopicProvider.dart';
import 'TopicWidget.dart';

class TopicListWidget extends StatelessWidget {
  const TopicListWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final topicProvider = Provider.of<TopicProvider>(context);
    final topics = topicProvider.allTopics;
     
 
// final t = context.read<TopicProvider>();
// final z = t.z;

      return ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 8,
        ),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return TopicWidget(topic: topic);
        },
      );
    }
    // final topicProvider = Provider.of<TopicProvider>(context);
    // final topics = topicProvider.allTopics;
    // context.read<TopicProvider>();
    // if (topics.isEmpty) {
    //   return Center(
    //     child: Text('There are no topics as of the moment :^('),
    //   );
    // } else {
    //   return ListView.separated(
    //     separatorBuilder: (context, index) => Container(
    //       height: 8,
    //     ),
    //     physics: BouncingScrollPhysics(),
    //     padding: EdgeInsets.all(15),
    //     itemCount: topics.length,
    //     itemBuilder: (context, index) {
    //       final topic = topics[index];
    //       return TopicWidget(topic: topic);
    //     },
    //   );
    // }
  }
