import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';

class PrivateScreen extends StatelessWidget {
  const PrivateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(title: const Text('Registro completo'), backgroundColor: colorFondo,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.verified_user,
                  size: 100, color: Colors.blueGrey),
              const SizedBox(height: 20),
              const Text(
                  'Se ha registrado con éxito',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.blueGrey,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: colorFondo,
                    shadowColor: const Color(0xFF323247),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'LOGOUT',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
