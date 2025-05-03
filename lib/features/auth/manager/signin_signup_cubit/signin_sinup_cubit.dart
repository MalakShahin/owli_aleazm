import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signin_signup_state.dart';

class SigninSignupCubit extends Cubit<SigninSignupState> {
  SigninSignupCubit() : super(SigninSignupInitial());

  Future<void> registerUser({required String email,required String password}) async {
    emit(SigninSignupLoading());
    try {
      UserCredential user =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SigninSignupSuccess());
    }on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(SigninSignupFailure(errMessage: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SigninSignupFailure(errMessage: 'email-already-in-use'));
      }else {
        emit(SigninSignupFailure(errMessage: ex.message ?? 'Unknown error'));
      }
    }  catch (e) {
      emit(SigninSignupFailure(errMessage: e.toString()));
    }
  }


  Future<void> logInUser(
      {required String email, required String password}) async {
    emit(SigninSignupLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SigninSignupSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(SigninSignupFailure(errMessage: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SigninSignupFailure(errMessage: 'email-already-in-use'));
      }else {
        emit(SigninSignupFailure(errMessage: ex.message ?? 'Unknown error'));
      }
    } catch (e) {
      emit(SigninSignupFailure(errMessage: e.toString()));
    }
  }
}
