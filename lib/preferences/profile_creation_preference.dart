import 'package:shared_preferences/shared_preferences.dart';

Future setProfileSetUpPreference(bool val) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('hasSetProfile', val);
}
