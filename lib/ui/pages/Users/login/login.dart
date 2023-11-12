import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/userController.dart';
import 'package:frontend/ui/pages/Users/signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody>
    with SingleTickerProviderStateMixin {
  final UserController userController = UserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Configurar la animación de rebote
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    // Iniciar la animación al cargar la pantalla
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo con animación de rebote
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: child,
              );
            },
            child: const FlutterLogo(
              size: 100,
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Campo de correo electrónico
                Container(
                  width: 250,
                  child: TextFormField(
                    controller: _emailController,
                    decoration:
                        InputDecoration(labelText: 'Correo electrónico'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Ingresa un correo válido';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),

                // Campo de contraseña
                Container(
                  width: 250,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final email = _emailController.text;
                final password = _passwordController.text;

                final user = await userController.loginUser(email, password);

                if (user != null) {
                  // Inicio de sesión exitoso, redirigir al usuario a la página deseada
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // Inicio de sesión fallido, mostrar un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Inicio de sesión fallido'),
                  ));
                }
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Color del botón
            ),
            child: const Text('Iniciar Sesión'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserRegistrationView()));
            },
            child: const Text(
              'No tengo cuenta, crear una',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
