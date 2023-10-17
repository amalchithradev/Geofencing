import 'package:flutter/material.dart';
import 'package:hub/Controller/LoginCredentials.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../Controller/GeoFencingController.dart';



class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final GeofenceController geofenceController = Get.put(GeofenceController());
  TextEditingController cUserName = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: width * 1,
          height: height * 1,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Login',style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.w800, fontSize: width*0.1,),),
                Text('Welcome to our system',style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w600, fontSize: width*0.04,),),
                SizedBox(height: height * 0.08,),
                TextFormField(
                  controller: cUserName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent), // Change the underline color to red when focused
                    ),
                  ),
                  onChanged: (value) async {

                  },

                ),
                SizedBox(height: height * 0.02,),
                TextFormField(
                  controller: cPassword,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                  onChanged: (value) async {

                  },
                ),
                SizedBox(height: height * 0.08,),
                Container(
                  height: height * 0.05,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.deepOrangeAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: TextButton(
                      onPressed: () async{
                        geofenceController.checkGeofence();
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('username', cUserName.text);
                        prefs.setString('password', cPassword.text);

                        loginController.checkCredentialsAndNavigate();
                      },
                      child: Text('Login',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: width*0.05,))
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
