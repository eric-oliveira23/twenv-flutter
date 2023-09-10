import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:twenv/model/spending_model.dart';
import '../components/appbar_title.dart';
import '../components/fab.dart';
import '../components/main_content_header.dart';
import '../components/tiles/spending_tile.dart';
import '../repositories/value_repository.dart';
import 'add_value_page.dart';

class SpendingPage extends StatefulWidget {
  const SpendingPage({super.key});

  @override
  State<SpendingPage> createState() => SpendingPageState();
}

DatabaseReference? _valuesReference;

class SpendingPageState extends State<SpendingPage> {
  @override
  void initState() {
    setState(() {
      fetchData();
    });
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
              enableMenu: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Animate(
                          effects: [
                            const SlideEffect(
                              begin: Offset(0, -4),
                              curve: Curves.decelerate,
                              duration: Duration(
                                seconds: 1,
                              ),
                            ),
                            ShimmerEffect(
                              color: Colors.grey[700],
                              duration: const Duration(
                                seconds: 3,
                              ),
                            )
                          ],
                          child: const Text(
                            'Junho',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        const Text('Mês atual'),
                        const SizedBox(height: 15),
                        Container(
                          color: Colors.white.withOpacity(0.25),
                          height: 0.5,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  FirebaseAnimatedList(
                    query: _valuesReference!,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, snapshot, animation, index) {
                      final spendingModel = SpendingModel(
                        description:
                            snapshot.child('description').value.toString(),
                        date: snapshot.child('date').value.toString(),
                        value: double.parse(
                          snapshot.child('value').value.toString(),
                        ),
                      );
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SpendingTile(
                          spending: spendingModel,
                        ),
                      );
                    },
                  ),
                ],
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

  fetchData() async {
    _valuesReference = await SpendingRepository.fetchSpendings();
  }
}
