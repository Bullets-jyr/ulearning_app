import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/features/buy_course/controller/buy_course_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyCourse extends ConsumerStatefulWidget {
  const BuyCourse({super.key});

  @override
  ConsumerState<BuyCourse> createState() => _BuyCourseState();
}

class _BuyCourseState extends ConsumerState<BuyCourse> {
  late var args;
  late WebViewController webViewController;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args["id"]);
    args = id["id"];
    print(args);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseBuy = ref.watch(buyCourseControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: AppBar(),
      body: courseBuy.when(
        data: (data) => WebView(
          initialUrl: data,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            JavascriptChannel(
              name: 'Payment',
              onMessageReceived: (JavascriptMessage message) {
                print('------message received------');
                print(message.message);
                Navigator.of(context).pop(message.message);
              },
            ),
          },
          onWebViewCreated: (WebViewController controller) {
            print('------created------');
            webViewController = controller;
          },
        ),
        error: (error, trace) => Text('Error getting webview'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
