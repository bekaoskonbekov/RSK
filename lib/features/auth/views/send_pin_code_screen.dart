import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rsk1/common/widgets/custom_bottom_nav_bar.dart';

import '../../../routes/router.dart';

class SendPinCodeScreen extends StatelessWidget {
  const SendPinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pinController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text(
                'Код из СМС',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Введите 4-значный код, который мы \n отправили по номеру ',
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const Text('+000000000', style: TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 50,
              ),
              Container(
                  child: PinCodeTextField(
                length: 4,
                controller: pinController,
                appContext: context,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                  fieldWidth: 50,
                  disabledColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedColor: Colors.grey,
                  inactiveColor: Colors.blue,
                  activeFillColor: Colors.white,
                  activeColor: Colors.blue,
                  borderWidth: 1,
                ),
                validator: (v) {
                  return v!.length < 4 ? 'invalid password' : null;
                },
                onChanged: (String value) {},
              )),
              const SizedBox(height: 60),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Отправить код ещё раз через'),
                  Text(' 01:23 ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),), 
                ],
              ),
              const SizedBox(height: 80),
                      ElevatedButton(
                          onPressed: () {
                            Routes.instance.push(widget: CustomBottomBar(), context: context);
                          },
                          child:  const Text('Войти',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(double.infinity, 50)),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
