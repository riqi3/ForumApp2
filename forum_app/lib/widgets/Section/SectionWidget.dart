import 'package:flutter/material.dart';
import 'package:forum_app/models/SectionModel.dart';
import 'package:forum_app/providers/TopicProvider.dart';
 
import 'package:forum_app/screens/TopicListScreen.dart';
import 'package:forum_app/widgets/Topics/TopicWidget.dart';
import 'package:provider/provider.dart';

import '../../models/TopicModel.dart';
import '../../models/UserCubitModel.dart';
import '../../models/UserModel.dart';
import '../../providers/SectionProvider.dart';

class SectionWidget extends StatelessWidget {
  final SectionModel section;
  const SectionWidget({
    Key? key,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TopicListScreen topicListScreen = TopicListScreen(section: section);
   
    // Consumer<TopicProvider>(builder: (context, value, child){
    //   return TopicListScreen(section: value.allTopics);
    // });
 
 
    
    User user = context.read<UserCubit>().state;
    return
        // Text('section.title');

        GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => 
                Consumer<TopicProvider>(builder: (context, value, child){
      return 
       
      TopicListScreen(section: section, allTopics: value.allTopics,);
    }),
          ),
        );
      },
      child: Card(
        key: Key(section.id.toString()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(section.title),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('View This Section'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    removeSection(user, context);
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

  void removeSection(User user, BuildContext context) {
    final sectionProvider =
        Provider.of<SectionProvider>(context, listen: false);
    sectionProvider.deleteSection(user, section);

    // if (_formKey1.currentState!.validate()) {
    //   final section = SectionModel(
    //     // createdTime: DateTime.now(),
    //     sectionTitle: title,
    //   );

    // User user = context.read<UserCubit>().state;
    //   final sectionProvider =
    //   Provider.of<SectionProvider>(context, listen: false);
    //   sectionProvider.addSection(user, section);
    //   Navigator.of(context).pop();
    // }
  }
}
