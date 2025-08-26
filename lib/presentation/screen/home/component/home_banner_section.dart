import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: Utils.symmetric(h: 10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height * 0.15),
        child: CarouselView.weighted(
          controller: controller,
          itemSnapping: true,
          flexWeights: const <int>[7, 1],
          children:
              ImageInfo.values.map((ImageInfo image) {
                return HeroLayoutCard(imageInfo: image);
              }).toList(),
        ),
      ),
    );
  }
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({super.key, required this.imageInfo});

  final ImageInfo imageInfo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r), // only here
      child: CustomImage(path: imageInfo.title, fit: BoxFit.cover),
    );
  }
}

enum ImageInfo {
  image0(KImages.banners),
  image1(KImages.banners),
  image2(KImages.banners),
  image3(KImages.banners);

  const ImageInfo(this.title);

  final String title;
}
