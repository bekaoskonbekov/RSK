// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:rsk1/features/auth/pages/register_page.dart';

import '../../../utilis/text_app.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.language,
              color: Color(0xff000000),
              size: 20,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
          const Text(
            'Русский',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xff000000),
              size: 20,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppText.rsk,
              style: TextStyle(
                fontFamily: 'assets/fonts/BebasNeue',
                color: Color(0xff272DC8),
                fontSize: 50,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Добро пожаловать !',
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const RegisterPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff272DC8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 350,
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Вход',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Создать новый аккаунт',
              style: TextStyle(
                color: Color(0xff0F4F9D),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
