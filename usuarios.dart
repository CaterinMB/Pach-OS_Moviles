import 'package:flutter/material.dart';

class UsuarioRoute extends StatelessWidget {
  const UsuarioRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.brown,
        title: const Text('Registrar usuario'),
      ),
      body: const MyStatefulWidget(),
    );
  }
}

enum SingingCharacter { Masculino, Femenino, Otro }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? value;
  String? _selectedDocumentType;
  SingingCharacter? _character = SingingCharacter.Masculino;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 10)),

          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              hintText: 'Tipo de Documento',
            ),
            value: _selectedDocumentType,
            items: <String>['Tarjeta de Identidad', 'Cedula de Ciudadania', 'Cedula Extrajera']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedDocumentType = newValue;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Seleccione el tipo de identificacion';
              }
              return null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingrese documento',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Ingrese valor';
              }
              return 'El documento ingresado es $value';
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingrese Nombre',
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
              hintText: 'Ingrese Apellido',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Ingrese valor';
              }
              return 'El apellido ingresado es $value';
            },
          ),

          ListTile(
            title: const Text('Hombre'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.Masculino,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),

          ListTile(
            title: const Text('Mujer'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.Femenino,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),

          ListTile(
            title: const Text('Otro'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.Otro,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingrese correo',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Ingrese valor';
              }
              return 'El correo ingresado es $value';
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingrese contraseña',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Ingrese valor';
              }
              return 'La contraseña ingresada es $value';
            },
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {}
              },
              child: const Text ('Ingresar Usuario'),
            ),
          ),
        ],
      ),
    );
  }
}