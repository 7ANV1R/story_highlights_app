import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard(
      {Key? key,
      required this.active,
      required this.story,
      required this.blur,
      required this.offset,
      required this.top})
      : super(key: key);
  final bool active;
  final Map<String, dynamic> story;

  final double blur;
  final double offset;
  final double top;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(
        top: top,
        bottom: 50,
        right: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(story['imgSrc']),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(16),
      //   child: Image(
      //     fit: BoxFit.cover,
      //     image: AssetImage(story['imgSrc']),
      //   ),
      // ),
    );
  }
}
