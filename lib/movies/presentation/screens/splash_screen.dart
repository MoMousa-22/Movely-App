import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _filmyController;
  late Animation<double> _filmyScale;
  late Animation<double> _filmyFade;
  late Animation<Offset> _filmySlide;
  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();

    // Background animation
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Icon rotation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // FILMY text animation
    _filmyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _filmyScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _filmyController, curve: Curves.easeOutBack),
    );

    _filmyFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _filmyController, curve: Curves.easeIn),
    );

    _filmySlide = Tween<Offset>(
      begin: const Offset(0, -0.7),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _filmyController, curve: Curves.easeOutExpo),
    );

    _filmyController.forward();

    // Navigate to home after delay
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MoviesScreen()),
      );
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _filmyController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bgController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Colors.purple, Colors.indigo, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(_bgController.value * 2 * pi),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RotationTransition(
                    turns: _rotationController,
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.amberAccent,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _filmyFade,
                    child: ScaleTransition(
                      scale: _filmyScale,
                      child: SlideTransition(
                        position: _filmySlide,
                        child: const Text(
                          'FILMY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Tap. Watch. Get hooked.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
