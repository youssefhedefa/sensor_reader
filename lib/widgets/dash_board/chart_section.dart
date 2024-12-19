import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({super.key, required this.value, required this.label});

  final num value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Center(
            child: SfRadialGauge(
              enableLoadingAnimation: true,
              animationDuration: 3100,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 200,
                      color: Colors.blue,
                    ),
                  ],
                  pointers: [
                    NeedlePointer(
                      value: value.toDouble(),
                      enableAnimation: true,
                      needleColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Text(
            '$label : $value',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
