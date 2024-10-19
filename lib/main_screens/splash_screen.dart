import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chess_flutter/constants/index.dart';
import 'package:gap/gap.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Set the duration for the flip
      vsync: this,
    );

    // Set up the animation to rotate the image from 0 to 1 (180 degrees in radians)
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the flip animation
    _controller.forward();

    // Navigate to the home screen after the flip animation duration
    Timer(const Duration(seconds: 3), () {
      RoutingService.gotoWithoutBack(
        context,
        const HomeScreen(),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 50 * Dimensions.heightF(context),
              ),
            ),
            const Gap(20),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                // Flip animation using Transform
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(_animation.value *
                        3.1415926), // Flip the image along Y-axis
                  child: child,
                );
              },
              child: Image.asset(Images.chessLogo), // The logo to flip
            ),
            const Gap(20),
            Text(
              "Chess",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 50 * Dimensions.heightF(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
