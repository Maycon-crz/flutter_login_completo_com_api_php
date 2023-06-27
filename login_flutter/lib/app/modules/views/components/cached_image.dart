import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/app/modules/utils/dimensions.dart';

Widget cachedImage({
  required String url,
  bool circular = false,
  bool boxFit = false,
  BorderRadius? borderRadius,
  Color backgroundColor = Colors.white,
}) {
  borderRadius ?? BorderRadius.circular(Dimensions.radius20);
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: circular
        ? (context, imageProvider) =>
            CircleAvatar(backgroundImage: imageProvider)
        : (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: backgroundColor,
                image: DecorationImage(
                  image: imageProvider,
                  fit: boxFit ? BoxFit.cover : null,
                  // colorFilter:
                  //     const ColorFilter.mode(Colors.green, BlendMode.colorBurn),
                ),
              ),
            ),
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(
      value: downloadProgress.progress,
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
    fadeInDuration: const Duration(milliseconds: 400),
  );
}
