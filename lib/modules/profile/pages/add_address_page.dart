import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:flutter_grocery_store/modules/profile/pages/map_page.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/select_button.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/select_province_bottom_sheet.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                                    builder: (context) => const SelectProvinceButtonSheet());
                              },
                            text: "استان",
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: SelectButton(
                              onTap: () {},
                            text: "شهر",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const TextFieldWidget(hintText: "آدرس"),
                    const SizedBox(height: 15),
                    const TextFieldWidget(hintText: "کدپستی",type: TextInputType.number),
                    const SizedBox(height: 15),
                    SelectButton(onTap: () => Get.to(const MapPage()), text: "انتخاب موقعیت مکانی روی نقشه",showIcon: false),
                    const SizedBox(height: 30),
                    // save address button
                    ButtonWidget(onPress: (){}, text: "افزودن آدرس")
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}


