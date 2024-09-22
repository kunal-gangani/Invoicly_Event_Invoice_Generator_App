import 'package:flutter/material.dart';
import 'package:invoice_generator/Views/DetailsPage/detail_page.dart';
import 'package:invoice_generator/Views/HomePage/home_page.dart';
import 'package:invoice_generator/Views/PDF_Page/pdf_page.dart';
import 'package:invoice_generator/Views/SplashScreen/splash_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';
  static String pdfPage = 'pdf_page';

  static Map<String, WidgetBuilder> myRoutes = {
    Routes.splashScreen: (context) => const SplashScreen(),
    Routes.homePage: (context) => const HomePage(),
    Routes.detailPage: (context) => const DetailPage(),
    
    Routes.pdfPage: (context) {
      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return PdfPreviewScreen(eventDetails: args);
    },
  };
}
