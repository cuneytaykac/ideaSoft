import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ideasoft/core/extension/size_extension.dart';
import 'package:shimmer/shimmer.dart';

class CategoryImage extends StatelessWidget {
  const CategoryImage(
      {super.key,
      this.fit = BoxFit.cover,
      required this.imageUrl,
      this.placeholder,
      this.errorWidget,
      this.width,
      this.height,
      this.shape = BoxShape.circle,
      this.imageBuilder});
  final BoxFit fit;
  final String imageUrl;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final double? width;
  final double? height;
  final BoxShape shape;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: 'https:$imageUrl',
      placeholder: placeholder ??
          (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: context.screenWidht(0.12),
                  height: context.screenHeight(0.12),
                  decoration: BoxDecoration(
                    shape: shape,
                  ),
                ),
              ),
      errorWidget: errorWidget ??
          (context, url, error) => const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: FlutterLogo(),
              ),
      imageBuilder: imageBuilder ??
          (context, imageProvider) => Container(
                width: width ?? context.screenWidht(0.12),
                height: height ?? context.screenHeight(0.12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: shape,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
    );
  }
}
