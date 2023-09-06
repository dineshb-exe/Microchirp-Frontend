import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getJwtFromSharedPreferences() async {
  try{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt');
  }
  catch(error){
    print(error);
  }
}
Future<String?> getUserIDFromSharedPreferences() async {
  try{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }
  catch(error){
    print(error);
  }
}
Future<void> saveJwtToSharedPreferences(String jwt) async {
  try{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt', jwt);
  }
  catch(error){
    print(error);
  }
}
Future<void> saveUserIDToSharedPreferences(String userID) async {
  try{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userID);
  }
  catch(error){
    print(error);
  }
}