import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Footwear extends HiveObject {
  @HiveField(0)
  String name;

  Footwear(this.name);

  Footwear copyWith({
    String? name,
  }) {
    return Footwear(
      name ?? this.name,
    );
  }
}
