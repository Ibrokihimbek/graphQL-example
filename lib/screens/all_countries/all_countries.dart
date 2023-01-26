import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_example/bloc/countries_bloc_bloc.dart';
import 'package:graphql_example/bloc/countries_bloc_state.dart';
import 'package:graphql_example/screens/single_coutry/single_coutry.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Countries',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoadInProgress) {
              return const CircularProgressIndicator();
            }
            if (state is CountryLoadSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.country.length,
                itemBuilder: (context, index) {
                  final country = state.country[index];
                  return ListTile(
                    key: Key(country.native),
                    title: Text(country.name),
                    trailing: Text(country.emoji),
                    subtitle: Text(country.capital),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SingleCoutryPage(
                            countryModel: country,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
