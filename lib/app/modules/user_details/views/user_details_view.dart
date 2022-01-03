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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(auth.currentUser?.name ??
              "No user logged in! You shouldn't be here anyway"),
          centerTitle: true,
        ),
        body: Container(
          height: size.height / 2,
          width: size.width / 2,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.amber,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [const Text("Name: "), Text(auth.currentUser?.name?? "No user"),],),
              const SizedBox(height: 8,),
              Row(children: [const Text("Age: "), Text(auth.currentUser?.age.toString() ?? "No user"),],),
              const SizedBox(height: 8,),
              Row(children: [const Text("User type: "), Text(auth.currentUser?.aType?? "No user"),],),
              const SizedBox(height: 8,),
              Row(children: [const Text("Gender: "), Text( describeEnum(auth.currentUser?.gender?? Gender.male)),],),
            ],
          ),
        ));
  }
}
