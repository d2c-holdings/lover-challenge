import 'package:lover_challenge/data/model/analytics/analytics_event.dart';

class FetchedBreedsEvent implements AnalyticsEvent {
  final int fetchedCount;

  FetchedBreedsEvent({required this.fetchedCount});

  @override
  String get eventName => 'fetched_breeds';

  @override
  Map<String, dynamic> get properties => {'length': fetchedCount};
}
