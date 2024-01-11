import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/select_button.dart';

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
                    const SizedBox(height: 10),
                    // select province and city button
                    Row(
                      children: [
                        Expanded(
                          child: SelectButton(
                              onTap: () {},
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
                    )
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


