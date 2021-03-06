import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:timetracker/app/sign_in/sign_in_page.dart';
import 'package:timetracker/app/volunteer/volunteer_home_page.dart';
import 'package:timetracker/services/auth.dart';

class LandingPage extends StatelessWidget{
  LandingPage({@required this.auth});
  final AuthBase auth;

  @override
   Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState== ConnectionState.active){
            User user = snapshot.data;
            if (user == null) {
              return SignInPage(
                auth: auth,
                              );
            }
            return VolunteerHomePage(
             auth: auth,
              vol: user,
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
