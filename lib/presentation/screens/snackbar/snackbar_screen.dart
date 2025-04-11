import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('¿Estás seguro?'),
            content: const Text(
              'Adipisicing aliqua occaecat aute sint aute. Esse commodo cillum aute dolor sunt do excepteur culpa proident quis ea. Incididunt aute pariatur dolore ut elit commodo. Pariatur ea cupidatat ex qui exercitation excepteur irure ad Lorem ipsum.',
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Aceptar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Licencias usadas para cada uno de los paquetes de esta aplicación.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diállogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
