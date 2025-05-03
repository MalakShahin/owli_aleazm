part of 'signin_sinup_cubit.dart';

@immutable
sealed class SigninSignupState {}

final class SigninSignupInitial extends SigninSignupState {}
final class SigninSignupLoading extends SigninSignupState {}
final class SigninSignupSuccess extends SigninSignupState {}
final class SigninSignupFailure extends SigninSignupState {
  final String errMessage;

  SigninSignupFailure({required this.errMessage});
}
