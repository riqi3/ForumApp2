import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/TopicModel.dart';

import '../../models/UserCubitModel.dart';
import '../../models/UserModel.dart';
import '../../providers/TopicProvider.dart';
import 'TopicForm.dart';

class TopicModalDialog extends StatefulWidget {

  const TopicModalDialog({Key? key}) : super(key: key);

  @override
  State<TopicModalDialog> createState() => _TopicModalDialogState();
}

class _TopicModalDialogState extends State<TopicModalDialog> {
  
  final _formKey1 = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return FractionallySizedBox(
      heightFactor: .9,
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey1,
        onChanged: () {
          Form.of(primaryFocus!.context!).save();
        },
        child: TopicFormWidget(
          onChangedTitle: (title) => setState(() {
            this.title = title;
          }),
          onChangedDescription: (description) => setState(() {
            this.description = description;
          }),
          onChangedPost: () {
            addTopic(user, context);
          },
        ),
      ),
    );
  }

  // void _addTopic(BuildContext context) {
  //   if (_formKey1.currentState!.validate()) {
  //     final topic = TopicModel(
  //       createdTime: DateTime.now(),
  //       topicTitle: title,
  //       topicDescription: description,
  //     );

  //     final sectionProvider =
  //         Provider.of<SectionProvider>(context, listen: false);
  //     final section = sectionProvider.selectedSection;

  //     if (section != null) {
  //       sectionProvider.addTopicToSection(section, topic);
  //     } else {
  //       print('oh no');
  //     }

  //     Navigator.of(context).pop();
  //   }
  // }

   void addTopic(User user, BuildContext context) {
    if (_formKey1.currentState!.validate()) {
      final topic = TopicModel(
        createdTime: DateTime.now(),
        topicTitle: title,
        topicDescription: description,
      );

      final topicProvider = Provider.of<TopicProvider>(context, listen: false);
      topicProvider.addTopic(user, topic);
      Navigator.of(context).pop();
    }
  }
}
