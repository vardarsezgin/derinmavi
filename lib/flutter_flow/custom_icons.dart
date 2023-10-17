import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _icomoonFamily = 'Icomoon';
  static const String _locFamily = 'Loc';
  static const String _moonFamily = 'Moon';
  static const String _diveFamily = 'Dive';
  static const String _ddddFamily = 'Dddd';
  static const String _navbariconsFamily = 'Navbaricons';

  // icomoon
  static const IconData kdiver2 = IconData(0xe901, fontFamily: _icomoonFamily);
  static const IconData kscuba = IconData(0xe900, fontFamily: _icomoonFamily);

  // loc
  static const IconData kdiveflag = IconData(0xe900, fontFamily: _locFamily);

  // moon
  static const IconData kmoon1 = IconData(0xe900, fontFamily: _moonFamily);

  // dive
  static const IconData kcave1 = IconData(0xe900, fontFamily: _diveFamily);
  static const IconData kocean = IconData(0xe901, fontFamily: _diveFamily);
  static const IconData kdiving2 = IconData(0xe902, fontFamily: _diveFamily);
  static const IconData kcoralReef1 = IconData(0xe903, fontFamily: _diveFamily);
  static const IconData kboat = IconData(0xe904, fontFamily: _diveFamily);

  // dddd
  static const IconData kslideIcon11 =
      IconData(0xe900, fontFamily: _ddddFamily);

  // navbaricons
  static const IconData kfavnav =
      IconData(0xe900, fontFamily: _navbariconsFamily);
  static const IconData kaddnav =
      IconData(0xe901, fontFamily: _navbariconsFamily);
  static const IconData kprofilenav =
      IconData(0xe902, fontFamily: _navbariconsFamily);
  static const IconData ksearchnav =
      IconData(0xe903, fontFamily: _navbariconsFamily);
  static const IconData khomenav =
      IconData(0xe904, fontFamily: _navbariconsFamily);
}
