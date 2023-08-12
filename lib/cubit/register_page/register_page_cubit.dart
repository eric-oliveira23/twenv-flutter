import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/auth_repository.dart';

part 'register_page_states.dart';

class RegisterPageCubit extends Cubit<RegisterPageStates> {
  RegisterPageCubit() : super(RegisterPageInitial());

  Future<void> confirmButtonClicked() async {
    AuthRepository.registerWithEmailAndPassword(
      'pintonildoDaSilva@gmail.com',
      'pintao123',
    );
  }
}
