import 'dart:convert';

import 'package:sentrax_test/networking/api_base_helper.dart';
import 'package:sentrax_test/services/customExceptionHandling.dart';
import 'package:sentrax_test/services/helper_functions.dart';

import 'models.dart';

class DB {
  static final shared = DB();

  Future<List<Transaction>> getAllTransactions() async {
    try {
      final response = await ApiBaseHelper.shared.get("transactions");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return List.generate(
            body.length, (index) => Transaction.fromJson(body[index]));
      } else {
        HelperFunction().showToast(response.body);
      }

      return [];
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }
}
