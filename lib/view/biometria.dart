// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/secret_page.dart';
import 'package:local_auth/local_auth.dart';

class BiometriaView extends StatelessWidget {
  const BiometriaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalAuthentication auth = LocalAuthentication();

    Future authenticate() async {
      final bool isBiometricsAvailable = await auth.isDeviceSupported();

      if (!isBiometricsAvailable) return false;

      try {
        return await auth.authenticate(
          localizedReason: 'Escanear huella digital para registrarse',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } on PlatformException {
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro biométrico"),
        backgroundColor: colorFondo,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool isAuthenticated = await authenticate();

            if (isAuthenticated) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SecretPage();
                  },
                ),
              );
            } else {
              Container();
            }
          },
          child: const Text('Click aquí'),
        ),
      ),
    );
  }
}