import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forum_app/constants.dart';
import 'package:forum_app/providers/AuthService.dart';
import 'package:forum_app/providers/TopicProvider.dart';
import 'package:forum_app/screens/HomeScreen.dart';
import 'package:forum_app/screens/LoginScreen.dart';
 

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/UserCubitModel.dart';
import 'models/UserModel.dart';
import 'providers/SectionProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SectionProvider(),
          child: const ForumApp(),
        ),
        ChangeNotifierProvider(
          create: (context) => TopicProvider(),
          child: const ForumApp(),
        ),
      ],
      child: const ForumApp(),
    ),
  );
}

class ForumApp extends StatelessWidget {
  const ForumApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserCubit(User());
      },
      child: ChangeNotifierProvider(
        create: ((context) => SectionProvider()),
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FORUM',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: FutureBuilder<Box>(
              future: Hive.openBox(tokenBox),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  
                  var box = snapshot.data;
                  var token = box!.get('token');

                  
                  if (token != null) {
                    return FutureBuilder<User?>(
                        future:AuthService().getUser(token),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data != null) {
                              User user = snapshot.data!;
                              user.token = token;
                              context.read<UserCubit>().emit(user);
                              return const HomeScreen();
                            } else {
                              return const LoginScreen();
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        });
                  } else {
                    return const LoginScreen();
                  }
                } else if (snapshot.hasError) {
                  return const LoginScreen();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )

            // home: HomeScreen(),
            // home: FutureBuilder(
            //   builder: (context, dataSnapShot) {
            //     return LoginScreen();
            //   },
            // ),
            ),
      ),
    );
  }
}
