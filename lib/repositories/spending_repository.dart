import 'dart:convert';
import 'package:twenv/model/spending_model.dart';
import 'package:http/http.dart' as http;

class GetSpending {
  static Future<List<SpendingModel>> fetchSpendings() async {
    final response = await http.get(
      Uri.parse('https://twenv-api.onrender.com/users/1/spendings'),
    );

    final List<SpendingModel> spendings = [];

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final spendingList = jsonData['spendings'] as List<dynamic>;

      return spendingList.map(
        (spendingData) {
          return SpendingModel.fromJson(spendingData);
        },
      ).toList();
    }

    return spendings;
  }
}
