import 'package:flutter/material.dart';
 
 

class TopicFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onChangedPost;

  const TopicFormWidget({
    Key? key,
    this.title = '',
    this.description='',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        heightFactor: 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            const SizedBox(height: 12,),
            buildDescription(),
            const SizedBox(height: 32),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title == null || title.isEmpty) {
            return 'Please enter a title';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

        Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: description,
        onChanged: onChangedDescription,
        validator: (description) {
          if (description == null || description.isEmpty) {
            return 'Please enter a description';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: onChangedPost,
          child: const Text('Post'),
        ),
      );
}

 