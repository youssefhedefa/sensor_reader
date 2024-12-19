import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LightSection extends StatelessWidget {
  const LightSection({super.key, required this.value, });

  final bool value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          value ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon,
          size: 100,
          color: Colors.blue,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          '${'light'.tr()} : $value',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
