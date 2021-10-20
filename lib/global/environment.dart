import 'dart:io';

// class Environment {
//   static String apiUrl = Platform.isAndroid
//       ? 'http://10.0.2.2:3005/api'
//       : 'http://localhost:3005/api';
//   static String socketUrl =
//       Platform.isAndroid ? 'http://10.0.2.2:3005' : ' http://localhost:3005';
// }

class Environment {
  static String apiUrl = 'https://femden-backend.herokuapp.com/api';
  static String socketUrl =
      Platform.isAndroid ? 'http://10.0.2.2:3005' : ' http://localhost:3005';
}
