import 'package:flutter/material.dart';

class ActivityChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildBar(0.3, 'Mon'),
          _buildBar(0.5, 'Tue'),
          _buildBar(0.2, 'Wed'),
          _buildBar(0.8, 'Thu'),
          _buildBar(0.6, 'Fri'),
          _buildBar(0.4, 'Sat'),
          _buildBar(0.7, 'Sun'),
        ],
      ),
    );
  }

  Widget _buildBar(double height, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: 150 * height,
          color: Colors.blue,
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
