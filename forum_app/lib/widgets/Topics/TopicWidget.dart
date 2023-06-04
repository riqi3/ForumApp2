import 'package:flutter/material.dart';
import 'package:forum_app/models/TopicModel.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../models/UserCubitModel.dart';
import '../../models/UserModel.dart';
import '../../providers/SectionProvider.dart';
import '../../providers/TopicProvider.dart';
import '../../screens/TopicScreen.dart';

class TopicWidget extends StatelessWidget {
  final TopicModel topic;
  const TopicWidget({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      // Text('topic.title');
          User user = context.read<UserCubit>().state;
      return GestureDetector(
        onTap: () {
          Get.to(
            TopicScreen(topic: topic,),
          );
        },
        child: Card(
          key: Key(topic.id.toString()),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(topic.title),
                // subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('View This topic'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    removeTopic(user, context);
                  },
                ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      );



}
        void removeTopic(User user, BuildContext context) {
    final topicProvider =
        Provider.of<TopicProvider>(context, listen: false);
    topicProvider.deleteTopic(user, topic);
 
  }
  }