import 'package:bilhete_eletronico/screens/duvida_page.dart';
import 'package:bilhete_eletronico/screens/horario_page.dart';
import 'package:bilhete_eletronico/widgets/appBarUser_widget.dart';
import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  // const ClientePage({Key? key}) : super(key: key);

  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUserWidgets(),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    left: 40.0, top: 20, right: 40.0, bottom: 20),
                primary: Colors.green[700],
                onPrimary: Colors.white,
                shadowColor: Colors.green,
                elevation: 0,
              ),
              child: Text('RECARREGAR CARTÃO'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HorarioPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    left: 20.0, top: 10, right: 20.0, bottom: 10),
                primary: Colors.green[700],
                onPrimary: Colors.white,
                shadowColor: Colors.green,
                elevation: 0,
              ),
              child: Text('HORÁRIOS DOS ÔNIBUS'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DuvidaPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    left: 20.0, top: 10, right: 20.0, bottom: 10),
                primary: Colors.green[700],
                onPrimary: Colors.white,
                shadowColor: Colors.green,
                elevation: 0,
              ),
              child: Text('DÚVIDAS FREQUENTES'),
            ),
            Divider(height: 60),
          ],
        ),
      ),
    );
  }
}
