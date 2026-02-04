import 'package:chicken_road_tracker/extensions/date_ext.dart';
import 'package:chicken_road_tracker/services/hive_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final lastMonthEggsCount = HiveService.lastMonthEggsCount;
  final totalEgsCount = HiveService.eggDataByDates.values.toList().fold(
    0,
    (a, b) => a + b,
  );
  @override
  Widget build(BuildContext context) {
    final averageEgs = totalEgsCount == 0
        ? 0.0
        : totalEgsCount / HiveService.eggDataByDates.values.length;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffB8E6FE), Color(0xffDBEAFE), Color(0xffE9D4FF)],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: SafeArea(
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
                          "Farm Stats",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1E2939),
                          ),
                        ),
                        Text(
                          "Track your progress",
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

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 176,
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
                              "This Month",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6A7282),
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "$lastMonthEggsCount",
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
                      child: Container(
                        height: 176,
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
                                "assets/icons/stat.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Daily Avg",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6A7282),
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "$averageEgs",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1E2939),
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "eggs/day",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2B7FFF),
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                colors: [Color(0xff51A2FF), Color(0xffC27AFF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/icons/egg.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "This Week",
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
                      EggLastWeekProductionChart(),
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
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                colors: [Color(0xffFB64B6), Color(0xffFF6467)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/icons/stat.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Last 6 Months",
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
                      SizedBox(height: 32),
                      EggLast5MonthsProductionChart(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EggLastWeekProductionChart extends StatelessWidget {
  const EggLastWeekProductionChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DateTime> lastSevenDays = List.generate(7, (index) {
      return DateTime.now().subtract(Duration(days: 6 - index));
    });

    final List<FlSpot> spots = [];
    for (int i = 0; i < lastSevenDays.length; i++) {
      DateTime date = lastSevenDays[i];
      String key = date.shortDotted;
      double value = (HiveService.eggDataByDates[key] ?? 0).toDouble();
      spots.add(FlSpot(i.toDouble(), value));
    }

    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.15),
                dashArray: [5, 5],
              ),
              getDrawingVerticalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.15),
                dashArray: [5, 5],
              ),
            ),
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 3,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) => Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index >= 0 && index < lastSevenDays.length) {
                      String dayName =
                          weekDayShortNames[lastSevenDays[index].weekday - 1];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          dayName,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                curveSmoothness: 0.35,
                color: const Color(0xFFFBB03B),
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                        radius: 6,
                        color: const Color(0xFFFBB03B),
                        strokeColor: Colors.white,
                        strokeWidth: 0,
                      ),
                ),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            minY: 0,
            maxY: (spots.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 2)
                .clamp(12, 100),
          ),
        ),
      ),
    );
  }
}

class EggLast5MonthsProductionChart extends StatelessWidget {
  const EggLast5MonthsProductionChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DateTime> lastSixMonths = List.generate(6, (index) {
      DateTime now = DateTime.now();
      return DateTime(now.year, now.month - (5 - index), 1);
    });

    List<BarChartGroupData> barGroups = [];
    for (int i = 0; i < lastSixMonths.length; i++) {
      DateTime monthDate = lastSixMonths[i];
      int totalForMonth = 0;

      HiveService.eggDataByDates.forEach((key, value) {
        try {
          List<String> parts = key.split('.');
          int month = int.parse(parts[1]);
          int year = int.parse(parts[2]);

          if (month == monthDate.month && year == monthDate.year) {
            totalForMonth += value;
          }
        } catch (_) {}
      });

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: totalForMonth.toDouble(),
              gradient: LinearGradient(
                colors: [Color(0xffFB64B6), Color(0xffFF6467)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              width: 40, // Ширина столбца
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(5),
              ), // Скругление сверху
              backDrawRodData: BackgroundBarChartRodData(show: false),
            ),
          ],
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 1.4,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 320,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.grey.withOpacity(0.1), dashArray: [5, 5]),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index >= 0 && index < lastSixMonths.length) {
                    return Text(
                      monthShortNames[lastSixMonths[index].month - 1],
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 80,
                getTitlesWidget: (value, meta) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: barGroups,
        ),
      ),
    );
  }
}

const List<String> monthShortNames = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

const List<String> weekDayShortNames = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
