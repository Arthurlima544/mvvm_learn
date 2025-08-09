import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  static const _strings = <String, String>{
    'activities': 'Activities',
    'bookNewTrip': 'Book New Trip',
    'errorWhileLoadingbooking': 'Error while loading booking',
    'errorWhileLoadingHome': 'Error while loading Home',
    'errorWhileLogin': 'Error while Login',
    'login': 'Login',
    'tryAgain': 'Try Again',
    'errorWhileLogout': 'Error while Logout',
    'nameTrips': '{name}\'s Trips',
  };

  static String _get(String label) =>
      _strings[label] ?? '[${label.toUpperCase()}]';

  String get activities => _get('activities');

  String get bookNewTrip => _get('bookNewTrip');

  String get tryAgain => _get('tryAgain');

  String get errorWhileLoadingbooking => _get('errorWhileLoadingbooking');

  String get errorWhileLoadingHome => _get('errorWhileLoadingHome');

  String get errorWhileLogin => _get('errorWhileLogin');

  String get login => _get('login');

  String get errorWhileLogout => _get('errorWhileLogout');

  String nameTrips(String name) => _get('nameTrips').replaceAll('{name}', name);
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
