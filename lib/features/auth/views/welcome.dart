
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/common/widgets/custom_bottom_nav_bar.dart';
import 'package:rsk1/features/auth/views/register_page.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../routes/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = [
    'Русский',
    'English',
  ];
  String currentItem = "";
  @override
  void initState() {
    currentItem = list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        actions: <Widget>[
           const Icon(
              Icons.language,
              color: Color(0xff000000),
              size: 20,
            ),
           
          DropdownButton<String>(
            selectedItemBuilder: (context) {
              return list.map<Widget>((String item) {
                return Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }).toList();
            },
            value: currentItem,
            icon: const Icon(
              CupertinoIcons.chevron_down,
              size: 16,
            ),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (value) {
              setState(() {
                currentItem = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  onTap: () {
                    if (value == 'English') {
                      context.setLocale(const Locale('en'));
                    }
                    if (value == 'Русский') {
                      context.setLocale(const Locale('ru'));
                    }
                    if (value == 'Кыргызча') {
                      context.setLocale(const Locale('ky'));
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ],
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ));
            }).toList(),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/Logo 1.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                LocaleKeys.dobro_pojalovat.tr(),
                style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  Routes.instance.push(widget: CustomBottomBar(), context: context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff0F4F9D),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(350, 50),
                  ),
                ),
                child: Text(
                  LocaleKeys.vxod.tr(),
                  style: const TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                Routes.instance.push(widget: RegisterPage(), context: context);
                },
                child: Text(
                  LocaleKeys.sozdat_novyi_akkaunt.tr(),
                  style: const TextStyle(
                    color: Color(0xff0F4F9D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
