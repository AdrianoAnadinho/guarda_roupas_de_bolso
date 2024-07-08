import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Topwear extends HiveObject {
  @HiveField(0)
  String name;

  Topwear(this.name);

  Topwear copyWith({
    String? name,
  }) {
    return Topwear(
      name ?? this.name,
    );
  }
}
