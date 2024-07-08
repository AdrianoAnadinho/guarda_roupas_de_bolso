import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Bottomwear extends HiveObject {
  @HiveField(0)
  String name;

  Bottomwear(this.name);

  Bottomwear copyWith({
    String? name,
  }) {
    return Bottomwear(
      name ?? this.name,
    );
  }
}
