import 'package:flutter/material.dart';

import 'package:forum_app/providers/SectionProvider.dart';
import 'package:forum_app/widgets/Section/SectionWidget.dart';

import 'package:provider/provider.dart';

 

class SectionListWidget extends StatelessWidget {
  const SectionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
 

    final sectionProvider = Provider.of<SectionProvider>(context);
    final sections = sectionProvider.allSections;
    if (sections.isEmpty) {
      return const Center(
        child: Text('There are no sections at the moment :^('),
      );
    } else {
      return ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 8,
        ),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return SectionWidget(section: section);
        },
      );
    }
  }
}


// section: SectionModel(
//           createdTime: DateTime.now(),
//           sectionId: sectionId,
//           sectionTitle: sectionTitle,
//           // topics: topics,
//           ),