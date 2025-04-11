import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, bicycle }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged:
              (value) => setState(() {
                isDeveloper = !isDeveloper;
              }),
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: switch (selectedTransportation) {
            Transportation.car => const _IconSubtitle(
              icon: Icons.directions_car,
              text: 'En carro',
            ),
            Transportation.boat => _IconSubtitle(
              icon: Icons.directions_boat,
              text: 'En barco',
            ),
            Transportation.plane => _IconSubtitle(
              icon: Icons.flight,
              text: 'En avión',
            ),
            Transportation.bicycle => _IconSubtitle(
              icon: Icons.directions_bike,
              text: 'En bicicleta',
            ),
          },
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar en carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.car;
                  }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.boat;
                  }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar en avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.plane;
                  }),
            ),
            RadioListTile(
              title: const Text('By Bike'),
              subtitle: const Text('Viajar en bicicleta'),
              value: Transportation.bicycle,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.bicycle;
                  }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Incluir desayuno'),
          value: wantsBreakfast,
          onChanged:
              (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              }),
        ),
        CheckboxListTile(
          title: const Text('Incluir almuerzo'),
          value: wantsLunch,
          onChanged:
              (value) => setState(() {
                wantsLunch = !wantsLunch;
              }),
        ),
        CheckboxListTile(
          title: const Text('Incluir cena'),
          value: wantsDinner,
          onChanged:
              (value) => setState(() {
                wantsDinner = !wantsDinner;
              }),
        ),
      ],
    );
  }
}

class _IconSubtitle extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconSubtitle({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 10, children: [Icon(icon), Text(text)]);
  }
}
