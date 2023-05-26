import 'package:flutter/material.dart';

class VentaRoute extends StatelessWidget {
  const VentaRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.brown,
        title: const Text('Registrar Venta'),
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? value;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 10)),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingrese Producto',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Ingrese valor';
              }
              return 'El nombre ingresado es $value';
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingrese cantidad',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Ingrese valor';
              }
              return 'La cantidad ingresado es $value';
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingrese precio',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Ingrese valor';
              }
              return 'El precio ingresado es $value';
            },
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {}
              },
              child: const Text ('Registrar'),
            ),
          ),
        ],
      ),
    );
  }
}