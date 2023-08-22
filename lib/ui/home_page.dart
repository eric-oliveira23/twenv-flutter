import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twenv/theme/colors.dart';
import 'package:twenv/ui/spending_page.dart';
import 'package:twenv/util/price_formatter.dart';

import '../components/appbar_title.dart';
import '../components/main_content_header.dart';
import '../cubit/home_page/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child:
          BlocBuilder<HomePageCubit, HomePageStates>(builder: (context, state) {
        context.read<HomePageCubit>().loadInfos();
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Animate(
                effects: const [
                  FadeEffect(),
                  SlideEffect(
                    begin: Offset(0, 5),
                    curve: Curves.decelerate,
                    duration: Duration(seconds: 1),
                  )
                ],
                child: const AppBarTitle(),
              ),
            ),
            actions: [
              Animate(
                effects: const [
                  FadeEffect(),
                  SlideEffect(
                      begin: Offset(0, 5),
                      curve: Curves.decelerate,
                      duration: Duration(seconds: 1))
                ],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              MainContentContainer(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
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
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      color: Colors.white.withOpacity(0.25),
                      height: 0.5,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Counter(
                          text: "Ganhos",
                          svgPath: 'assets/images/icon-up.svg',
                          value: '1',
                        ),
                        Counter(
                          text: "Gastos",
                          svgPath: 'assets/images/icon-down.svg',
                          value: '1',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeButton(
                      text: 'Ver suas despesas',
                      leftAlignedCircle: true,
                      onTap: () => _spendingClicked(context),
                    ),
                    const SizedBox(width: 15),
                    HomeButton(
                      text: 'Ver seus ganhos',
                      leftAlignedCircle: false,
                      onTap: () => _earningClicked(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String text;
  final bool leftAlignedCircle;
  final VoidCallback onTap;

  const HomeButton({
    super.key,
    required this.text,
    required this.leftAlignedCircle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Ink(
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          child: SizedBox(
            height: 70,
            child: Stack(
              children: [
                Positioned(
                  left: leftAlignedCircle ? -70 : 120,
                  right: leftAlignedCircle ? 120 : -70,
                  bottom: -20,
                  top: -30,
                  child: Container(
                    width: 140,
                    height: 200,
                    decoration: const ShapeDecoration(
                      color: Color(0x0C5100FF),
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 0.50,
                          color: AppColors.purple5100,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(text),
                )
              ],
            ),
          ),
          onTap: () => onTap(),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final String text;
  final String svgPath;
  final String value;
  final dynamic state;

  const Counter({
    super.key,
    required this.text,
    required this.svgPath,
    required this.value,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            SizedBox(
              height: 35,
              child: SvgPicture.asset(
                svgPath,
              ),
            ),
            const SizedBox(width: 5),
            state is HomePageLoading
                ? Container()
                : Text(
                    priceFormatter(value.toString()).toString(),
                  )
          ],
        )
      ],
    );
  }
}

void _spendingClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const SpendingPage(),
    ),
  );
}

void _earningClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const SpendingPage(),
    ),
  );
}
