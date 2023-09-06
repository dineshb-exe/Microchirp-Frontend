
import 'package:flutter/material.dart';
import 'package:microchirp_frontend/login/bloc/login_bloc.dart';
import 'package:microchirp_frontend/login/pre_login_model.dart';
import 'package:microchirp_frontend/login/ui/utilities/general_field.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key, required this.loginBloc, required this.formKey});
  final LoginBloc loginBloc;
  final GlobalKey<FormState> formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameCont = TextEditingController();

  final TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralField(
              placeholder: "EMail",
              tc: usernameCont,
              validationType: 1
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralField(
                placeholder: "Password",
                tc: passwordCont,
                validationType: 1
            ),
          ),
          ElevatedButton(
            onPressed: (){
              if(widget.formKey.currentState!.validate()) {
                PreLogin credentials = PreLogin(
                  username: usernameCont.text,
                  password: passwordCont.text
                );
                widget.loginBloc.add(LoginButtonPressedEvent(
                  credentials: credentials
                ));
              }
            },
            child: const Text('Login'),
          ),
        ],
      )
    );
  }
}
