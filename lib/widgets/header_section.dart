import 'package:flutter/material.dart';
import 'package:tomas_website/widgets/cv_button_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Hi, I\'m ', style: TextStyle(fontSize: isMobile ? 28 : 36)),
        const SizedBox(height: 8),
        Text(
          ' Tomas Ashraf',
          style: TextStyle(
            fontSize: isMobile ? 40 : 60,
            // isMobile ? 28 : 36,
            fontWeight: FontWeight.w900,
            color: Color(0xffa35bf7),
            fontFamily: 'Sprintura_Demo',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer | Flutter Developer',
          style: TextStyle(fontSize: isMobile ? 16 : 20),
        ),
        const SizedBox(height: 16),
        const Text(
          'I build high-performance, responsive, and elegant mobile & web applications using Flutter.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        CvButtonWidget(),
      ],
    );
  }
}
