import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/firebase_options.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        initialRoute: '/',
        routes: {
          "/": (context) => Welcome(),
          "/signIn": (context) => const SignIn(),
          "/register": (context) => const SignUp(),
        },
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
