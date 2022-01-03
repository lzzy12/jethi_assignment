import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jethi_tech/app/routes/app_pages.dart';
import 'package:jethi_tech/app/services/auth.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          centerTitle: true,
        ),
        body: Obx(
          () => auth.isInitialised
              ? ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (ctx, i) {
                    final user = controller.users[i];

                    return Obx(() => ListTile(
                          onTap: () {
                            if (auth.loggedIn &&
                                auth.currentUser?.id == user.id) {
                              Get.toNamed(Routes.USER_DETAILS);
                            } else {
                              auth.onLoginClicked(user, () {
                                Get.toNamed(Routes.NEW_USER_SIGNUP);
                              });
                            }
                          },
                          title: Text(user.name),
                          subtitle: Text(user.aType),
                          trailing: ElevatedButton(
                            child: Text(
                                auth.loggedIn && auth.currentUser?.id == user.id
                                    ? "Logout"
                                    : "Login"),
                            onPressed: () {
                              if (auth.loggedIn &&
                                  auth.currentUser?.id == user.id) {
                                auth.logout();
                              } else {
                                auth.onLoginClicked(user, () {
                                  Get.toNamed(Routes.NEW_USER_SIGNUP);
                                });
                              }
                            },
                          ),
                        ));
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
