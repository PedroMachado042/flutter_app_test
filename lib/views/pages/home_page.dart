import 'package:flutter/material.dart';
import 'package:gods_of_flutter/data/constants.dart';
import 'package:gods_of_flutter/views/pages/course_page.dart';
import 'package:gods_of_flutter/views/widgets/container_widget.dart';
import 'package:gods_of_flutter/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.basicLayout,
      KValue.cleanUI,
      KValue.fixBugs,
      KValue.keyConcepts,
      KValue.drinkMorango,
      
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20,),
            HeroWidget(title: 'Activity', nextPage: CoursePage(),),
            SizedBox(height: 10,),
            ...List.generate(list.length, (index) {
              return ContainerWidget(
                title: list.elementAt(index),
                description: 'This is a description',
              );
            }),
          ],
        ),
      ),
    );
  }
}
