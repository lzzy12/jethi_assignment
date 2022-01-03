import 'package:hive/hive.dart';
part 'user.g.dart';

enum Gender { male, female, others }

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(3)
  String aType;
  @HiveField(4)
  int? age;
  @HiveField(5)
  Gender? gender;
  User({required this.id, required this.name, required this.aType});
  User.fromJson(Map data)
      : id = data['id'],
        name = data['name'],
        aType = data['atype'];
}
