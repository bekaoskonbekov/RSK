import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/common/widgets/height_container_widget.dart';
import 'package:rsk1/generated/locale_keys.g.dart';

import 'list_of_branches_screen.dart';
import 'my_ticket_screen.dart';




class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.eshe.tr(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 95,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beka Oskonbekov',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            '0 (502) 027 590',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                  height: 140,
                  child: Column(
                    children: [
                      TextAndIconWidget(icons: Icons.inventory_2_outlined, text: LocaleKeys.bankomaty.tr(), onTapped: () { 
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfBranchesScreen()));
                       },),
                      TextAndIconWidget(icons: Icons.maps_home_work_outlined, text: LocaleKeys.ofisy.tr(), onTapped: () {  },),
                      TextAndIconWidget(icons: Icons.confirmation_num_outlined, text: LocaleKeys.moi_talony.tr(), onTapped: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyTicketScreen()));
                        },),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                  height: 95,
                  child: Column(
                    children: [
                      TextAndIconWidget(
                          icons: Icons.phone_outlined, text: LocaleKeys.svyaz_s_bankom.tr(), onTapped: () {  },),
                      TextAndIconWidget(
                          icons: Icons.help_outline, text: LocaleKeys.vopros_otvet.tr(), onTapped: () {  },),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                height: 46,
                child: TextAndIconWidget(
                    icons: Icons.handshake_outlined, text: LocaleKeys.politika_usloviy.tr(), onTapped: () {  },),
              ),
              SizedBox(
                height: 20,
              ),
              HeightContainerWidget(
                height: 140,
                child: Column(
                  children: [
                    TextAndIconWidget(
                        icons: Icons.password_outlined, text: LocaleKeys.smenit_parol.tr(), onTapped: () {  },),
                    TextAndIconWidget(icons: Icons.language_outlined, text: LocaleKeys.smenit_yazyk.tr(), onTapped: () {  },),
                    TextAndIconWidget(icons: Icons.screen_rotation_alt_outlined, text: LocaleKeys.smenit_regim.tr(), onTapped: () {  },),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
               HeightContainerWidget(
                height: 46,
                child: TextAndIconWidget(
                    icons: Icons.login_outlined, text: LocaleKeys.vyiti.tr(), onTapped: () {  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
