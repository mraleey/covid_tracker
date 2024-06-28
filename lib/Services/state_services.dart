import 'dart:convert';

import 'package:covid_19/Model/world_states.dart';
import 'package:covid_19/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStates() async {
    final response = await http.get(
      Uri.parse(AppUrl.worldStatesApi),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> getCountryList() async {
    var data;
    final response = await http.get(
      Uri.parse(AppUrl.countryList),
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
