import 'package:get/get.dart';
import 'package:lover_challenge/data/model/analytics/analytics_people_property.dart';
import 'package:lover_challenge/data/model/analytics/analytics_event.dart';
import 'package:lover_challenge/data/service/analytics/analytics_service_contract.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AnalyticsService extends GetxService implements AnalyticsServiceContract {
  final Mixpanel mixpanel;

  AnalyticsService(this.mixpanel);

  static Future<AnalyticsService> create() async {
    const String mixpanelApiKey = 'bebcd1425dd1eb1926b978bc0fd84ce4';

    var mixpanel = await Mixpanel.init(
      mixpanelApiKey,
      trackAutomaticEvents: true,
      optOutTrackingDefault: false,
    );

    var instance = AnalyticsService(mixpanel);
    var id = await instance.userIdentifier;
    mixpanel.identify(id);

    return instance;
  }

  @override
  Future<String> get userIdentifier async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user_identifier';

    String? id = prefs.getString(key);
    if (id == null) {
      id = const Uuid().v1();
      await prefs.setString(key, id);
    }

    return id;
  }

  @override
  Future trackEvent(AnalyticsEvent event) async {
    mixpanel.track(event.eventName, properties: event.properties);
  }

  @override
  Future setPeopleProperty(AnalyticsPeopleProperty prop) async {
    mixpanel.getPeople().set(prop.name, prop.value);
  }
}
