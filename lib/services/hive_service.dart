import 'package:chicken_road_tracker/extensions/date_ext.dart';
import 'package:chicken_road_tracker/models/chicken_model.dart';
import 'package:chicken_road_tracker/models/daily_tasks_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static late final Box _hiveBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    _hiveBox = await Hive.openBox('appBox');
  }

  static bool get isFirstLaunch {
    return _hiveBox.get('isFirstLaunch', defaultValue: true) as bool;
  }

  static Future<void> setFirstLaunch(bool value) async {
    await _hiveBox.put('isFirstLaunch', value);
  }

  static Map<String, DailyTasksModel> get dailyTasksData {
    final rawData =
        _hiveBox.get('dailyTasksData', defaultValue: <String, dynamic>{})
            as Map;
    final Map<String, DailyTasksModel> tasksData = {};
    rawData.forEach((key, value) {
      tasksData[key] = DailyTasksModel.fromMap(
        Map<String, dynamic>.from(value),
      );
    });
    return tasksData;
  }

  static DailyTasksModel get todayTasksData {
    final String todayKey = DateTime.now().shortDotted;
    final currentData = dailyTasksData;
    if (currentData.containsKey(todayKey)) {
      return currentData[todayKey]!;
    } else {
      final newData = DailyTasksModel(
        date: DateTime.now(),
        isAllChickensFed: false,
        isEggsCollected: false,
        isCoopCleaned: false,
        isWaterSupplyChecked: false,
      );
      return newData;
    }
  }

  static Future<void> changeDailyTaskData(DailyTasksModel data) async {
    Map<String, DailyTasksModel> currentData = dailyTasksData;
    currentData[data.date.shortDotted] = data;
    final Map<String, dynamic> rawData = {};
    currentData.forEach((key, value) {
      rawData[key] = value.toMap();
    });
    await _hiveBox.put('dailyTasksData', rawData);
  }

  static List<ChickenModel> get chickens {
    final rawData =
        _hiveBox.get('chickens', defaultValue: <Map<String, dynamic>>[])
            as List<dynamic>;
    final List<ChickenModel> chickens = rawData
        .map((e) => ChickenModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
    return chickens;
  }

  static Future<void> addChicken(ChickenModel chicken) async {
    List<ChickenModel> currentChickens = chickens;
    currentChickens.add(chicken);
    final List<Map<String, dynamic>> rawData = currentChickens
        .map((e) => e.toMap())
        .toList();
    await _hiveBox.put('chickens', rawData);
  }

  static Map<String, int> get eggDataByDates {
    final rawData = Map<String, dynamic>.from(
      _hiveBox.get('eggDataByDates', defaultValue: <String, int>{}),
    );
    return rawData.map((key, value) => MapEntry(key, value as int));
  }

  static Map<String, int> get eggDataHistory {
    Map<String, int> data = Map<String, int>.from(eggDataByDates);
    data.remove(DateTime.now().shortDotted);
    return data;
  }

  static int get todayEggCount {
    final String todayKey = DateTime.now().shortDotted;
    final currentData = eggDataByDates;
    if (currentData.containsKey(todayKey)) {
      return currentData[todayKey]!;
    } else {
      return 0;
    }
  }

  static int get lastMonthEggsCount {
    Map<String, int> data = Map<String, int>.from(eggDataByDates);
    final entries = data.entries.where((x) {
      final date = DateExt.dateTimeFromShortDottedFormat(x.key);
      return date.month == DateTime.now().month &&
          date.year == DateTime.now().year;
    });
    final totalCount = entries.fold(0, (a, b) => a + b.value);
    return totalCount;
  }

  static Future<void> changeEggDataByDate({
    required DateTime date,
    required int eggCount,
  }) async {
    final String dateKey = date.shortDotted;
    Map<String, int> currentData = eggDataByDates;
    currentData[dateKey] = eggCount;
    await _hiveBox.put('eggDataByDates', currentData);
  }

  static Future<void> clearData() => _hiveBox.clear();
}
