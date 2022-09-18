import 'package:lover_challenge/data/model/analytics/analytics_event.dart';

class TabOpenedEvent implements AnalyticsEvent {
  final String tabName;

  TabOpenedEvent({required this.tabName});

  @override
  String get eventName => 'tab_opened';

  @override
  Map<String, dynamic> get properties => {'tab': tabName};
}
