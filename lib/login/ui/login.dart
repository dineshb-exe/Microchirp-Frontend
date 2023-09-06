import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microchirp_frontend/login/bloc/login_bloc.dart';
import 'package:microchirp_frontend/login/ui/utilities/form_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:microchirp_frontend/routes.dart';

@RoutePage(name: 'LoginPage')
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginBloc loginBloc = LoginBloc();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is !LoginActionState,
      listener: (context, state) {
        // TODO: implement listener
        if(state is LoginUsernameFailedActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Username not found"
              ),
            ),
          );
        }
        else if(state is LoginPasswordFailedActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Wrong Password"
              ),
              duration: Duration(
                seconds: 5,
              ),
            ),
          );
        }
        else if(state is LoginNavigateToHomeActionState){
          context.router.popAndPush(HomePage(authValues: state.authValues));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case LoginInitialState:
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                    ),
                    CircleAvatar(
                      child: Image.asset(
                        (MediaQuery.of(context).platformBrightness == Brightness.dark)?
                        'assets/microchirp-transparent.png':
                        'assets/microchirp-low-resolution-logo-black-on-transparent-background.png',
                      ),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      radius: 100,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                    LoginForm(
                      loginBloc: loginBloc,
                      formKey: formKey,
                    ),
                  ],
                ),
              ),
            );
          case LoginErrorState:
            return const Scaffold(
              body:  Center(
                child: Text(
                  "Error",
                ),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
