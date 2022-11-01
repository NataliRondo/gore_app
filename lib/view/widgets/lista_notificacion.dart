import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';

notificacion(BuildContext context, String imagen, String titulo, TextStyle textStyle,
    String subtitulo) {
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Center(
    child: Card(
      //elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.blueGrey.withOpacity(0.3), width: 2.0),
      ),
      //color: Color.fromARGB(51, 96, 125, 139),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: responsiveApp.wp(100),
          height: responsiveApp.hp(15),
          child: Row(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: responsiveApp.dp(10),
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: responsiveApp.dp(6),
                      //backgroundImage: foto.image,
                      backgroundImage:  AssetImage(imagen),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Center(
                      child: SizedBox(
                        width: responsiveApp.wp(60),
                        child: ListTile(
                          title: Text(
                            titulo,
                            style: textStyle,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(subtitulo),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class Bar extends StatefulWidget {
  Bar({Key? key}) : super(key: key);

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorFondo,
          leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Incoming',
                  ),
                  Tab(
                    text: 'Outgoing',
                  ),
                  Tab(
                    text: 'Missed',
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IncomingPage(),
            OutgoingPage(),
            MissedPage(),
          ],
        ),
      ),
    );
  }

  Widget OutgoingPage() {
    return Container();
  }

  Widget IncomingPage() {
    return Container();
  }
}

Widget MissedPage() {
  return Container();
}
