import 'package:bilhete_eletronico/providers/cartao_models.dart';
import 'package:bilhete_eletronico/screens/cliente_page.dart';
import 'package:bilhete_eletronico/screens/home_page.dart';
import 'package:bilhete_eletronico/screens/horario_page.dart';

import 'package:bilhete_eletronico/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //inicializa o BD
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final firestoreservice = FirestoreService();
    //Provider gerencia o estado do App

    return MultiProvider(
      providers: [
        //ClienteModel disponivel em qq tela do App
        ChangeNotifierProvider(create: (context) => ClienteModel()),
        //StreamProvider. metodos para utilizar no BD //getClientes() disponibiliza os dados para o APP
        StreamProvider(create: (context) => firestoreservice.getClientes()),
      ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        title: 'Bilhete Eletrônico Alfenas',
        home: HomePage(),
      ),
    );
  }
}
