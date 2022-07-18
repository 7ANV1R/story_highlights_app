import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    required this.active,
    required this.story,
  }) : super(key: key);
  final bool active;
  final Map<String, dynamic> story;

  @override
  Widget build(BuildContext context) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;
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
          image: CachedNetworkImageProvider(story['imgSrc']),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black.withOpacity(0.25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    story['title'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        story['dateTime'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(16),
      //   child: Stack(
      //     children: [
      //       CachedNetworkImage(
      //         fit: BoxFit.cover,
      //         imageUrl: story['imgSrc'],
      //         placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      //       ),
      //       Positioned(
      //           bottom: 10,
      //           right: 10,
      //           child: ElevatedButton(
      //             onPressed: () {},
      //             child: Text('data'),
      //           )),
      //     ],
      //   ),
      // ),
    );
  }
}
