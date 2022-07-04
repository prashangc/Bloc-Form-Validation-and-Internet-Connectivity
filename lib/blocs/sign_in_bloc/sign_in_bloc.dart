import 'package:app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>(((event, emit) {
      if (EmailValidator.validate(event.emailValue.toString()) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Please enter atleast 8 digits password"));
      } else {
        emit(SignInValidState());
      }
    }));
    on<SignInSubmittedEvent>(((event, emit) {
      emit(SignInLoadingState());
    }));
  }
}
