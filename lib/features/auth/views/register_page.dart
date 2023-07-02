import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rsk1/features/auth/providers/auth_provider.dart';
import 'package:rsk1/features/auth/views/send_pin_code_screen.dart';
import 'package:rsk1/generated/locale_keys.g.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../services/auth_service.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}


class _RegisterPageState extends ConsumerState<RegisterPage> {
  TextEditingController _phoneController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }



  @override
  Widget build(BuildContext context, ) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Войти ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: 
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 3,
                          offset: Offset(0, 0)),
                    ]),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: null,
                  labelColor: Colors.grey,
                  indicator: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  tabs: [
                    Tab(
                      text: LocaleKeys.po_nomeru_telefona.tr(),
                    ),
                    Tab(
                      text: LocaleKeys.po_loginu.tr(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: TabBarView(children: [
                  Column(
                    children: [
                      IntlPhoneField(
                        controller: _phoneController,
                        initialCountryCode: 'KG',
                        onChanged: (phone) {},
                      ),
                      SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendPinCodeScreen()));
                        },
                        child: Text('Войти',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            primary: _signInFormKey == true
                                ? Colors.blueGrey
                                : Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(double.infinity, 50)),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: ref.watch(loginRiverpod).email,
                            hintText: 'Логин',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: ref.watch(loginRiverpod).password,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: ref.read(loginRiverpod).fetch,
                            child: Text('Войти',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                                primary: _signInFormKey == true
                                    ? Colors.blueGrey
                                    : Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(double.infinity, 50)),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Воостановить пароль ',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      )
    );
  }
}



 