import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:quick_shift_admin/view/admin_login_screen.dart';
import 'controller/login_controller.dart';
import 'firebase_options.dart';
import 'view/layout_responsive.dart';
import 'view/mobile_home_screen/mobile_admin_home_screen.dart';
import 'view/web_admin_login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(LoginController(),tag: 'login_controller');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  AdminLoginScreen(),
    );
  }
}
