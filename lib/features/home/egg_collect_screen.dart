import 'dart:math';

import 'package:chicken_road_tracker/extensions/date_ext.dart';
import 'package:chicken_road_tracker/services/hive_service.dart';
import 'package:flutter/material.dart';

class EggCollectScreen extends StatefulWidget {
  const EggCollectScreen({super.key});

  @override
  State<EggCollectScreen> createState() => _EggCollectScreenState();
}

class _EggCollectScreenState extends State<EggCollectScreen> {
  int currentEgsCount = HiveService.todayEggCount;
  final totalChickensCount = HiveService.chickens.length;
  final historyEntries = HiveService.eggDataHistory.entries.toList()
    ..sort(
      (a, b) => DateExt.dateTimeFromShortDottedFormat(
        a.key,
      ).compareTo(DateExt.dateTimeFromShortDottedFormat(b.key)),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFFF085), Color(0xffFFEDD4), Color(0xffFCE7F3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/arrow_left.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Egg Tracker",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1E2939),
                            ),
                          ),
                          Text(
                            "Count your daily eggs",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4A5565),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/bag.png",
                          width: 96,
                          height: 96,
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.maxFinite,
                          height: 12,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffE5E7EB),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Builder(
                                  builder: (context) {
                                    final rightFlex =
                                        totalChickensCount - currentEgsCount;
                                    return Row(
                                      children: [
                                        if (currentEgsCount > 0)
                                          Expanded(
                                            flex: currentEgsCount,
                                            child: Container(
                                              height: 12,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xffFDC700),
                                                    Color(0xffFF8904),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        if (rightFlex > 0)
                                          Spacer(flex: rightFlex),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "$currentEgsCount / $totalChickensCount eggs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6A7282),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Today's Count",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6A7282),
                            height: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                          child: Text(
                            "$currentEgsCount",
                            style: TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1E2939),
                              height: 1,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentEgsCount = max(0, currentEgsCount - 1);
                                });
                                HiveService.changeEggDataByDate(
                                  date: DateTime.now(),
                                  eggCount: currentEgsCount,
                                );
                              },
                              child: Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffFF6467),
                                      Color(0xffFB64B6),
                                    ],
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/icons/minus.png",
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentEgsCount = min(
                                    currentEgsCount + 1,
                                    totalChickensCount,
                                  );
                                });
                                HiveService.changeEggDataByDate(
                                  date: DateTime.now(),
                                  eggCount: currentEgsCount,
                                );
                              },
                              child: Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff05DF72),
                                      Color(0xff00D5BE),
                                    ],
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/icons/add.png",
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 42),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: List.generate(totalChickensCount, (index) {
                            final isEgg = currentEgsCount > index;
                            if (isEgg) {
                              return SizedBox(
                                width: 40,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/egg.png",
                                    width: 36,
                                    height: 40,
                                  ),
                                ),
                              );
                            }
                            return Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white24,
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    238,
                                    238,
                                    238,
                                  ),
                                  width: 2,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff51A2FF),
                                    Color(0xffC27AFF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/icons/date.png",
                                width: 22,
                                height: 22,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "Recent History",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1E2939),
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        if (historyEntries.isEmpty)
                          SizedBox(
                            width: double.maxFinite,
                            height: 200,
                            child: Center(
                              child: Text(
                                "History is empty",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6A7282),
                                  height: 1,
                                ),
                              ),
                            ),
                          )
                        else
                          ...List.generate(historyEntries.length, (index) {
                            return Container(
                              width: double.maxFinite,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      historyEntries[index].key,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff364153),
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      "${historyEntries[index].value}",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1E2939),
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/egg.png",
                                    width: 36,
                                  ),
                                ],
                              ),
                            );
                          }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
