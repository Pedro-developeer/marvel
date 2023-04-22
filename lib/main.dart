import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_mottu/core/manager/dependency_manager.dart';
import 'package:marvel_mottu/features/presenter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffEC242C),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: DependencyManager(),
        )
      ],
    );
  }
}
