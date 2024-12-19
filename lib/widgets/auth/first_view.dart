import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sensor_reader/utilies/routing.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  void _setLanguage(String languageCode) {
    context.setLocale(Locale(languageCode));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome'.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    '${'please_select_language'.tr()} :',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () => _setLanguage('ar'),
                        child: Text('arabic'.tr()),
                      ),
                      const SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () => _setLanguage('en'),
                        child: Text('english'.tr()),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 42.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutingManager.logIn);
                    },
                    child: Text('log_in'.tr()),
                  ),
                  const SizedBox(width: 18.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutingManager.signIn);
                    },
                    child: Text('sign_up'.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
