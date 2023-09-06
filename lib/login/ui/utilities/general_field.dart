import 'package:flutter/material.dart';

class GeneralField extends StatelessWidget {
  final String placeholder;
  final TextEditingController tc;
  final int validationType;
  const GeneralField({Key? key, required this.placeholder, required this.tc, required this.validationType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.1, 0, MediaQuery.of(context).size.width*0.1, MediaQuery.of(context).size.width*0.10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        controller: tc,
        validator: (String? val){
          if(val==null||val.isEmpty){
            return "Please enter the ${placeholder}";
          }
          return null;
        },
        obscureText: (placeholder=="Password"||placeholder=="Confirm Password")?true: false,
        enableSuggestions: true,
        autocorrect: true,
        keyboardType: (placeholder=="EMail")?TextInputType.emailAddress: TextInputType.text,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}