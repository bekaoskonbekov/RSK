import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rsk1/features/auth/views/send_pin_code_screen.dart';
import 'package:rsk1/generated/locale_keys.g.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../routes/router.dart';
import '../model/user_model.dart';
import '../providers/auth_provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  // final AuthService authService = AuthService();
  UserModel? currentUser = UserModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void signUpUser() {
    ref.read(authControllerProvider).signUpUser(
          context: context,
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          password_confirm: _confirmPasswordController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Войти ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
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
                const SizedBox(height: 40),
                Expanded(
                  child: TabBarView(children: [
                    Column(
                      children: [
                        IntlPhoneField(
                          controller: _phoneController,
                          initialCountryCode: 'KG',
                          onChanged: (phone) {},
                        ),
                        const SizedBox(height: 60),
                        ElevatedButton(
                          onPressed: () {
                            Routes.instance.push(
                                widget: SendPinCodeScreen(), context: context);
                          },
                          child: const Text('Войти',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey,
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
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _firstNameController,
                              hintText: 'First Name',
                            ),
                            CustomTextField(
                              controller: _lastNameController,
                              hintText: 'Last Name',
                            ),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Логин',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                            ),
                            CustomTextField(
                              controller: _confirmPasswordController,
                              hintText: 'Confirm Password',
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              onPressed: () async {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                              child: const Text('Register',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                  primary: _signUpFormKey == true
                                      ? Colors.blueGrey
                                      : Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: Size(double.infinity, 50)),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Воостановить пароль ',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
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
        ));
  }
}
