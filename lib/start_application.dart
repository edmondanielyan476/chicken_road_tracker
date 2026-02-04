import 'package:chicken_road_tracker/features/connection_error_screen.dart';
import 'package:chicken_road_tracker/features/insufficient_data_error_view.dart';
import 'package:chicken_road_tracker/features/splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> onboardingData = [];

class StartApplication extends StatefulWidget {
  const StartApplication({super.key});

  @override
  State<StartApplication> createState() => _StartApplicationState();
}

class _StartApplicationState extends State<StartApplication> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final connectStatuses = await Connectivity().checkConnectivity();
      if (connectStatuses.contains(ConnectivityResult.mobile) ||
          connectStatuses.contains(ConnectivityResult.wifi)) {
        try {
          final Dio dio = Dio();
          final String baseUrl =
              'https://yisfxxvacgmwuyssaytl.supabase.co/rest/v1';
          final String anonKey =
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlpc2Z4eHZhY2dtd3V5c3NheXRsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk5NjIxMTgsImV4cCI6MjA4NTUzODExOH0._GYy7OHwTIuE661XpsUkM3JwtF-Jq8Hy4GzzX29LqNU';
          final response = await dio.get(
            '$baseUrl/onboarding_text_data',
            queryParameters: {'select': '*'},
            options: Options(
              headers: {
                'apikey': anonKey,
                'Authorization': 'Bearer $anonKey',
                'Content-Type': 'application/json',
              },
            ),
          );
          onboardingData = List.from(
            response.data ?? [],
          ).map((e) => Map<String, dynamic>.from(e)).toList();
          if (onboardingData.length < 3) {
            throw Exception('Insufficient onboarding data retrieved.');
          }
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const SplashScreen(),
            ),
            (_) => false,
          );
        } catch (e) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const InsufficientDataErrorView(),
            ),
            (_) => false,
          );
        }
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => ConnectionErrorScreen(),
          ),
          (_) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white);
  }
}
