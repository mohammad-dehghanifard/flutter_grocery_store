import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/address.dart';
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
  const AddAddressPage({super.key, this.address});

  final Address? address;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GetBuilder<AddAddressController>(
          init: AddAddressController(address: address),
          builder: (controller) {
            return SingleChildScrollView(
              child: controller.provinceList == null? const Center(child: CircularProgressIndicator()) : Column(
                children: [
                  AppBarWidget(title: address == null? "افزودن آدرس" : "ویرایش آدرس"),
                  Form(
                    key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // address title
                             TextFieldWidget(
                                controller: controller.titleText,
                                validator: controller.validateAddressName,
                                hintText: "عنوان آدرس"),
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
                            // address
                            TextFieldWidget(
                                controller: controller.addressText,
                                validator: controller.validateAddress,
                                hintText: "آدرس"),
                            const SizedBox(height: 15),
                            // postal code
                            TextFieldWidget(
                                controller: controller.postalCodeText,
                                hintText: "کدپستی",
                                type: TextInputType.number),
                            const SizedBox(height: 15),
                            SelectButton(onTap: () => Get.to(MapPage(onSelected: (latlang) => controller.setLocation(latlang),)),
                                text: controller.selectLocation == null? "انتخاب موقعیت مکانی روی نقشه": "موقعیت مکانی با موفقیت انتخاب شد",
                                showIcon: false),
                            const SizedBox(height: 30),
                            // save address button
                            ButtonWidget(
                                onPress: controller.addOrEditAddress,
                                loading: controller.loading,
                                text: address == null? "افزودن آدرس" : "ویرایش آدرس")
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


