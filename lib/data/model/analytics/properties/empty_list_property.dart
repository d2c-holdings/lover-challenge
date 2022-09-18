import 'package:lover_challenge/data/model/analytics/analytics_people_property.dart';

class EmptyListProp implements AnalyticsPeopleProperty {
  final bool isEmpty;

  EmptyListProp({required this.isEmpty});

  @override
  String get name => 'empty_list';

  @override
  get value => isEmpty;
}
