import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart' as httpTest;

void main() {
  group('getTransactions', () {
    test('returns number of transactions when successful', () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = httpTest.MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = [
          {
            "date": "2021-07-05T00:34:29.993Z",
            "amount": "209.78",
            "type": "withdrawal",
            "currencyCode": "XBD",
            "iban": "IE53624A00844716683079",
            "description":
                "payment transaction at Hilpert, Emard and Denesik using card ending with ***9524 for JPY 324.08 in account ***83781284",
            "bic": "JBFEMWP1745",
            "id": "1"
          },
        ];
        return Response(jsonEncode(response), 200);
      });

      final response = await mockHTTPClient.get(Uri.parse(
          "https://60e29b749103bd0017b4743f.mockapi.io/api/v1/transactions"));

      print(response.body);
      final body = jsonDecode(response.body);
      expect(body, [
        {
          "date": "2021-07-05T00:34:29.993Z",
          "amount": "209.78",
          "type": "withdrawal",
          "currencyCode": "XBD",
          "iban": "IE53624A00844716683079",
          "description":
              "payment transaction at Hilpert, Emard and Denesik using card ending with ***9524 for JPY 324.08 in account ***83781284",
          "bic": "JBFEMWP1745",
          "id": "1"
        },
      ]);
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = httpTest.MockClient((request) async {
        const response = "Not Found";
        return Response(jsonEncode(response), 404);
      });
      final response = await mockHTTPClient.get(Uri.parse(
          "https://60e29b749103bd0017b4743f.mockapi.io/api/v1/transaction"));

      print(response.body);
      expect(jsonDecode(response.body), "Not Found");
    });
  });
}
