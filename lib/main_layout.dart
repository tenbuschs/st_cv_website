import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final VoidCallback toggleLocale;
  final Locale locale;

  const MainLayout({super.key, required this.child, required this.toggleLocale, required this.locale});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    title: const Text('My CV App'),
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    actions: [
    Expanded(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextButton(
    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
    child: const Text('Home', style: TextStyle(color: Colors.white)),
    ),
    TextButton(
    onPressed: () => Navigator.pushReplacementNamed(context, '/education'),
    child: const Text('Education', style: TextStyle(color: Colors.white)),
    ),
    TextButton(
    onPressed: () => Navigator.pushReplacementNamed(context, '/experience'),
    child: const Text('Experience', style: TextStyle(color: Colors.white)),
    ),
    //SizedBox(width: 300,),
    IconButton(
      icon: Icon(Icons.language, color: Colors.grey[300]),
      onPressed: toggleLocale,
    ),
    ],
    ),
    ),
    ],
    ),
      body: Center(
              child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: child
              ),
          ),

      bottomNavigationBar: Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(
        '© 2025 Simon Tenbusch',
        style: TextStyle(color: Colors.grey[500]),
      ),
    )
    );
  }
}