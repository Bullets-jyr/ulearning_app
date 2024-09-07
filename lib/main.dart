import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class MyInfo {
  String name;
  String email;
  int age;

  MyInfo(
    this.name,
    this.email,
    this.age,
  );
}

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   // options: DefaultFirebaseOptions.currentPlatform
  // );

  // understanding json encode method
  // var item = {
  //   "name": "JiYoung",
  //   "age": 34,
  // };
  // // From json to String
  // var newItem = jsonEncode(item);
  // print(item['name']);
  // print(newItem[0]);
  // var test = 'name';
  // print(test[3]);
  // MyInfo info = MyInfo('JiYoung', 'jyr@bullets.co.kr', 34);
  // print(info.email);

  await Global.init();
  var item = Global.storageService.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? '';
  print(item);

  // From String to json
  var newItem = jsonDecode(item);
  print(newItem['email']);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

// var routesMap = {
//   "/": (context) => Welcome(),
//   "/signIn": (context) => const SignIn(),
//   "/register": (context) => const SignUp(),
//   "/application": (context) => const Application(),
// };

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        navigatorKey: navKey,
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        // initialRoute: '/',
        // routes: routesMap,
        onGenerateRoute: AppPages.generateRouteSettings,
        // home: Welcome(),
      ),
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 1;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    // myFunc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Riverpod app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'one',
            onPressed: () {
              navRoute(context);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_rounded),
          ),
          FloatingActionButton(
            heroTag: 'two',
            onPressed: () => ref.read(appCount.notifier).state++,
            // onPressed: myFunc,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void myFunc() {
  print('Hello');
}

void navRoute(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => const SecondPage(),
    ),
  );
}

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '$count',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
