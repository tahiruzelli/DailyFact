import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ByteData? tmpByteData;

Future<String?> cropImage(
  ui.Image imageObj, {
  required int x1,
  required int x2,
  required int y1,
  required int y2,
}) async {
  final ui.Image image = imageObj;
  final Completer<Image?> imgCompleter = Completer();
  final Region region = Region(x1: x1, x2: x2, y1: y1, y2: y2);

  if (region.isEmpty) return null;
  if (region.width > image.width || region.height > image.height) return null;

  final ByteData? imgData = await image.toByteData();
  if (imgData == null) return null;

  const int channel = 4;
  final Uint8List resImgList =
      Uint8List(region.width * region.height * channel);
  final Uint8List oriImageList = imgData.buffer.asUint8List();

  for (int row = region.y1, idx = 0; row < region.y2; row++) {
    for (int col = region.x1; col < region.x2; col++) {
      final int rc = row * image.width * channel + col * channel;
      for (int k = 0; k < channel; k++, idx++) {
        resImgList[idx] = oriImageList[rc + k];
      }
    }
  }

  ui.decodeImageFromPixels(
      resImgList, region.width, region.height, ui.PixelFormat.rgba8888,
      (image) async {
    final ByteData? byte =
        await image.toByteData(format: ui.ImageByteFormat.png);
    tmpByteData = byte;
    imgCompleter.complete(Image.memory(byte!.buffer.asUint8List()));
  });
  await imgCompleter.future;

  return base64Encode(oriImageList);
}

class Region {
  /// Left
  final int x1;

  /// Top
  final int y1;

  /// Right
  final int x2;

  /// Bottom
  final int y2;

  const Region(
      {required this.x1, required this.x2, required this.y1, required this.y2});

  /// Create region from left, top, right and bottom
  factory Region.fromLTRB(int x1, int y1, int x2, int y2) {
    return Region(x1: x1, x2: x2, y1: y1, y2: y2);
  }

  /// Get the width of this region
  int get width => max(x2 - x1, 0);

  /// Get the height of this region
  int get height => max(y2 - y1, 0);

  /// Check whether the area of this region is less or equal than 1
  bool get isEmpty => width * height <= 1;

  /// Return the top left of this region
  Offset get topLeft => Offset(x1.toDouble(), y1.toDouble());

  /// Return the bottom right of this region
  Offset get bottomRight => Offset(x2.toDouble(), y2.toDouble());
}
  