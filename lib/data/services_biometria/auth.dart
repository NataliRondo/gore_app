// ignore_for_file: avoid_print

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static Future<bool> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication localAuthentication = LocalAuthentication();

    //status of authentication.
    bool isAuthenticated = false;

    //check if device supports biometrics authentication.
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();


    List<BiometricType> biometricTypes =
        await localAuthentication.getAvailableBiometrics();
    
    print(biometricTypes);

    //if device supports biometrics, then authenticate.
    if (isBiometricSupported) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Continua para completar el registro',
           // biometricOnly: true,
            //useErrorDialogs: true,
            //stickyAuth: true
            );
      } on PlatformException catch (e) {
        print(e);
      }
    }

    return isAuthenticated;
  }
}
