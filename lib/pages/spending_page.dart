import 'package:flutter/material.dart';
import 'package:twenv/model/spending_model.dart';
import '../components/appbar_content.dart';
import '../components/fab.dart';
import '../components/main_content_header.dart';
import '../components/tiles/spending_tile.dart';
import 'add_value_page/add_value_page.dart';

class SpendingPage extends StatefulWidget {
  const SpendingPage({super.key});

  @override
  State<SpendingPage> createState() => SpendingPageState();
}

late List<SpendingModel> _spendings;

class SpendingPageState extends State<SpendingPage> {
  @override
  void initState() {
    _spendings = _generateMockedList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const AppBarTitle(),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('enrique_black'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            MainContentContainer(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _spendings.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SpendingTile(
                      spending: _spendings[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FabMain(
        icon: const Icon(Icons.add),
        onTap: () => fabClciked(),
      ),
    );
  }

  void fabClciked() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const AddValuePage(),
      ),
    );
  }

  List<SpendingModel> _generateMockedList() {
    List<SpendingModel> spendings = [];

    spendings.addAll([
      SpendingModel(
        description: "Red Dead Redemption 2",
        date: DateTime(2023, 12, 07),
        value: 98.99,
      ),
      SpendingModel(
        description: "Red Dead Redemption 2",
        date: DateTime(2023, 12, 07),
        value: 98.99,
      ),
      SpendingModel(
        description: "Red Dead Redemption 2",
        date: DateTime(2023, 12, 07),
        value: 98.99,
      ),
      SpendingModel(
        description: "Red Dead Redemption 2",
        date: DateTime(2023, 12, 07),
        value: 98.99,
      ),
      SpendingModel(
        description: "Red Dead Redemption 2",
        date: DateTime(2023, 12, 07),
        value: 98.99,
      ),
    ]);

    return spendings;
  }
}
