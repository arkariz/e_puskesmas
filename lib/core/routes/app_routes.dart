// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const REG_PASIEN_UMUM = _Paths.REG_PASIEN_UMUM;
  static const REG_PASIEN_BPJS = _Paths.REG_PASIEN_BPJS;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';

  static const REGISTER = '/register';
  static const REG_PASIEN_UMUM = '/regPasienUmum';
  static const REG_PASIEN_BPJS = '/regPasienBpjs';
}
