
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications() {

    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print("-----------Token-------------");
      print(token);

      //TODO token fC9xy3xLHBA:APA91bFLFFtLGT1I2i3nNCmgYCZ7rU2kD8RE6QVtzEtR5FBft_PjlUTHI_2JhnUy_yELRx7xaAyVTkbrxpCYwfUhhXBvWX1L9j9DTEt7fBE2V_6IgFgnfz_h9gGofZdR5blUg7J_EZBn
    });

    _firebaseMessaging.configure(
       onMessage: (Map<String, dynamic> message) async {
         print("onMessage: $message");
         //_showItemDialog(message);
       },
       onBackgroundMessage: (Map<String, dynamic> message) async {
         print("onBackdroundMessage: $message");
       },
       onLaunch: (Map<String, dynamic> message) async {
         print("onLaunch: $message");
         //_navigateToItemDetail(message);
       },
       onResume: (Map<String, dynamic> message) async {
         print("onResume: $message");
         //_navigateToItemDetail(message);
       },
     );
  }
}