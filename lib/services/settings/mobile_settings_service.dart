import 'package:anytime/entities/app_settings.dart';
import 'package:anytime/services/settings/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileSettingsService extends SettingsService {
  static SharedPreferences _sharedPreferences;
  static MobileSettingsService _instance;

  MobileSettingsService._create();

  static Future<MobileSettingsService> instance() async {
    if (_instance == null) {
      _instance = MobileSettingsService._create();

      _sharedPreferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  @override
  bool get markDeletedEpisodesAsPlayed => _sharedPreferences.getBool('markplayedasdeleted') ?? false;

  @override
  set markDeletedEpisodesAsPlayed(bool value) {
    _sharedPreferences.setBool('markplayedasdeleted', value);
  }

  @override
  bool get storeDownloadsSDCard => _sharedPreferences.getBool('savesdcard') ?? false;

  @override
  set storeDownloadsSDCard(bool value) {
    _sharedPreferences.setBool('savesdcard', value);
  }

  @override
  bool get themeDarkMode {
    var theme = _sharedPreferences.getString('theme') ?? 'light';

    return theme == 'dark';
  }

  @override
  set themeDarkMode(bool value) {
    _sharedPreferences.setString('theme', value ? 'dark' : 'light');
  }

  @override
  AppSettings settings;
}
