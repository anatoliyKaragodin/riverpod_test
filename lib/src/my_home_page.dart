import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/main.dart';
import 'package:riverpod_test/riverpod_models.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final buttonProvider = ref.watch(colorStateProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        buttonProvider.backgroundColor!)),
                child: Text(
                  buttonProvider.label!,
                  style: TextStyle(color: Colors.black87),
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      ref.read(colorStateProvider.notifier).update((state) =>
                          ChangeButton(
                              backgroundColor: Colors.deepPurple,
                              label: 'Deep purple button'));
                    },
                    child: const Text(
                      'Deep purple button',
                      style: TextStyle(color: Colors.black87),
                    )),
                TextButton(
                    onPressed: () {
                      ref.read(colorStateProvider.notifier).update((state) =>
                          ChangeButton(
                              backgroundColor: Colors.cyan,
                              label: 'Cyan button'));
                    },
                    child: const Text(
                      'Cyan button',
                      style: TextStyle(color: Colors.black87),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
