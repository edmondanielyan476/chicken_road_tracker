class DailyTasksModel {
  final DateTime date;
  final bool isAllChickensFed;
  final bool isEggsCollected;
  final bool isCoopCleaned;
  final bool isWaterSupplyChecked;
  DailyTasksModel({
    required this.date,
    required this.isAllChickensFed,
    required this.isEggsCollected,
    required this.isCoopCleaned,
    required this.isWaterSupplyChecked,
  });

  int get completedTasksCount {
    int count = 0;
    if (isAllChickensFed) count++;
    if (isEggsCollected) count++;
    if (isCoopCleaned) count++;
    if (isWaterSupplyChecked) count++;
    return count;
  }

  DailyTasksModel copyWith({
    DateTime? date,
    bool? isAllChickensFed,
    bool? isEggsCollected,
    bool? isCoopCleaned,
    bool? isWaterSupplyChecked,
  }) {
    return DailyTasksModel(
      date: date ?? this.date,
      isAllChickensFed: isAllChickensFed ?? this.isAllChickensFed,
      isEggsCollected: isEggsCollected ?? this.isEggsCollected,
      isCoopCleaned: isCoopCleaned ?? this.isCoopCleaned,
      isWaterSupplyChecked: isWaterSupplyChecked ?? this.isWaterSupplyChecked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'isAllChickensFed': isAllChickensFed,
      'isEggsCollected': isEggsCollected,
      'isCoopCleaned': isCoopCleaned,
      'isWaterSupplyChecked': isWaterSupplyChecked,
    };
  }

  factory DailyTasksModel.fromMap(Map<String, dynamic> map) {
    return DailyTasksModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isAllChickensFed: map['isAllChickensFed'] as bool,
      isEggsCollected: map['isEggsCollected'] as bool,
      isCoopCleaned: map['isCoopCleaned'] as bool,
      isWaterSupplyChecked: map['isWaterSupplyChecked'] as bool,
    );
  }

  @override
  String toString() {
    return 'DailyTasksModel(date: $date, isAllChickensFed: $isAllChickensFed, isEggsCollected: $isEggsCollected, isCoopCleaned: $isCoopCleaned, isWaterSupplyChecked: $isWaterSupplyChecked)';
  }

  @override
  bool operator ==(covariant DailyTasksModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.isAllChickensFed == isAllChickensFed &&
      other.isEggsCollected == isEggsCollected &&
      other.isCoopCleaned == isCoopCleaned &&
      other.isWaterSupplyChecked == isWaterSupplyChecked;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      isAllChickensFed.hashCode ^
      isEggsCollected.hashCode ^
      isCoopCleaned.hashCode ^
      isWaterSupplyChecked.hashCode;
  }
}
