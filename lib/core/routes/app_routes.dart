// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const REG_PASIEN_UMUM = _Paths.REG_PASIEN_UMUM;
  static const REG_PASIEN_BPJS = _Paths.REG_PASIEN_BPJS;
  static const POLI_FORM = _Paths.POLI_FORM;
  static const POLI_TICKET = _Paths.POLI_TICKET;
  static const NAV_BOTTOM = _Paths.NAV_BOTTOM;
  static const EDIT_PROFIL = _Paths.EDIT_PROFIL;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';

  static const REGISTER = '/register';
  static const REG_PASIEN_UMUM = '/regPasienUmum';
  static const REG_PASIEN_BPJS = '/regPasienBpjs';

  static const POLI_FORM = '/poli_form';
  static const POLI_TICKET = '/poli_ticket';
  static const NAV_BOTTOM = '/nav_bottom';
  static const EDIT_PROFIL = '/edit_profile';
}
