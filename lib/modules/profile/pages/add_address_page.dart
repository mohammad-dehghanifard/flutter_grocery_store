import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:flutter_grocery_store/modules/profile/controller/add_address_controller.dart';
import 'package:flutter_grocery_store/modules/profile/pages/map_page.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/select_button.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/select_city_bottom_sheet.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/select_province_bottom_sheet.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GetBuilder<AddAddressController>(
          init: AddAddressController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: controller.provinceList == null? const Center(child: CircularProgressIndicator()) : Column(
                children: [
                  const AppBarWidget(title: "افزودن آدرس"),
                  Form(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const TextFieldWidget(hintText: "عنوان آدرس"),
                            const SizedBox(height: 15),
                            // select province and city button
                            Row(
                              children: [
                                // select province
                                Expanded(
                                  child: SelectButton(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(25),
                                                topLeft: Radius.circular(25),
                                              )
                                          ),
                                          builder: (context) =>  SelectProvinceButtonSheet(
                                            provinceList: controller.provinceList!.data!,
                                            onSelected: (province) {
                                              controller.onChangeProvince(province);
                                              Get.back();
                                            },
                                          ));
                                    },
                                    text: controller.province == null? "استان" : controller.province!.name!,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                // select city
                                Expanded(
                                  child: SelectButton(
                                    onTap: () {
                                      if(controller.province == null){
                                        showSnackBar(message: "ابتدا استان خود را انتخاب کنید!", type: SnackBarType.error);
                                      } else {
                                        showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  topLeft: Radius.circular(25),
                                                )
                                            ),
                                            builder: (context) =>  SelectCityButtonSheet(
                                              cityList: controller.province!.cities!,
                                              onSelected: (city) {
                                                controller.onChangeCity(city);
                                                Get.back();
                                              },));}
                                    },
                                    text: controller.city == null? "شهر" : controller.city!.name!,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const TextFieldWidget(hintText: "آدرس"),
                            const SizedBox(height: 15),
                            const TextFieldWidget(hintText: "کدپستی",type: TextInputType.number),
                            const SizedBox(height: 15),
                            SelectButton(onTap: () => Get.to(MapPage(onSelected: (latlang) => print(latlang),)),
                                text: "انتخاب موقعیت مکانی روی نقشه",
                                showIcon: false),
                            const SizedBox(height: 30),
                            // save address button
                            ButtonWidget(onPress: (){}, text: "افزودن آدرس")
                          ],
                        ),
                      ))
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}


