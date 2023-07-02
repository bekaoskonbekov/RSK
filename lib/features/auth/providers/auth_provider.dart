
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:rsk1/common/widgets/custom_bottom_nav_bar.dart';

import '../services/auth_service.dart';
final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
class LoginRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void fetch() {
    service.login(email: email.text, password: password.text).then((value) {
      if (value?.JwtTokens != null) {
        Grock.back();
        Grock.toRemove(CustomBottomBar());
      } else {
        Grock.back();
        Grock.snackBar(
            title: "Error",
             description: 'Errrorrrrr',);
      }
    });
  }
}