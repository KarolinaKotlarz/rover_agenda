import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'globals.dart';

class HttpApiClient {
  final String mainUrl = 'https://roveragenda.me';

  Future<Teacher> fetchTeachers() async {
    final response = await http.get(
      Uri.parse('$mainUrl/api/teachers/all'),
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI3ZTJlMDgwNS03YzNlLTQ5YWItOGUyNi1mMjFiODUzNWI4OGYiLCJuYW1lIjoiYWRtaW4iLCJqdGkiOiI4MDRhOTVkYS0yMWYzLTRhMDgtYjVkMi1kN2M0NjVhMTRhYjciLCJyb2xlIjpbIkFkbWluIiwiVXNlciJdLCJuYmYiOjE2NTU1NzY1NjcsImV4cCI6MTY1NjE4MTM2NywiaWF0IjoxNjU1NTc2NTY3fQ.ZZNIgFa_dxk5vEd8o5WQ2W6KyJmgVAJFGDwV1OKTXeU',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Teacher.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}