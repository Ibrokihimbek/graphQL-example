import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:graphql_example/data/models/country_model.dart';

class SingleCoutryPage extends StatelessWidget {
  final CountryModel countryModel;
  const SingleCoutryPage({super.key, required this.countryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          countryModel.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flag.fromString(countryModel.code, height: 60, width: 60),
            const SizedBox(height: 12),
            Text(
              'Country code:  ${countryModel.code}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Country capital:  ${countryModel.capital}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Country currency:  ${countryModel.currency}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Country native:  ${countryModel.native}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Country phone:  ${countryModel.phone}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
