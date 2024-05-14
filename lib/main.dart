import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seclob_task/bottombar.dart';
import 'package:seclob_task/controller/api_provider.dart';

void main(){
  runApp(const MyApp());
}class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}