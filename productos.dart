import 'package:flutter/material.dart';

class ProductoRoute extends StatelessWidget {
  const ProductoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Registrar Producto';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}
enum SingingCharacter { femenino, masculino }

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
    String? _category;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Ingrese  Nombre',
              labelText: 'Nombre del Producto',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Ingrese Nombre';
              }
              return 'El nombre es $value';
            },
          ),


         DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              icon: const Icon(Icons.category),
              hintText: 'Seleccione la categoría',
              labelText: 'Categoría',
            ),
            value: _category,
            onChanged: (String? newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: [
              'Pizza',
              'Gratinados',
              'Bebidas',
              'Pastas',
              'Bar',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Seleccione la categoría';
              }
              return 'Su categoria es $value';
            },
          ),


          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Ingrese  precio',
              labelText: 'Precio',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Ingrese su precio';
              }
              return 'Su precio es $value';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              hintText: 'Ingrese tamaño',
              labelText: 'Tamaño Pizza',
            ),

            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Ingrese el tamaño de la pizza';
              }
              return 'El tamaño de la pizza es $value';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.password),
              hintText: 'Ingrese  el maximo de sabores ',
              labelText: 'Maximo sabores',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Ingrese el maximo de sabores';
              }
              return 'La cantidad de sabores es $value';
            },
          ),
        
          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text ('Registrar'),
            ),
          ),
        ],
      ),
    );
  }
}