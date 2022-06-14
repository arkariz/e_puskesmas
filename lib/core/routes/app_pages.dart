// ignore_for_file: prefer_const_constructors

import 'package:e_puskesmas/features/poli/presentation/binding/home_binding.dart';
import 'package:e_puskesmas/features/poli/presentation/binding/navigation_binding.dart';
import 'package:e_puskesmas/features/poli/presentation/binding/poli_binding.dart';
import 'package:e_puskesmas/features/poli/presentation/binding/poli_ticket_binding.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/edit_profile_page.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/home_page.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/navigation_bottom.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/poli_form.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/poli_ticket.dart';
import 'package:e_puskesmas/features/userAuth/presentation/binding/auth_binding.dart';
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
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: _Paths.REG_PASIEN_BPJS,
      page: () => RegisterBpjsForm(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REG_PASIEN_UMUM,
      page: () => RegisterUmumForm(),
    ),
    GetPage(
      name: _Paths.POLI_FORM,
      page: () => PoliForm(),
      binding: PoliBinding(),
    ),
    GetPage(
      name: _Paths.POLI_TICKET,
      page: () => PoliTickerScreen(),
      binding: PoliTicketBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BOTTOM,
      page: () => NavigationBottom(),
      binding: NavigationBottomBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => EditProfilePage(),
      binding: NavigationBottomBinding(),
    ),
  ];
}
