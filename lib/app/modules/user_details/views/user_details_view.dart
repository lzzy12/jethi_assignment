import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jethi_tech/app/data/user.dart';
import 'package:jethi_tech/app/services/auth.dart';

import '../controllers/user_details_controller.dart';

class UserDetailsView extends GetView<UserDetailsController> {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Get.find();
    final user = auth.currentUser;
    return Scaffold(
        appBar: AppBar(
          title: Text(auth.currentUser?.name ??
              "No user logged in! You shouldn't be here anyway"),
          centerTitle: true,
        ),
        body: Card(
          child: ListTile(
            title: Text(user?.name ?? "No User"),
            subtitle: Text('Age: ${user?.age.toString()}'),
            trailing: Text(user?.aType ?? ""),
            leading: CircleAvatar(
              child:
                  Icon(user?.gender == Gender.male ? Icons.male : Icons.female),
            ),
          ),
        ));
  }
}
