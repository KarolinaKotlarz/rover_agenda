import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'globals.dart';

class HttpApiClient {
  final String mainUrl = 'https://roveragenda.me';
  late SharedPreferences prefs;

  Future<User> login(String username, String password) async {
    User _user;

    Map<String, dynamic> userData = {
      "username": username,
      "password": password,
    };

    final response = await http.post(
      Uri.parse('$mainUrl/api/members/authenticate'),
      body: userData,
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      var res = new Map<String, dynamic>.from(json.decode(response.body));

      _user = User.fromJson(res['result']);

      return _user;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  Future<List<Teacher>> fetchTeachers() async {
    List<Teacher> _teachersList = List.empty(growable: true);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final response = await http.get(
      Uri.parse('$mainUrl/api/teachers/all'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      var res = new Map<String, dynamic>.from(json.decode(response.body));

      _teachersList = (res['result'] as List<dynamic>).map((d) => Teacher.fromJson(d)).toList();

      return _teachersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  Future<List<FAQ>> fetchFAQs() async {
    List<FAQ> _FAQsList = List.empty(growable: true);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final response = await http.get(
      Uri.parse('$mainUrl/api/faqs'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      var res = json.decode(response.body);

      _FAQsList = (res as List<dynamic>).map((d) => FAQ.fromJson(d)).toList();

      debugPrint(response.body);

      return _FAQsList;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  Future<List<FAQ>> fetchSchoolEvents() async {
    List<FAQ> _FAQsList = List.empty(growable: true);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final response = await http.get(
      Uri.parse('$mainUrl/api/teachers/all'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      var res = new Map<String, dynamic>.from(json.decode(response.body));

      _FAQsList = (res['result'] as List<dynamic>).map((d) => FAQ.fromJson(d)).toList();

      return _FAQsList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  Future<List<LunchMenuItem>> fetchLunchMenuItems() async {
    List<LunchMenuItem> _lunchMenuItemsList = List.empty(growable: true);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final response = await http.get(
      Uri.parse('$mainUrl/api/lunchmenuitems/all'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      var res = new Map<String, dynamic>.from(json.decode(response.body));

      debugPrint(response.body);

      _lunchMenuItemsList = (res['result'] as List<dynamic>).map((d) => LunchMenuItem.fromJson(d)).toList();

      return _lunchMenuItemsList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  Future<List<FAQ>> fetchClasses(String userId) async {
    List<FAQ> _FAQsList = List.empty(growable: true);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final response = await http.get(
      Uri.parse('$mainUrl/api/teachers/all'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      var res = new Map<String, dynamic>.from(json.decode(response.body));

      _FAQsList = (res['result'] as List<dynamic>).map((d) => FAQ.fromJson(d)).toList();

      return _FAQsList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  Future<List<Extracurricular>> fetchExtracurriculars() async {
    List<Extracurricular> _extracurricularsList = List.empty(growable: true);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final response = await http.get(
      Uri.parse('$mainUrl/api/extracurriculars/all'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      var res = new Map<String, dynamic>.from(json.decode(response.body));

      debugPrint(res['result'].toString());

      _extracurricularsList = (res['result'] as List<dynamic>).map((d) => Extracurricular.fromJson(d)).toList();

      return _extracurricularsList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }
}