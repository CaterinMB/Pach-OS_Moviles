import 'package:flutter/material.dart';
import 'package:pachos/menu.dart';


void main() => runApp(IniciarSesion());

class IniciarSesion extends StatefulWidget {
  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
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
          builder: (context) => ProductosLoggedInPage(),
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
                                setState(() {
                                  usuario = value!;
                                });
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
                                setState(() {
                                  contrasena = value!;
                                });
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
            SizedBox(height: 20),
            Text(
              mensajeError,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductosLoggedInPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String producto = '';
  String cantidad = '';
  String precio = '';

  void registrarVenta() {
    if (_formKey.currentState!.validate()) {
      // Realizar la lógica de registro de la venta con los datos ingresados
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos - Inició Sesión'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Producto'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresa el nombre del producto';
                  }
                  return null;
                },
                onSaved: (value) {
                  producto = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cantidad'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresa la cantidad';
                  }
                  return null;
                },
                onSaved: (value) {
                  cantidad = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Precio'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresa el precio';
                  }
                  return null;
                },
                onSaved: (value) {
                  precio = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrarVenta,
                child: Text('Registrar Venta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
