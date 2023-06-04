import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forum_app/models/UserCubitModel.dart';
import 'package:forum_app/providers/AuthService.dart';
import 'package:forum_app/screens/LoginScreen.dart';
 
import 'package:forum_app/widgets/Section/SectionModalDialog.dart';
 
import '../models/UserModel.dart';
import '../widgets/Section/SectionListWidget.dart';
 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    // final sectionsProvider = Provider.of<SectionProvider>(context);
    // final topicsProvider = Provider.of<TopicProvider>(context);
User user = context.read<UserCubit>().state;
AuthService api = AuthService();
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        actions:[
          IconButton(
          icon: const Icon(Icons.logout_outlined, color: Colors.black),
          onPressed: () async{
            await api.logoutUser(user.token!);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route)=> false
            );
          },
        ),
        ], 
        title: Text(
          'Welcome, ${user.username}' 
        ),
      ),
      body: SectionListWidget(),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add section',
        onPressed: () {
          // addSection(context);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (BuildContext context) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: FractionallySizedBox(
                  heightFactor: 0.9,
                  child: SectionModalDialog(),
                ),
              );
            },
          );
        },
        label: const Text('Add Section'),
      ),
    );
  }
} 

// Future<void> addSection(BuildContext context) async {
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
//                   // final newSection = SectionModel(
//                   //   sectionId: 0,
//                   //   sectionTitle: titleController.text,
//                   //   topics: [],
//                   // );
//                   // sectionProvider.add(newSection);
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


// Widget eventListConsumer(BuildContext context) {
//   return Consumer<SectionProvider>(
//     builder: (context, value, child) {
//       return SectionWidget(allSections: value.allSections,);
//     },
//   );
// }

// // Widget topicListConsumer(BuildContext context) {
// //   return Consumer<TopicProvider>(
// //     builder: (context, value, child) {
// //       return TopicWidget(allTopics: value.allTopics,);
// //     },
// //   );
// // }
