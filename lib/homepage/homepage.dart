import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        itemCount: 5,
        itemBuilder: (context, index) {
          bool active = index == currentIndex;

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
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1516939884455-1445c8652f83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: blur,
                  offset: Offset(offset, offset),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
