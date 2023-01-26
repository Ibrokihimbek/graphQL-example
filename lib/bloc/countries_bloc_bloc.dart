import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_example/bloc/countries_bloc_event.dart';
import 'package:graphql_example/bloc/countries_bloc_state.dart';
import 'package:graphql_example/data/api/api_client.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc({required this.apiClient}) : super(CountryLoadInProgress()) {
    on<CountryFetchStarted>(_onCountryFetchStarted);
  }

  final CountriesApiClient apiClient;

  Future<void> _onCountryFetchStarted(
    CountryFetchStarted event,
    Emitter<CountryState> emit,
  ) async {
    emit(CountryLoadInProgress());
    try {
      final jobs = await apiClient.getCountr();
      emit(CountryLoadSuccess(jobs));
    } catch (error) {
      print("ERRROR:$error");
      emit(CountryLoadFailure());
    }
  }
}
