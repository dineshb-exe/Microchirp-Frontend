import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microchirp_frontend/login/login_services.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/login/pre_login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
  }

  FutureOr<void> loginInitialEvent(LoginInitialEvent event, Emitter<LoginState> emit) {


    emit(LoginInitialState());
  }

  Future<FutureOr<void>> loginButtonPressedEvent(LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    print('Login Button clicked');
    //API Call to the backend to fetch JWT Token
    PreLogin credentials = event.credentials;
    LoginServices l1 = LoginServices();
    var responseValues =await l1.loginCheck(credentials);
    if(responseValues['status'] == "Failure"){
      if(responseValues['message']=="No such user"){
        print("Invalid Username");
        emit(LoginUsernameFailedActionState());
      }
      else if(responseValues['message']=="Wrong Password"){
        print("Wrong Password");
        emit(LoginPasswordFailedActionState());
      }
    }
    else if(responseValues['status'] == "Success"){
      print("Success, you'll be redirected to the home page");
      PostLogin authToken = PostLogin(
        jwtValue: responseValues['accesstoken'],
        userID: responseValues['user_id']
      );
      emit(LoginNavigateToHomeActionState(
          authValues: authToken
      ));
    }
  }
}
