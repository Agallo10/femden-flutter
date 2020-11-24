import 'package:femden/routes/routes.dart';
import 'package:femden/services/auth_service.dart';
import 'package:femden/services/denuncia_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => DenunciaService(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FEMDEN',
          initialRoute: 'loading',
          routes: appRoutes),
    );
  }
}
