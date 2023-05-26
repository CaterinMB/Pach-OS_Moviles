import 'package:flutter/material.dart';
import 'package:pachos/usuarios.dart';
import 'package:pachos/productos.dart';
import 'package:pachos/ventas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PACH - OS',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pach-OS'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ProductosPage(),
                  ),
                );
              },
              child: Text('Productos'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VentasPage(),
                  ),
                );
              },
              child: Text('Ventas'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsuarioRoute(),
                  ),
                );
              },
              child: Text('Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductosPage extends StatefulWidget {
  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String usuario = '';
  String contrasena = '';
  String mensajeError = '';

  void iniciarSesion() {
    
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Guarda los valores ingresados en las variables

      if (usuario == 'admin' && contrasena == '123') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Myproducto(),
          ),
        );
      } else {
        setState(() {
          mensajeError = 'Usuario o contraseña incorrectos';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Iniciar Sesión'),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Usuario'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ingresa el usuario';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                usuario = value!;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Contraseña'),
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ingresa la contraseña';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                contrasena = value!;
                              },
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: iniciarSesion,
                              child: Text('Iniciar Sesión'),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class VentasPage extends StatefulWidget {
  @override
  _VentasPageState createState() => _VentasPageState();
}

class _VentasPageState extends State<VentasPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String usuario = '';
  String contrasena = '';
  String mensajeError = '';

  void iniciarSesion() {
     if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Guarda los valores ingresados en las variables

      if (usuario == 'cliente' && contrasena == '123') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VentaRoute(),
          ),
        );
      } else {
        setState(() {
          mensajeError = 'Usuario o contraseña incorrectos';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_basket,
              size: 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Iniciar Sesión'),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Usuario'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ingresa el usuario';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                usuario = value!;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Contraseña'),
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ingresa la contraseña';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                contrasena = value!;
                              },
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: iniciarSesion,
                              child: Text('Iniciar Sesión'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductosLoggedInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos - Inició Sesión'),
      ),
      body: Center(
        child: Text('Vista de Productos después de iniciar sesión'),
      ),
    );
  }
}

class VentasLoggedInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas - Inició Sesión'),
      ),
      body: Center(
        child: Text('Vista de Ventas después de iniciar sesión'),
      ),
    );
  }
}