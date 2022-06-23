import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'globals.dart';

class HttpApiClient {
  final String mainUrl = 'https://roveragenda.me';

  Future<List<Teacher>> fetchTeachers() async {
    List<Teacher> _teachersList = List.empty(growable: true);

    final response = await http.get(
      Uri.parse('$mainUrl/api/teachers/all'),
      headers: {
        'Authorization': 'Bearer ',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> values = new List.empty(growable: true);
      values = json.decode(response.body);

      if(values.length>0){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic> map=values[i];
            _teachersList .add(Teacher.fromJson(map));
            debugPrint('Id-------${map['id']}');
          }
        }
      }

      return _teachersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }
}