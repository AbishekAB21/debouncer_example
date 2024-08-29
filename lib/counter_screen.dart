import 'package:debouncer_example/debounce.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;
  final _debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debouncer Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [
            IconButton(
              onPressed: increment,
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("$count"),
            SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: decrement,
              icon: Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      count++;
    });

    _debouncer.run(() {
      if (mounted) {
       
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Value Incremented to $count"),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  void decrement() {
    setState(() {
      count--;
    });

    _debouncer.run(() {
      if (mounted) {
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Value Decremented to $count"),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }
}
