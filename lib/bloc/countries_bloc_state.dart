import 'package:graphql_example/data/models/country_model.dart';

abstract class CountryState {}

class CountryLoadInProgress extends CountryState {}

class CountryLoadSuccess extends CountryState {
  CountryLoadSuccess(this.country);

  final List<CountryModel> country;
}

class CountryLoadFailure extends CountryState {}