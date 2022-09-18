import 'package:lover_challenge/data/model/analytics/analytics_event.dart';
import 'package:lover_challenge/data/model/analytics/analytics_people_property.dart';

abstract class AnalyticsServiceContract {
  Future<String> get userIdentifier async => throw UnimplementedError();

  Future trackEvent(AnalyticsEvent event) async {
    throw UnimplementedError();
  }

  Future setPeopleProperty(AnalyticsPeopleProperty prop) async {
    throw UnimplementedError();
  }
}
