import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clock1/cubit/clock_cubit.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClockCubit(),
      child: MaterialApp(
        home: const Clock(),
        debugShowCheckedModeBanner: false,
        title: 'Clock',
        theme: ThemeData(brightness: Brightness.dark),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  double re = 3.15;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      BlocProvider.of<ClockCubit>(context).minutes();
      log('seconds');
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ClockCubit, ClockState>(
        listener: (context, state) {},
        builder: (context, state) {
          final now = DateTime.now();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    'lib/assers/4.jpg',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  const CircleAvatar(
                    radius: 200,
                    backgroundColor: Colors.white,
                  ),
                  const CircleAvatar(
                    radius: 190,
                    backgroundColor: Colors.amber,
                  ),
                  CircleAvatar(
                    radius: now.second.toDouble() * re,
                    backgroundColor: Colors.grey,
                  ),
                  Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      '${now.hour - 12} : ${now.minute} : ${now.second} \n ${now.day} / ${now.month} / ${now.year}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          );
        },
      ),
    
    );
  }
}
