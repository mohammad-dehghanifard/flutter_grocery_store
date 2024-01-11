import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/icon_button_widget.dart';
import 'package:iconsax/iconsax.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFEBEBEB),width: 1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.15),
                    blurRadius: 3,
                    offset: const Offset(0,1)
                  )
                ]
              ),
              child: Column(
                children: [
                  // user avtar
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE8F1FF),
                    ),
                    child: const Icon(Iconsax.user,size: 38,color: Color(0xFF292D32),),
                  ),
                  // user name
                  const Text("عرفان سجادیه",style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  // phone number
                  const Text("۰۹۱۳۰۰۱۰۱۰۱",style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  // edit text button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.edit,size: 16,color: Theme.of(context).primaryColor),
                      const SizedBox(width: 4),
                       Text("ویرایش",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor)),

                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            IconButtonWidget(
              onTap: () {},
              icon: Iconsax.map,
              text: 'آدرس ها',
            )
          ],
        ));
  }
}
