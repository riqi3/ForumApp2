import 'package:flutter/material.dart';
import 'package:forum_app/models/TopicModel.dart';
import 'package:forum_app/providers/TopicProvider.dart';
import 'package:forum_app/widgets/Topics/TopicListWidget.dart';
import 'package:forum_app/widgets/Topics/TopicModalDialog.dart';
import 'package:provider/provider.dart';

import '../models/SectionModel.dart';

class TopicListScreen extends StatelessWidget {
  final SectionModel section;
   List<TopicModel> allTopics;
 

  // void _addTopic(BuildContext context) {
  //   String topicTitle = _topicTitleController.text;
  //   String topicDescription = _topicDescriptionController.text;
  //   if (topicTitle.isNotEmpty && topicDescription.isNotEmpty) {
  //     TopicModel topic = TopicModel(
  //       topicId: DateTime.now().toString(),
  //       topicTitle: topicTitle,
  //       createdTime: DateTime.now(),
  //       topicDescription: topicDescription,
  //     );
  //     Provider.of<SectionProvider>(context, listen: false)
  //         .addTopicToSection(section, topic);
  //     _topicTitleController.clear();
  //   }
  // }

  // void _addTopic(BuildContext context) {

  //   String topicTitle = _topicTitleController.text;
  //   String topicDescription = _topicDescriptionController.text;
  //   if (topicTitle.isNotEmpty) {
  //      TopicModel topic = TopicModel(
  //       topicId: DateTime.now().toString(),
  //       topicTitle: topicTitle,
  //       createdTime: DateTime.now(),
  //       topicDescription: topicDescription,
  //     );
  //     Provider.of<SectionProvider>(context).addTopicToSection(section, topic);
  //     _topicTitleController.clear();
  //   }
  // }

   TopicListScreen({Key? key, required this.section, required this.allTopics }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final sectionsProvider = Provider.of<SectionProvider>(context);
    // final topicsProvider = Provider.of<TopicProvider>(context);
    context.read<TopicProvider>();
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(section.title),
      ),
      body: const TopicListWidget(),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add topic',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (BuildContext context) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: FractionallySizedBox(
                  heightFactor: 0.9,
                  child: TopicModalDialog( ),
                ),
              );
            },
          );
        },
        label: const Text('Add Topic'),
      ),
    );
  }
}
