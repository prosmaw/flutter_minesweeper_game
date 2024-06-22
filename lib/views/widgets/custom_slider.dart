import 'package:demineur/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  CustomSlider({
    super.key,
    required this.sliderName,
    required this.width,
  });
  final String sliderName;
  final double width;
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double sliderValue = 0;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 6,
              width: widget.width * 0.75,
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
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                    print("${sliderValue}");
                  });
                },
                min: 0,
                max: 100,
                thumbColor: Colors.white,
                overlayColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 87, 174, 211).withOpacity(0.5)),
                activeColor: Colors.transparent,
                inactiveColor: Colors.transparent,
                autofocus: true,
              ),
            ),
            Text(
              "${sliderValue.floor()}",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ],
    );
  }
}
