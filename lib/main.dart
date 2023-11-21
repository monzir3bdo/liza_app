import 'package:assignment_project/core/database/cache_helper.dart';
import 'package:assignment_project/core/local_notification.dart';
import 'package:assignment_project/features/products/presentation/controller/products_binding.dart';
import 'package:assignment_project/features/splash/presentation/pages/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ProductsBinding(),
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
