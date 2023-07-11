import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/features/home/views/profile/my_ticket_screen.dart';

import '../../generated/locale_keys.g.dart';
import '../../routes/router.dart';

class SuccessfullyBookedAQueue extends StatelessWidget {
  const SuccessfullyBookedAQueue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded,
                color: Colors.green, size: 100),
            const SizedBox(height: 20),
             Text(LocaleKeys.vy_uspeshno.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
             Text(
              LocaleKeys.data_priema.tr(),
              style: TextStyle(fontSize: 13, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Routes.instance.push(widget: MyTicketScreen(), context: context);
              },
              child:  Text(LocaleKeys.posmotret.tr(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
