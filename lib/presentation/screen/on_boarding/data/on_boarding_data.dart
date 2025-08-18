import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:layer_complain/widgets/custom_image.dart';

import '../../../../../utils/k_images.dart';

class OnBoardingData extends Equatable {
  final String image;
  final String title;
  final String subTitle;

  const OnBoardingData({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  List<Object?> get props => [image, title, subTitle];
}

List<OnBoardingData> data(BuildContext context) => [
  const OnBoardingData(
    image: KImages.onBoarding1,
    title: "Raise Complaints Quickly,Get Noticed Fast",
    subTitle:
        "Submit complaints in seconds to the right authority — anytime, anywhere",
  ),
  const OnBoardingData(
    image: KImages.onBoarding2,
    title: "Stay Informed with Every Complaint Status",
    subTitle:
        "Follow complaint progress and receive instant notifications on every step",
  ),
  const OnBoardingData(
    image: KImages.onBoarding3,
    title: "A Smooth Process to file Complaints Easily",
    subTitle:
        "Get timely resolutions and rate your experience to ensure better service for all.",
  ),
];
