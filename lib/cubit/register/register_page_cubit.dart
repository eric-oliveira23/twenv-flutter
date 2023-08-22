import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenv/ui/home_page.dart';

import '../../components/dialogs/warning_dialog.dart';
import '../../constants/messages.dart';
import '../../ui/login_page.dart';

part 'register_page_states.dart';

class RegisterPageCubit extends Cubit<RegisterPageStates> {
  RegisterPageCubit() : super(RegisterStatesInitial());

  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child('users');

  Future<void> confirmButtonClicked(
    String userName,
    String email,
    String password,
    String confirmedPassword,
    BuildContext context,
  ) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      if (userName.isEmpty || email.isEmpty || password.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return const WarningDialog(
              contentText: Messages.dataError,
              buttonText: Messages.dialogPositiveButtonText,
              isSuccess: false,
            );
          },
        );
        return;
      }

      if (password != confirmedPassword) {
        showDialog(
          context: context,
          builder: (context) {
            return const WarningDialog(
              contentText: Messages.differentPasswordError,
              buttonText: Messages.dialogPositiveButtonText,
              isSuccess: false,
            );
          },
        );
        return;
      }

      emit(RegisterStatesLoading());

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        User? user = auth.currentUser;

        await _userRef.child(user!.uid).set({
          "user": userName,
        });

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
      emit(RegisterStatesInitial());

      String errorMessage = "Um erro ocorreu.";
      if (e.code == 'weak-password') {
        errorMessage =
            'A senha digitada é muito curta!\n(Mínimo 6 caracteres).';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'O email inserido já está em uso.';
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
    } catch (e) {
      emit(RegisterStatesInitial());

      showDialog(
        context: context,
        builder: (context) {
          return const WarningDialog(
            contentText: "Não foi possível criar a conta.",
            buttonText: Messages.dialogPositiveButtonText,
            isSuccess: false,
          );
        },
      );
    }
  }

  void loginClicked(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }
}
