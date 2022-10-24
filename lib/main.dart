import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/config/colors.dart';
import 'package:movie_db/config/router.dart' as router;

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              scaffoldBackgroundColor: AppColors.scaffoldColor,
              iconTheme: IconThemeData(color: AppColors.iconColor),
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                    displayColor: Colors.pink,
                  ),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.transparent, elevation: 0.0)),
          initialRoute: '/',
          onGenerateRoute: router.generateRoute,
        );
      },
    );
  }
}


/// [FutureProvider] [StreamProvider] */
// final futureProvider = FutureProvider<int>((ref) {
//   return Future.value(36);
// });

// final streamProvider = StreamProvider.family<int, int>((ref, index) {
//   return Stream.fromIterable([36, 72 + index]);
// });

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final streamAsyncValue = ref.watch(streamProvider(12));
//     // final futureAsyncValue = ref.watch(futureProvider); // same syntax
//     return Scaffold(
//       body: Center(
//         child: streamAsyncValue.when(
//           data: (data) => Text('Value: $data'),
//           loading: () => const CircularProgressIndicator(),
//           error: (e, st) => Text('Error: $e'),
//         ),
//       ),
//     );
//   }
// }

// /
// / Usage of [StateNotifierProvider]
// / 
// final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
//   return Clock();
// });

// class Clock extends StateNotifier<DateTime> {
//   // 1. initialize with current time
//   Clock() : super(DateTime.now()) {
//     // 2. create a timer that fires every second
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       // 3. update the state with the current time
//       state = DateTime.now();
//     });
//   }

//   void someMethod() {

//   }

//   late final Timer _timer;

//   // 4. cancel the timer when finished
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }


// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // this line is used to watch the provider's *state*
//     // to get an instance of the clock itself,
//     // call `ref.watch(clockProvider.notifier)`
//     ref.read(clockProvider.notifier).someMethod();
//     final currentTime = ref.watch(clockProvider);
//     // format the time as `hh:mm:ss`
//     final timeFormatted = DateFormat.Hms().format(currentTime);
//     return Scaffold(
//       body: Center(
//         child: Text(
//           timeFormatted,
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ),
//     );
//   }
// }

/// Usage of [StateProvider] */
// final counterStateProvider = StateProvider<int>((ref) {
//   return 0;
// });

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('rebuild in myhome page');
//     // 1. watch the counterStateProvider
//     // final counter = ref.watch(counterStateProvider);
//     print(ref.watch(counterStateProvider));
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         // access the provider via ref.read(), then increment its state.
//         onPressed: () => ref.read(counterStateProvider.notifier).state++,
//         child: const Icon(Icons.add),
//       ),
//       body: const Center(
//         child: CountWidget(),
//       ),
//     );
//   }
// }

// class CountWidget extends ConsumerWidget {
//   const CountWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('rebuild in count widget');
//     return Text(
//       // 2. use the counter value
//       'Value: ${ref.watch(counterStateProvider)}',
//       style: Theme.of(context).textTheme.headline4,
//     );
//   }
// }

/// Usage of [Provider] */
// final valueProvider = Provider<int>((ref) {
//   return 36;
// });

// // // 1. Extend [ConsumerStatefulWidget]
// class MyHomePage extends ConsumerStatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// // 2. Extend [ConsumerState]
// class MyHomePageState extends ConsumerState<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     // 3. use ref.read() in the widget life-cycle methods
//     final value = ref.read(valueProvider);
//     print(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 3. use ref.watch() to get the value of the provider
//     final value = ref.watch(valueProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Value: $value',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         // 1. Add a Consumer
//         child: Consumer(
//           // 2. specify the builder and obtain a WidgetRef
//           builder: (_, WidgetRef ref, __) {
//             // 3. use ref.watch() to get the value of the provider
//             final value = ref.watch(valueProvider);
//             return Text(
//               'Value: $value',
//               style: Theme.of(context).textTheme.headline4,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   // 2. build() method has an extra [WidgetRef] argument
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 3. use ref.watch() to get the value of the provider
//     final value = ref.watch(valueProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Value: $value',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ),
//     );
//   }
// }

