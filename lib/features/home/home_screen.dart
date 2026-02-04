import 'package:chicken_road_tracker/features/home/add_chicken_screen.dart';
import 'package:chicken_road_tracker/features/home/egg_collect_screen.dart';
import 'package:chicken_road_tracker/features/home/statistics_screen.dart';
import 'package:chicken_road_tracker/features/settings/settings_screen.dart';
import 'package:chicken_road_tracker/models/daily_tasks_model.dart';
import 'package:chicken_road_tracker/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int todayEggsCount = HiveService.todayEggCount;
  int totalChickensCount = HiveService.chickens.length;
  DailyTasksModel todayTasks = HiveService.todayTasksData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB8E6FE), Color(0xFFDBEAFE), Color(0xFFE9D4FF)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello! 👋",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1E2939),
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  "Let's take care of your flock",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4A5565),
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => SettingsScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 48,
                              height: 46,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/icons/settings.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 36),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xffFFDF20), Color(0xffFFB86A)],
                          ),
                        ),
                        padding: EdgeInsets.all(24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/images/farm_image.png",
                                width: 96,
                                height: 96,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your Farm",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Everything looks great today!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 160,
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
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
                                      "assets/icons/bird.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Total Chickens",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6A7282),
                                      height: 1,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "$totalChickensCount",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1E2939),
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (totalChickensCount == 0) return;
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) {
                                      return EggCollectScreen();
                                    },
                                  ),
                                ).then((_) {
                                  setState(() {
                                    todayEggsCount = HiveService.todayEggCount;
                                  });
                                });
                              },
                              child: Container(
                                height: 160,
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xffFDC700),
                                            Color(0xffFF8904),
                                          ],
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        "assets/icons/egg.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      "Eggs Today",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff6A7282),
                                        height: 1,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "$todayEggsCount",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1E2939),
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) {
                                return StatisticsScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffAD46FF), Color(0xffF6339A)],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/stat.png",
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "View Stats",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Daily Tasks",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xff1E2939),
                                      height: 1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 54,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff05DF72),
                                        Color(0xff00D5BE),
                                      ],
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${todayTasks.completedTasksCount}/4",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  todayTasks = todayTasks.copyWith(
                                    isAllChickensFed:
                                        !todayTasks.isAllChickensFed,
                                  );
                                });
                                HiveService.changeDailyTaskData(todayTasks);
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9FAFB),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: todayTasks.isAllChickensFed
                                              ? Color(0xff00C950)
                                              : Color(0xffD1D5DC),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: todayTasks.isAllChickensFed
                                          ? Image.asset(
                                              "assets/icons/check.png",
                                              width: 12,
                                              height: 12,
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        "Feed all chickens",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: todayTasks.isAllChickensFed
                                              ? Color(
                                                  0xff364153,
                                                ).withOpacity(.5)
                                              : Color(0xff364153),
                                          height: 1,
                                          decoration:
                                              todayTasks.isAllChickensFed
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  todayTasks = todayTasks.copyWith(
                                    isEggsCollected:
                                        !todayTasks.isEggsCollected,
                                  );
                                });
                                HiveService.changeDailyTaskData(todayTasks);
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9FAFB),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: todayTasks.isEggsCollected
                                              ? Color(0xff00C950)
                                              : Color(0xffD1D5DC),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: todayTasks.isEggsCollected
                                          ? Image.asset(
                                              "assets/icons/check.png",
                                              width: 12,
                                              height: 12,
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        "Collect eggs",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: todayTasks.isEggsCollected
                                              ? Color(
                                                  0xff364153,
                                                ).withOpacity(.5)
                                              : Color(0xff364153),
                                          height: 1,
                                          decoration: todayTasks.isEggsCollected
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  todayTasks = todayTasks.copyWith(
                                    isCoopCleaned: !todayTasks.isCoopCleaned,
                                  );
                                });
                                HiveService.changeDailyTaskData(todayTasks);
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9FAFB),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: todayTasks.isCoopCleaned
                                              ? Color(0xff00C950)
                                              : Color(0xffD1D5DC),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: todayTasks.isCoopCleaned
                                          ? Image.asset(
                                              "assets/icons/check.png",
                                              width: 12,
                                              height: 12,
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        "Clean the coop",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: todayTasks.isCoopCleaned
                                              ? Color(
                                                  0xff364153,
                                                ).withOpacity(.5)
                                              : Color(0xff364153),
                                          height: 1,
                                          decoration: todayTasks.isCoopCleaned
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  todayTasks = todayTasks.copyWith(
                                    isWaterSupplyChecked:
                                        !todayTasks.isWaterSupplyChecked,
                                  );
                                });
                                HiveService.changeDailyTaskData(todayTasks);
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9FAFB),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: todayTasks.isWaterSupplyChecked
                                              ? Color(0xff00C950)
                                              : Color(0xffD1D5DC),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: todayTasks.isWaterSupplyChecked
                                          ? Image.asset(
                                              "assets/icons/check.png",
                                              width: 12,
                                              height: 12,
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        "Check water supply",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: todayTasks.isWaterSupplyChecked
                                              ? Color(
                                                  0xff364153,
                                                ).withOpacity(.5)
                                              : Color(0xff364153),
                                          height: 1,
                                          decoration:
                                              todayTasks.isWaterSupplyChecked
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 24,
                bottom: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => AddChickenScreen(),
                      ),
                    ).then((_) {
                      setState(() {
                        totalChickensCount = HiveService.chickens.length;
                      });
                    });
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFF6339A), Color(0xFFFB2C36)],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/icons/add.png",
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
