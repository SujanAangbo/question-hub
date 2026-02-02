import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height, width;
  final BoxFit? fit;
  final BoxDecoration? shimmerDecoration;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? imageDecoration;
  final double? imageRadius;
  final bool? view;

  const BuildCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.margin,
    this.padding,
    this.shimmerDecoration,
    this.imageDecoration,
    this.imageRadius,
    this.view,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: view == true
      //     ? () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => ViewImage(
      //             image: imageUrl,
      //           )));
      // }
      //     : null,
      child: Container(
        padding: padding ?? const EdgeInsets.all(0),
        decoration: imageDecoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius ?? 0),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            alignment: Alignment.centerLeft,
            filterQuality: FilterQuality.high,
            fadeInDuration: const Duration(milliseconds: 1000),
            fadeInCurve: Curves.bounceInOut,
            fadeOutDuration: const Duration(milliseconds: 1000),
            imageBuilder: (context, image) {
              return Image.network(imageUrl, height: height, width: width);
            },
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                  child: Container(
                    padding: padding ?? const EdgeInsets.all(0),
                    decoration:
                        shimmerDecoration ??
                        BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                    height: height ?? 200,
                    width: width ?? MediaQuery.of(context).size.width,
                    margin: margin,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: Container(
                        height: height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
            errorWidget: (context, o, s) {
              return Image.network(
                'https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                fit: fit ?? BoxFit.fill,
                filterQuality: FilterQuality.low,
              );
            },
          ),
        ),
      ),
    );
  }
}
