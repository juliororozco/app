import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/userController.dart';
import 'package:frontend/domain/models/users.dart';

class UserRegistrationView extends StatefulWidget {
  @override
  _UserRegistrationViewState createState() => _UserRegistrationViewState();
}

class _UserRegistrationViewState extends State<UserRegistrationView> {
  final UserController userController = UserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _directionController = TextEditingController();
  final bool _isAdmin = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: '', // Puedes configurarlo como una cadena vacía ya que se generará en el servidor
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        department: _departmentController.text,
        city: _cityController.text,
        direction: _directionController.text,
        isAdmin: _isAdmin,
      );

      final message = await userController.createUser(user);
      if (message != null) {
        // Registro exitoso, muestra un "toast" de éxito
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          duration: Duration(seconds: 5), // Configura la duración que desees
        ));

        // Redirige al usuario a la página de inicio de sesión
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        // Registro fallido, muestra un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error en el registro')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Ingresa un email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _departmentController,
                decoration: const InputDecoration(labelText: 'Departamento'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Ciudad'),
              ),
              TextFormField(
                controller: _directionController,
                decoration: const InputDecoration(labelText: 'Dirección'),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Registrar Usuario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
