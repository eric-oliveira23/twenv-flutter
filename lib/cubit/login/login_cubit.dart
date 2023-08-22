import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/dialogs/warning_dialog.dart';
import '../../constants/messages.dart';
import '../../ui/home_page.dart';

part 'login_states.dart';

class LoginPageCubit extends Cubit<LoginPageStates> {
  LoginPageCubit() : super(LoginStatesInitial());

  loginButtonClicked(
    String email,
    String password,
    BuildContext context,
  ) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      emit(LoginStatesLoading());

      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage(),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginStatesInitial());

      String errorMessage = 'Não foi possível realizar o login.';

      if (e.code == 'user-not-found') {
        errorMessage = 'Usuário não encontrado!';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Senha incorreta.';
      }

      showDialog(
        context: context,
        builder: (context) {
          return WarningDialog(
            contentText: errorMessage,
            buttonText: Messages.dialogPositiveButtonText,
            isSuccess: false,
          );
        },
      );
    } catch (error) {
      emit(LoginStatesInitial());

      showDialog(
        context: context,
        builder: (context) {
          return const WarningDialog(
            contentText: 'Não foi possível realizar o login.',
            buttonText: Messages.dialogPositiveButtonText,
            isSuccess: false,
          );
        },
      );
    }
  }
}
