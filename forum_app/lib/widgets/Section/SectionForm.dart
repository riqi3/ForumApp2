import 'package:flutter/material.dart';
 

class SectionFormWidget extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onChangedPost;

  const SectionFormWidget({
    Key? key,
    this.title = '',
    required this.onChangedTitle,
    required this.onChangedPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        heightFactor: 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
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

// Future<void> addSection(
  //     BuildContext context, SectionProvider sectionProvider) async {
  //   return showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     isDismissible: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding: const EdgeInsets.only(top: 50.0),
  //         child: Column(
  //           children: [
  //             TextField(
  //               controller: titleController,
  //               decoration: const InputDecoration(
  //                 hintText: 'Section Name',
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 if (titleController.text.isNotEmpty) {
  //                   final newSection = SectionModel(
  //                     sectionId: 0,
  //                     sectionTitle: titleController.text,
  //                     topics: [],
  //                   );
  //                   sectionProvider.add(newSection);
  //                   titleController.clear();

  //                   Navigator.pop(context);
  //                 }
  //               },
  //               child: const Text(
  //                 "Ok",
  //                 style: TextStyle(),
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 titleController.clear();
  //                 Navigator.pop(context);
  //               },
  //               child: const Text(
  //                 "Cancel",
  //                 style: TextStyle(),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
 


// class createSectionCard extends StatelessWidget {
//   final SectionFormWidget widget;
//   final SectionProvider sectionsProvider;

//   const createSectionCard({
//     super.key,
//     required this.widget,
//     required this.sectionsProvider,
//   });



//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         child: Column(
//           children: widget.allSections
//               .map(
//                 (e) => GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => Consumer<SectionProvider>(
//                           builder: (context, value, child) {
//                             return NewSectionFormWidget(
//                               newSection: e,
//                               allTopics: UnmodifiableListView([]),
//                             );
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                   child: ListTile(
//                     title: Text(
//                       e.title,
//                       style: TextStyle(fontSize: 24),
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         final index = sectionsProvider.allSections.indexOf(e);
//                         sectionsProvider
//                             .deleteSection(sectionsProvider.allSections[index]);
//                       },
//                       icon: const Icon(
//                         Icons.delete,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//       ),
//     ); 
//   }
// }
