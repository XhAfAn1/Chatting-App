import 'package:shared_preferences/shared_preferences.dart';


const String KEYLOGIN="login";

late SharedPreferences sp;

getInstance() async {
   sp = await SharedPreferences.getInstance();
}
