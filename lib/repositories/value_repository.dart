import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:twenv/model/spending_model.dart';

class SpendingRepository {
  static Future<DatabaseReference> fetchSpendings() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final ref = FirebaseDatabase.instance
        .ref()
        .child('users')
        .child(auth.currentUser!.uid)
        .child('spendings');

    List<SpendingModel> _spendings = [];

    print(ref.get());
    print(ref.get());

    return ref;

    // if (snapshot.exists) {
    //   List<SpendingModel> spendings = [];

    //   // Convert snapshot.value to a List<dynamic>
    //   List<dynamic>? dataList = snapshot.value as List<dynamic>?;

    //   if (dataList != null) {
    //     for (var data in dataList) {
    //       Map<String, dynamic> spendingData = Map<String, dynamic>.from(data);

    //       // Extract data from spendingData map
    //       String description = spendingData['description'];
    //       String date = spendingData['date'];
    //       double spendingValue = double.parse(spendingData['value'].toString());

    //       // Create a SpendingModel object and add it to the list
    //       SpendingModel spending = SpendingModel(
    //         description: description,
    //         date: date,
    //         value: spendingValue,
    //       );
    //       spendings.add(spending);
    //     }
    //   }

    //   return spendings;
    // } else {
    //   return [];
    // }
  }
}
