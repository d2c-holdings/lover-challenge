import 'package:lover_challenge/data/model/analytics/analytics_event.dart';

class BreedRemovedEvent implements AnalyticsEvent {
  final String breedId;

  BreedRemovedEvent({required this.breedId});

  @override
  String get eventName => 'breed_removed';

  @override
  Map<String, dynamic> get properties => {'breed_id': breedId};
}
