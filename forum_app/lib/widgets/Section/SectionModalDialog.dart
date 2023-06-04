import 'package:flutter/material.dart';
import 'package:forum_app/models/UserCubitModel.dart';
import 'package:forum_app/widgets/Section/SectionForm.dart';
import 'package:provider/provider.dart';

import '../../models/SectionModel.dart';
import '../../models/UserModel.dart';
 
import '../../providers/SectionProvider.dart';

class SectionModalDialog extends StatefulWidget {
  const SectionModalDialog({super.key});

  @override
  State<SectionModalDialog> createState() => _SectionModalDialogState();
}

class _SectionModalDialogState extends State<SectionModalDialog> {
  final _formKey1 = GlobalKey<FormState>();
  String title = '';

  @override
  Widget build(BuildContext context) {
    
    return FractionallySizedBox(
      heightFactor: .9,
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey1,
        onChanged: () {
          Form.of(primaryFocus!.context!).save();
        },
        child: SectionFormWidget(
          onChangedTitle: (title) => setState(() {
            this.title = title;
          }),
          onChangedPost: () {
            addSection(context);
          },
        ),
      ),
    );
  }

  void addSection(BuildContext context) {
    
    // final isValid = _formKey1.currentState!.validate();

    // if (_formKey1.currentState!.validate()) {
    //   return;
    // } else {
    //   final section = SectionModel(
    //     createdTime: DateTime.now(),
    //     sectionId: 0,
    //     sectionTitle: title,
    //   );

    // final sectionProvider = Provider.of<SectionProvider>(context, listen: false);
    // sectionProvider.add(section);
    // Navigator.of(context).pop();
    // }

    if (_formKey1.currentState!.validate()) {
      final section = SectionModel(
        // createdTime: DateTime.now(),
        sectionTitle: title,
      );

    User user = context.read<UserCubit>().state;
      final sectionProvider = 
      Provider.of<SectionProvider>(context, listen: false);
      sectionProvider.addSection(user, section);
      Navigator.of(context).pop();
    }
  }

// void addSection( ) {

//       final section = SectionModel(
//         createdTime: DateTime.now(),
//         sectionId: 0,
//         sectionTitle: title,
//       );

//     final sectionProvider = Provider.of<SectionProvider>(context, listen: false);
//     sectionProvider.add(section);
//     }
  // final isValid = _formKey1.currentState!.validate();

  // if (!isValid || isValid == null) {
  //   return;
  // } else {
  //   final section = SectionModel(
  //     createdTime: DateTime.now(),
  //     sectionId: 0,
  //     sectionTitle: title,
  //   );

  // final sectionProvider = Provider.of<SectionProvider>(context, listen: false);
  // sectionProvider.add(section);
  // }
}
