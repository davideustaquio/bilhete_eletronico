import 'package:bilhete_eletronico/providers/cliente_models.dart';
import 'package:bilhete_eletronico/screens/cliente_page.dart';
import 'package:bilhete_eletronico/screens/home_page.dart';
import 'package:bilhete_eletronico/screens/horario_page.dart';
import 'package:bilhete_eletronico/screens/login_page.dart';

import 'package:bilhete_eletronico/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreservice = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ClienteModel()),
        StreamProvider(create: (context) => firestoreservice.getClientes()),
      ],
      child: MaterialApp(
        title: 'Bilhete Eletrônico Alfenas',
        home: HomePage(),
      ),
    );
  }
}
