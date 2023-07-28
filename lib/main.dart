import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsk1/common/widgets/custom_bottom_nav_bar.dart';
import 'package:rsk1/generated/codegen_loader.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/client/http_client.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/auth/views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = PostHttpOverrides();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      assetLoader: const CodegenLoader(),
      child: ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  String? token = '';

  String? userid = '';

  void checktoken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('x-auth-token');
    userid = sp.getString('user-id');
    setState(() {});
  }

  @override
  void initState() {
    checktoken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RSK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: userid == ''
          ? const LoginScreen()
          : ref.watch(authControllerGetUsetDetails).when(
                data: (data) {
                  return const CustomBottomBar();
                },
                error: (error, stackTrace) => error is SocketException
                    ? const Scaffold(
                        body: Center(
                          child: Text('No internet connection'),
                        ),
                      )
                    : const Scaffold(
                        body: Center(
                          child: Text('Something went wrong'),
                        ),
                      ),
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
    );
  }
}
