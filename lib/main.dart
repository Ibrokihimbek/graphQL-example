import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_example/bloc/countries_bloc_bloc.dart';
import 'package:graphql_example/bloc/countries_bloc_event.dart';
import 'package:graphql_example/data/api/api_client.dart';
import 'package:graphql_example/screens/all_countries/all_countries.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CountryBloc(apiClient: CountriesApiClient.create())
            ..add(CountryFetchStarted()),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CountriesPage());
    
  }
}
