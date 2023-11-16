import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 2,
          title: const Text(
            'Characters',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/', (route) => false),
          ),
        ),
        
      );
}
