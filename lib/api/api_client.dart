import 'dart:convert';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

class ApiClient {
  //API SETTINGS
  static const int timeoutinseconds = 30;
  final String appBaseUrl = 'http://44.217.132.127:1337/';
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };
  final _client = Http.Client();

  ///
  static const String noInternetMessage =
      "No Internet connection. Please check your Internet connection.";

  ApiClient();

  Future<Http.Response> getData(String uri) async {
    var url = Uri.parse(appBaseUrl + uri);
    try {
      debugPrint('=====> API CALL: $url\nHeaders: $headers');
      Http.Response response = await Http.get(url, headers: headers)
          .timeout(const Duration(seconds: timeoutinseconds));
      debugPrint('======> API RESPONSE: ${response.body}');
      return response;
    } catch (e) {
      return Http.Response('{"status":"error","message":"$e"}', 500);
    }
  }

  Future<Http.Response> postData(String uri, dynamic body,
      {bool? files}) async {
    try {
      final requestUri = Uri.parse('$appBaseUrl$uri');
      debugPrint('=====> API CALL: $requestUri\nHeaders: $headers');
      debugPrint('======> API BODY: $body');

      final response = await _client
          .post(
            requestUri,
            body: (files != null && files == true) ? body : jsonEncode(body),
            headers: headers,
          )
          .timeout(const Duration(seconds: timeoutinseconds));

      debugPrint(
          '====> API Response: [${response.statusCode}] $uri\n${response.body}');

      return response;
    } catch (e) {
      debugPrint('Error when API call: $e');
      return Http.Response('{"status":"error","message":"$e"}', 500);
    }
  }

  Future<Http.Response> putData(String uri, dynamic body) async {
    try {
      debugPrint('=====> API CALL: $uri\nHeaders: $headers');

      final requestUri = Uri.parse('$appBaseUrl$uri');
      debugPrint('======> API BODY: $body');

      final response = await _client
          .put(
            requestUri,
            body: jsonEncode(body),
            headers: headers,
          )
          .timeout(const Duration(seconds: timeoutinseconds));

      debugPrint(
          '====> API Response: [${response.statusCode}] $uri\n${response.body}');

      return response;
    } catch (e) {
      debugPrint('Error when API call: $e');
      return Http.Response('{"status":"error","message":"$e"}', 500);
    }
  }

  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}

    Response _response = Response(
      body: _body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
        headers: response.request!.headers, // Add a null check here
        method: response.request!.method,
        url: response.request!.url,
      ),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );

    if (_response.statusCode != 200 &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().startsWith('{errors: [{code:')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['errors']);
      } else if (_response.body.toString().startsWith('{message')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);
      }
    } else if (_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    debugPrint(
        '====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    return _response;
  }
}
