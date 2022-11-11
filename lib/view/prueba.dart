// ignore_for_file: no_logic_in_create_state, must_be_immutable, missing_return
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';

prueba() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-----------------------------
        // Card Body
        //-----------------------------
        Container(
          height: 150,
          width: 250,
          //width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AzulApp.withOpacity(0.5),
            borderRadius:  BorderRadius.circular(20),
          ),
          //-----------------------------
          // Card Body
          //-----------------------------
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //---------------------------
                    // Name and Role
                    //---------------------------
                    Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.person_outlined,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(width: 10),
                        const Flexible(
                          child: Text(
                            "contact.phone",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //---------------------------
                    // Phone Number
                    //---------------------------
                    Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.phone_outlined,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "contact.phone",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    //---------------------------
                    // eMail
                    //---------------------------
                    Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.email_outlined,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "contact.email",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.whatsapp,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "contact.phone",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
