import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../services/customExceptionHandling.dart';

class ApiBaseHelper {
  static ApiBaseHelper shared = ApiBaseHelper();

  String baseUrl = "https://60e29b749103bd0017b4743f.mockapi.io/api/v1/";

  final apiTimeOutDuration = const Duration(seconds: 30);

  ///get API call
  Future<http.Response> get(String url) async {
    debugPrint('Api Get, url ${baseUrl + url}');
    try {
      return await http
          .get(Uri.parse(baseUrl + url))
          .timeout(apiTimeOutDuration);
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }

  ///post API call
  Future<http.Response> post(
      {required String url,
      required dynamic body,
      Map<String, String>? headers}) async {
    debugPrint('Api Post, url ${baseUrl + url}');
    try {
      return await http
          .post(Uri.parse(baseUrl + url), body: body, headers: headers)
          .timeout(apiTimeOutDuration);
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }

  ///put API call
  Future<http.Response> put(String url, dynamic body) async {
    debugPrint('Api Put, url ${baseUrl + url}');
    try {
      return await http
          .put(Uri.parse(baseUrl + url), body: body)
          .timeout(apiTimeOutDuration);
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }

  ///delete API call
  Future<http.Response> delete(String url) async {
    debugPrint('Api Delete, url ${baseUrl + url}');
    try {
      return await http
          .delete(Uri.parse(baseUrl + url))
          .timeout(apiTimeOutDuration);
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }
}
