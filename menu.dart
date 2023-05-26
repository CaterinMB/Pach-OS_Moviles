import 'package:flutter/material.dart';
import 'package:pachos/ventas.dart';
import 'package:pachos/usuarios.dart';
import 'package:pachos/productos.dart';

void main() => runApp(Menu());

class Menu extends StatelessWidget {
  const Menu ({super.key});

  static const String _title = 'Pach-OS';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text(_title)
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget ({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25));

    return Center (
      child: Column (
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            child: const Text('Venta'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VentaRoute()),
              );
            },
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            style: style,
            child: const Text('Usuario'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsuarioRoute()),
              );
            },
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            style: style,
            child: const Text('Productos'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductoRoute()),
              );
            },
          ),
        ],
      ),
    );
  }
}