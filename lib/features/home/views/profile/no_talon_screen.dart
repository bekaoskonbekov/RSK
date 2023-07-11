import 'package:flutter/material.dart';

class NoTalonScreen extends StatefulWidget {
  const NoTalonScreen({super.key});

  @override
  State<NoTalonScreen> createState() => _NoTalonScreenState();
}

class _NoTalonScreenState extends State<NoTalonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Мои талоны',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 147),
              Image.asset(
                "assets/ttalon.jpg",
                height: 188,
                width: 247,
              ),
              const SizedBox(height: 60),
              const Text('У Вас пока нет талонов',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              const Text(
                'Пожалуйста забронируйте талон в \n приложении',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
