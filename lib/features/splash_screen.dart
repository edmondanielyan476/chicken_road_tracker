import 'package:chicken_road_tracker/features/home/home_screen.dart';
import 'package:chicken_road_tracker/features/onboarding_screen.dart';
import 'package:chicken_road_tracker/gen/assets.gen.dart';
import 'package:chicken_road_tracker/services/hive_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      final isFirstTime = HiveService.isFirstLaunch;
      if (isFirstTime) {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => OnboardingScreen()),
          (_) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => HomeScreen()),
          (_) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDC700), Color(0xFFFFB86A), Color(0xFFFDA5D5)],
          ),
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            Spacer(),
            Assets.images.splashLogo.image(width: double.maxFinite),
            Text(
              "Chicken Road",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Tracker",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "🐣 Your friendly farm companion",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
