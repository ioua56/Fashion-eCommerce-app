import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_ecommerce_app/data/categories_data.dart';
import 'package:fashion_ecommerce_app/data/store_data.dart';
import 'package:fashion_ecommerce_app/model/categories_model.dart';
import 'package:fashion_ecommerce_app/screens/cart.dart';
import 'package:fashion_ecommerce_app/screens/home.dart';
import 'package:fashion_ecommerce_app/screens/search.dart';
import 'package:fashion_ecommerce_app/screens/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_theme.dart';
import 'main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        Search.routeName: (context) => Search(),
        SettingScreen.routeName: (context) => SettingScreen(),
      },
      home: MainWrapper(),
    ),
  );
}
