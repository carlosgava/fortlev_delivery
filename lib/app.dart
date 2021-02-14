import 'package:flutter/material.dart';
import 'package:fortlev_delivery/pages/splash.page.dart';
import 'package:fortlev_delivery/shared/base_app.theme.dart';

class FortlevDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortlev Delivery',
      debugShowCheckedModeBanner: false,
      theme: baseAppTheme(),
      home: SplashPage(),
    );
  }
}
