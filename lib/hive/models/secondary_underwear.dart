import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class SecondaryUnderwear extends HiveObject {
  @HiveField(0)
  String name;

  SecondaryUnderwear(this.name);

  SecondaryUnderwear copyWith({
    String? name,
  }) {
    return SecondaryUnderwear(
      name ?? this.name,
    );
  }
}
