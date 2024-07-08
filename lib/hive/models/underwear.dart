import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Underwear extends HiveObject {
  @HiveField(0)
  String name;

  Underwear(this.name);

  Underwear copyWith({
    String? name,
  }) {
    return Underwear(
      name ?? this.name,
    );
  }
}
