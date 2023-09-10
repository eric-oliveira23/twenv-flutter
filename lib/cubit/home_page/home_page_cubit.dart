import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenv/model/spending_model.dart';

part 'home_page_states.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitial()) {
    loadValues();
  }

  double _allSpendingsValue = 0;
  double _allEarningsValue = 0;

  double get allSpendingsValue => _allSpendingsValue;
  double get allEarningsValue => _allEarningsValue;

  Future<void> loadValues() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    DataSnapshot spendingsSnapshot = await databaseReference
        .child('users')
        .child(auth.currentUser!.uid)
        .child('spendings')
        .get();

    List<SpendingModel> spendings = [];

    final dynamic spendingsData = spendingsSnapshot.value;

    if (spendingsData is Map) {
      spendingsData.forEach((key, value) {
        var spendingModel = SpendingModel(
          description: value['description']?.toString() ?? '',
          date: value['date']?.toString() ?? '',
          value: double.parse(value['value']?.toString() ?? '0'),
        );
        spendings.add(spendingModel);
      });
    }

    for (var element in spendings) {
      _allSpendingsValue += element.value;
    }

    // Get earnings

    DataSnapshot earningsSnapshot = await databaseReference
        .child('users')
        .child(auth.currentUser!.uid)
        .child('earnings')
        .get();

    List<SpendingModel> earnings = [];

    final dynamic earningsData = earningsSnapshot.value;

    if (spendingsData is Map) {
      earningsData.forEach((key, value) {
        var spendingModel = SpendingModel(
          description: value['description']?.toString() ?? '',
          date: value['date']?.toString() ?? '',
          value: double.parse(value['value']?.toString() ?? '0'),
        );
        earnings.add(spendingModel);
      });
    }

    for (var element in earnings) {
      _allEarningsValue += element.value;
    }

    emit(HomePageLoaded());
  }
}
