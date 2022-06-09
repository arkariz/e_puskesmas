// ignore_for_file: prefer_const_constructors

import 'package:e_puskesmas/features/poli/presentation/pages/home_page.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/poli_form.dart';
import 'package:e_puskesmas/features/userAuth/presentation/pages/login.dart';
import 'package:e_puskesmas/features/userAuth/presentation/pages/register.dart';
import 'package:e_puskesmas/features/userAuth/presentation/pages/register_bpjs_form.dart';
import 'package:e_puskesmas/features/userAuth/presentation/pages/register_umum_form.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: _Paths.REG_PASIEN_BPJS,
      page: () => RegisterBpjsForm(),
    ),
    GetPage(
      name: _Paths.REG_PASIEN_UMUM,
      page: () => RegisterUmumForm(),
    ),
    GetPage(
      name: _Paths.POLI_FORM,
      page: () => PoliForm(),
    ),
  ];
}
