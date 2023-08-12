import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenv/cubit/register_page/register_page_cubit.dart';
import '../../components/appbar_title.dart';
import '../../theme/colors.dart';
import '../home_page.dart';
import '../login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPageCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const AppBarTitle(),
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        'Crie sua conta',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      const TextFieldWithTitle(title: 'Usuário'),
                      const TextFieldWithTitle(title: 'Email'),
                      const TextFieldWithTitle(title: 'Senha'),
                      const TextFieldWithTitle(title: 'Confirme a senha'),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<RegisterPageCubit,
                                RegisterPageStates>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () => context
                                      .read<RegisterPageCubit>()
                                      .confirmButtonClicked(),
                                  child: const Text('Criar'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => _loginClicked(context),
                              child: const Text('Entre em sua conta'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _createClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const HomePage(),
    ),
  );
}

void _loginClicked(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const LoginPage(),
    ),
  );
}
