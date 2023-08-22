import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../components/appbar_title.dart';
import '../../components/textfield_title.dart';
import '../../cubit/register/register_page_cubit.dart';
import '../../theme/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmedPassController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPageCubit(),
      child: BlocBuilder<RegisterPageCubit, RegisterPageStates>(
        builder: (context, state) {
          return Scaffold(
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
                          TextFieldWithTitle(
                            title: 'Usuário',
                            controller: userNameController,
                          ),
                          TextFieldWithTitle(
                            title: 'Email',
                            controller: emailController,
                          ),
                          TextFieldWithTitle(
                            title: 'Senha',
                            controller: passController,
                          ),
                          TextFieldWithTitle(
                            title: 'Confirme a senha',
                            controller: confirmedPassController,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<RegisterPageCubit>()
                                        .confirmButtonClicked(
                                          userNameController.text,
                                          emailController.text,
                                          passController.text,
                                          confirmedPassController.text,
                                          context,
                                        );
                                  },
                                  child: state is RegisterStatesInitial
                                      ? const Text('Criar')
                                      : Lottie.asset(
                                          'assets/animations/loading_animation.json',
                                          width: 70,
                                        ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => context
                                      .read<RegisterPageCubit>()
                                      .loginClicked(context),
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
          );
        },
      ),
    );
  }
}
