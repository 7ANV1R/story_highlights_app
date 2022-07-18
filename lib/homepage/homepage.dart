import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_highlights/data/demo_story_data.dart';
import 'package:story_highlights/homepage/widgets/first_page.dart';
import 'package:story_highlights/homepage/widgets/story_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final stories = storyData;
  final PageController ctrl = PageController(viewportFraction: 0.8);

  int currentIndex = 0;
  @override
  void initState() {
    ctrl.addListener(() {
      int next = ctrl.page!.round();
      if (currentIndex != next) {
        setState(() {
          currentIndex = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: PageView.builder(
        controller: ctrl,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const FirstPage();
          } else if (stories.length >= index) {
            bool active = index == currentIndex;
            final story = stories[index - 1];

            return StoryCard(
              active: active,
              story: story,
            );
          }
          throw '';

          // return AnimatedContainer(
          //   duration: const Duration(
          //     milliseconds: 500,
          //   ),
          //   curve: Curves.easeOutQuint,
          //   margin: EdgeInsets.only(
          //     top: top,
          //     bottom: 50,
          //     right: 30,
          //   ),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(16),
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: AssetImage(story['imgSrc']),

          //       // image: AssetImage(story['imgSrc']),
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey,
          //         blurRadius: blur,
          //         offset: Offset(offset, offset),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
