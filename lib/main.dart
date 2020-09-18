import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teste_tonolucro/pages/home/home_page.dart';
import 'package:teste_tonolucro/pages/signin/signin_page.dart';
import 'package:teste_tonolucro/pages/transactions/transactions_page.dart';
import 'package:teste_tonolucro/repositories/transactions_repository.dart';
import 'package:teste_tonolucro/services/transactions_service.dart';
import 'package:teste_tonolucro/stores/transactions/transactions_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        Provider<TransactionsStore>(
          create: (context) => TransactionsStore(
            TransactionsService(
              TransactionsRepository(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Teste Tonolucro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Color(0xFFF3F8FE),
          primaryColor: Color(0xFF3E4685),
          accentColor: Color(0xFFE5E8F9),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: SigninPage.routeName,
        routes: <String, WidgetBuilder>{
          SigninPage.routeName: (BuildContext context) => SigninPage(),
          HomePage.routeName: (BuildContext context) => HomePage(),
          TransactionsPage.routeName: (BuildContext context) =>
              TransactionsPage(),
        },
      ),
    );
  }
}
