class ChickenModel {
  final int id;
  final String name;
  final String breed;
  final String color;
  final int ageInMonths;

  bool get isFilled {
    return name.isNotEmpty &&
        breed.isNotEmpty &&
        color.isNotEmpty &&
        ageInMonths > 0;
  }

  ChickenModel({
    required this.id,
    required this.name,
    required this.breed,
    required this.color,
    required this.ageInMonths,
  });

  ChickenModel copyWith({
    int? id,
    String? name,
    String? breed,
    String? color,
    int? ageInMonths,
  }) {
    return ChickenModel(
      id: id ?? this.id,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      color: color ?? this.color,
      ageInMonths: ageInMonths ?? this.ageInMonths,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'breed': breed,
      'color': color,
      'ageInMonths': ageInMonths,
    };
  }

  factory ChickenModel.fromMap(Map<String, dynamic> map) {
    return ChickenModel(
      id: map['id'] as int,
      name: map['name'] as String,
      breed: map['breed'] as String,
      color: map['color'] as String,
      ageInMonths: map['ageInMonths'] as int,
    );
  }

  factory ChickenModel.empty() {
    return ChickenModel(id: 0, name: '', breed: '', color: '', ageInMonths: 0);
  }

  @override
  String toString() {
    return 'ChickenModel(id: $id, name: $name, breed: $breed, color: $color, ageInMonths: $ageInMonths)';
  }

  @override
  bool operator ==(covariant ChickenModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.breed == breed &&
        other.color == color &&
        other.ageInMonths == ageInMonths;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        breed.hashCode ^
        color.hashCode ^
        ageInMonths.hashCode;
  }
}
