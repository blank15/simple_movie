import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared/style/theme.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl:  'https://media-exp1.licdn.com/dms/image/C5103AQEDFyI3xAAlHg/profile-displayphoto-shrink_800_800/0/1581490902213?e=2147483647&v=beta&t=-tc_iZoSpwwvNxFCAiVYZDyTG-xLXQKQGecEuEcBmow',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
              top: 30.0,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,color: Colors.white, size: 32, // add custom icons also
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Text('Yudistiro Septian Dwi Saputro', style:
        CustomTheme().textBlack.titleMedium,),
        const SizedBox(height: 10,),
        Text('Android Developer', style:
        CustomTheme().textBlack.titleMedium,)
      ],
    );
  }
}
