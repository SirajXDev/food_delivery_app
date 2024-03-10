import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/popular_product_controller.dart';
import 'package:flutter_application_1/Controller/recommended_product_controller.dart';
import 'package:flutter_application_1/Home/main_food_page.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:get/get.dart';
import 'Helper/dependencies.dart' as dep;
 


  

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  
   HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
  

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    Get.find<PopularProductController>().getPopularProductList();
     Get.find<RecommendedProductController>().getRecommendedProductList();
     

    return GetMaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      home: const MainFoodPage(),
       initialRoute: RouteHelper.initial,
       getPages: RouteHelper.routes,
    
      // const MyHomePage(title: 'Flutter Demo Home Page'),
  
    );
    
  }

}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}