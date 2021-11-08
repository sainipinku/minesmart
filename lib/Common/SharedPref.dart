
import 'package:shared_preferences/shared_preferences.dart';
class SharedPref {

 static setUserId(int id) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setInt('user_id', id);
 }

 static setSsoId(String ssoid) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('sso_id', ssoid);
 }

 static setWeighBridgeNo(String weighbridgeno) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('weigh_bridge_no', weighbridgeno);
 }

 static Future<int> getUserId(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getInt(key) ?? 0;

 }

 static Future<String> getSsoId(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(key) ?? " ";
 }

 static Future<String> getWeighBridgeNo(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(key) ?? "";

 }


 static removeValues() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.remove("user_id");

 }
 static removeAll() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.clear();
 }

 static setDarkLight(bool isSwitch) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('darklight', isSwitch);
 }

 static Future<bool> getDarkLight(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getBool(key) ?? false;

 }
}