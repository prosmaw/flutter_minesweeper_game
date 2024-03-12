import 'package:demineur/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  CustomSlider({
    super.key,
    required this.sliderValue,
    required this.sliderName,
  });
  double sliderValue;
  final String sliderName;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.sliderName,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: BaseColors.darkSecondary,
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.white.withOpacity(0.1),
                Colors.transparent.withOpacity(0.08),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Slider(
            value: widget.sliderValue,
            onChanged: (value) {
              setState(() {
                widget.sliderValue = value;
              });
            },
            thumbColor: Colors.white,
            overlayColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 87, 174, 211).withOpacity(0.5)),
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            autofocus: true,
          ),
        ),
      ],
    );
  }
}
