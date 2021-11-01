
import 'package:shared_preferences/shared_preferences.dart';
class SharedPref {

 static setId(int id) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setInt('user_id', id);
 }

 static setName(String name) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('user_name', name);
 }

 static setLastName(String lastname) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('user_last_name', lastname);
 }

 static setEmail(String email) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('user_email', email);
 }

 static setPhone(int phone) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setInt('user_phone', phone);
 }

 static setProfilePic(String profilepic) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('user_profile', profilepic);
   print('user_profile1$profilepic');
 }

 static setCountry(bool country) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('user_country', country);
 }

 static setListData(List<String> value) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setStringList('search_data', value);
 }

 static Future<int> getId(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getInt(key) ?? 0;

 }

 static Future<String> getName(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(key) ?? " ";
 }

 static Future<String> getLastName(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(key) ?? "";

 }

 static Future<String> getEmail(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(key) ?? "";

 }

 static Future<int> getPhone(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getInt(key) ?? 0;

 }

 static Future<String> getProfilePic(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   if(prefs.getString('user_profile') !=null){
     return prefs.getString(key) ?? " ";
   }else{
     return "assets/images/richkart.png";
   }

 }
 static Future<bool> getCountry(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getBool(key) ?? false;

 }
 static Future<List<String>?> getListData(String key) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getStringList(key);
 }

 static removeValues() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.remove("id");

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