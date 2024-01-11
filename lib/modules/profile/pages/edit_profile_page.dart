import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/user_model.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:flutter_grocery_store/modules/profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GetBuilder<EditProfileController>(
          init: EditProfileController(user),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const AppBarWidget(title: "ویرایش پروفایل"),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          // full name
                           TextFieldWidget(
                            validator: controller.validateFullName,
                            controller: controller.userFullNameTextController,
                            hintText: "نام و نام خانوادگی",
                            type: TextInputType.text,
                            icon: Iconsax.user,
                          ),

                          const SizedBox(height: 15),
                          //mobile
                           TextFieldWidget(
                             controller: controller.userMobileController,
                            hintText: "شماره موبایل",
                            disabled: true,
                            type: TextInputType.phone,
                            icon: Iconsax.mobile,
                          ),
                          const SizedBox(height: 15),
                          // password
                           TextFieldWidget(
                             validator: controller.validateOldPassword,
                             controller: controller.userOldPassTextController,
                            hintText: "رمزعبور قبلی",
                            type: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 15),
                          // repeat pass
                          TextFieldWidget(
                            controller: controller.userNewPassTextController,
                            hintText: "رمز عبور جدید",
                            type: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 25),

                          ButtonWidget(
                            loading: controller.loading,
                              onPress: controller.editInformation,
                              text: "ویرایش")

                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
