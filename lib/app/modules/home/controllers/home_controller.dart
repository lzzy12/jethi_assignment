import 'package:get/get.dart';
import 'package:jethi_tech/app/data/user.dart';

class HomeController extends GetxController {
  final _data = <User>[].obs;
  List<User> get users => _data;
  static const mockData = [
    {
      "users": [
        {"name": "Krishna", "id": "1", "atype": "Permanent"},
        {"name": "Sameera", "id": "2", "atype": "Permanent"},
        {"name": "Radhika", "id": "3", "atype": "Permanent"},
        {"name": "Yogesh", "id": "4", "atype": "Permanent"},
        {"name": "Radhe", "id": "5", "atype": "Permanent"},
        {"name": "Anshu", "id": "6", "atype": "Permanent"},
        {"name": "Balay", "id": "7", "atype": "Permanent"},
        {"name": "Julie", "id": "8", "atype": "Permanent"},
        {"name": "Swaminathan", "id": "9", "atype": "Permanent"},
        {"name": "Charandeep", "id": "10", "atype": "Permanent"},
        {"name": "Sankaran", "id": "11", "atype": "Permanent"},
        {"name": "Alpa", "id": "12", "atype": "Permanent"},
        {"name": "Sheth", "id": "13", "atype": "Temproary"},
        {"name": "Sabina", "id": "14", "atype": "Temproary"}
      ]
    }
  ];

  @override
  void onReady() {
    super.onReady();
    final data = <User>[];
    for (var element in mockData[0]["users"]!) {
      data.add(User.fromJson(element));
    }
    _data.value = data;
  }
}
