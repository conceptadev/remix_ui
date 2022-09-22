import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:remix_ui/components/checkbox/checkbox.dart' as x;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remix',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const AppShell(title: 'Remix Home Page'),
    );
  }
}

class AppShell extends HookWidget {
  const AppShell({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final checked = useState(false);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the AppShell object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   children: [
              //     Button(
              //       label: 'Solid',
              //       variant: ButtonVariant.solid,
              //       // isDisabled: true,
              //       iconLeft: Icons.face,
              //     ),
              //     SizedBox(width: 8),
              //     Button(
              //       label: 'Outline',
              //       variant: ButtonVariant.outline,
              //       // isDisabled: true,
              //       // isLoading: true,
              //       loadingLabel: 'Loading',
              //       iconLeft: Icons.face,
              //     ),
              //     SizedBox(width: 8),
              //     Button(
              //       label: 'Ghost',
              //       variant: ButtonVariant.ghost,
              //       // isDisabled: true,
              //       iconLeft: Icons.face,
              //     ),
              //     SizedBox(width: 8),
              //     Button(
              //       label: 'Link',
              //       variant: ButtonVariant.link,
              //       // isDisabled: true,
              //       iconLeft: Icons.face,
              //     ),
              //   ],
              // ),
              // SizedBox(height: 10),
              // Row(
              //   children: [
              //     Button(
              //       label: 'XSmall',
              //       variant: ButtonVariant.solid,
              //       size: ButtonSize.xsmall,
              //       iconLeft: Icons.face,
              //     ),
              //     SizedBox(width: 8),
              //     Button(
              //       label: 'Small',
              //       variant: ButtonVariant.solid,
              //       size: ButtonSize.small,
              //       iconLeft: Icons.face,
              //     ),
              //     SizedBox(width: 8),
              //     Button(
              //       label: 'Medium',
              //       variant: ButtonVariant.solid,
              //       size: ButtonSize.medium,
              //       iconLeft: Icons.face,
              //     ),
              //     SizedBox(width: 8),
              //     Button(
              //       label: 'Large',
              //       variant: ButtonVariant.solid,
              //       size: ButtonSize.large,
              //       iconLeft: Icons.face,
              //     ),
              //   ],
              // ),
              // SizedBox(height: 10),
              Row(
                children: [
                  x.Checkbox(
                    isChecked: checked.value,
                    isInvalid: checked.value,
                    onChanged: (value) {
                      checked.value = value;
                    },
                  )
                ],
              )
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
