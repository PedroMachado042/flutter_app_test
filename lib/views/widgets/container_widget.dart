import 'package:flutter/material.dart';
import 'package:gods_of_flutter/data/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: KTextStyle.titleTealText,
                ),
                Text(
                  description,
                  style: KTextStyle.descriptionText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
