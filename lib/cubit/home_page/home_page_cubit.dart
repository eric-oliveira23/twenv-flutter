import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenv/model/spending_model.dart';

part 'home_page_states.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitial());

  double _allSpendingsValue = 0;
  double _allEarningsValue = 0;

  void loadInfos() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    DataSnapshot snapshot = await databaseReference
        .child('users')
        .child(auth.currentUser!.uid)
        .child('spendings')
        .get();
    List<SpendingModel> spendings = [];

    final dynamic snapshotData = snapshot.value;

    snapshotData.forEach(
      (key, value) {
        var spendingModel = SpendingModel(
          description: value['description']?.toString() ?? '',
          date: value['date']?.toString() ?? '',
          value: double.parse(value['value']?.toString() ?? '0'),
        );
        spendings.add(spendingModel);
      },
    );

    for (var element in spendings) {
      _allSpendingsValue += element.value;
    }
    print(_allSpendingsValue);
  }
}
