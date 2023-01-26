import 'package:graphql/client.dart';
import 'package:graphql_example/data/models/country_model.dart';
import 'package:graphql_example/data/query/countries_query.dart' as queris;

class GetCountrRequestFailure implements Exception {}

class CountriesApiClient {
  const CountriesApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory CountriesApiClient.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return CountriesApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }


  final GraphQLClient _graphQLClient;

  Future<List<CountryModel>> getCountr() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queris.getCountries)),
    );
    if (result.hasException) throw GetCountrRequestFailure();
    final data = result.data?['countries'] as List;
    print("SUCCESS DATA:${result.data.toString()}");
    return data
        .map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}