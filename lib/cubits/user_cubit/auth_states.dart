
sealed class AuthStates {
}
class AuthInitState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthSuccessState extends AuthStates{}
class AuthErrorState extends AuthStates{
  final String errMessage ;
  AuthErrorState({required this.errMessage});
}
class SignOutSuccessState extends AuthStates{}

//avatar
 class ChangeAvatarState extends AuthStates{
  final String avatar;
  ChangeAvatarState({required this.avatar});
}

//delete
 class DeleteUserLoading extends AuthStates{}
class DeleteUserSuccess extends AuthStates{}
class DeleteUserError extends AuthStates{
  final String errMessage;
  DeleteUserError({required this.errMessage});
}
class DeleteUserInitState extends AuthStates{}

//update
class UpdateUserLoading extends AuthStates{}
class UpdateUserSuccess extends AuthStates{}
class UpdateUserError extends AuthStates{
  final String errMessage;
  UpdateUserError({required this.errMessage});
}
class UpdateUserInitState extends AuthStates{}

class ResetPasswordSuccessState extends AuthStates {}