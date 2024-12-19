import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sensor_reader/theme/theme_manager.dart';
import 'package:sensor_reader/utilies/routing.dart';
import 'package:sensor_reader/widgets/dash_board/chart_section.dart';
import 'package:sensor_reader/widgets/dash_board/custom_divider.dart';
import 'package:sensor_reader/widgets/dash_board/light_section.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key, required this.themeManager});

  final ThemeManager themeManager;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final databaseReference = FirebaseDatabase.instance.ref('Data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          'sensor_dashboard'.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        iconTheme: Theme.of(context).iconTheme, // Change drawer icon color here
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration:  BoxDecoration(
                // access the primary color of the theme
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Image.asset('assets/images/logo_delta.png'),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                widget.themeManager.makeTheThemeDark();
              },
              minWidth: double.infinity,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'dark_theme'.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                widget.themeManager.makeTheThemeLight();
              },
              minWidth: double.infinity,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'light_theme'.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutingManager.first,
                  (route) => false,
                );
              },
              minWidth: double.infinity,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'log_out'.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: databaseReference.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('Data : ${snapshot.data!.snapshot.value}');
                  dynamic data = snapshot.data!.snapshot.value;
                  return Column(
                    children: [
                      LightSection(
                        value: data['Light'],
                      ),
                      const CustomDivider(),
                      ChartSection(
                        value: data['Hum'],
                        label: 'humidity'.tr(),
                      ),
                      const CustomDivider(),
                      ChartSection(
                        value: data['Soil'],
                        label: 'soil'.tr(),
                      ),
                      const CustomDivider(),
                      ChartSection(
                        value: data['Temp'],
                        label: 'temperature'.tr(),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.error}'),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
