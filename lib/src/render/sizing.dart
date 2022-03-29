import 'dart:math';

import '../dimension/dimension.dart';

class ColumnArgs {
  final Size? width;

  final Size? min;

  final Size? max;

  final Padding pad;

  final int dataLength;

  ColumnArgs(
      {required this.width,
      required this.min,
      required this.max,
      required this.dataLength,
      required this.pad});
}

List<Fixed> estimateColumnSizes(List<ColumnArgs> cols) {
  final ret = List<Fixed?>.filled(cols.length, null);

  // final totalDataLength = cols.fold<int>(0, (p, c) => p + c.dataLength);
  final maxLen = min(80 ~/ cols.length, 20);

  for (int i = 0; i < cols.length; i++) {
    Size? size = cols[i].width;
    if (size is Fixed) {
      ret[i] = size;
    } else {
      var width = Fixed(cols[i].dataLength)
          .clamp(cols[i].min, cols[i].max)
          .min(Fixed(maxLen));
      ret[i] = width;
    }
  }

  return ret.cast<Fixed>();
}

List<Fixed> estimateColumnSizeWithTotalWidth(
    int totalWidth, List<ColumnArgs> cols) {
  if (totalWidth.isNegative) {
    throw Exception('Content cannot fit inside the table');
  }

  final ret = List<Fixed?>.filled(cols.length, null);
  final ok = List<bool>.filled(cols.length, false);

  int remWidth = totalWidth;
  int flexTotal = 0;

  // Fixed size columns and no size columns
  for (int i = 0; i < cols.length; i++) {
    Size? size = cols[i].width;

    if (size is Fixed) {
      ret[i] = size.min(Fixed(remWidth));
      remWidth -= size.size;
      ok[i] = true;
    } else if (size is Perc) {
      int width = (totalWidth * size.percentage).floor();

      ret[i] = Fixed(width).min(Fixed(remWidth));
      remWidth -= width;
      ok[i] = true;
    } else if (size is Flex) {
      flexTotal += size.flex;
    } else if (size == null) {
      var width = Fixed(cols[i].dataLength)
          .clamp(cols[i].min, cols[i].max)
          .min(Fixed(20));
      ret[i] = width.min(Fixed(remWidth));
      remWidth -= width.size;
      ok[i] = true;
    } else {
      throw UnsupportedError('Unsupported size!');
    }
  }

  // Flex columns with minWidth that exceeds allocated width
  {
    final int flexTotalWidth = remWidth;
    int flexUsed = 0;

    for (int i = 0; i < cols.length; i++) {
      Size? size = cols[i].width;
      if (size is Flex) {
        final int allocWidth = (flexTotalWidth * size.flex) ~/ flexTotal;
        final width = Fixed(allocWidth)
            .clamp(cols[i].min, cols[i].max, totalSize: totalWidth);
        if (width.size > allocWidth) {
          ret[i] = width.min(Fixed(remWidth));
          remWidth -= width.size;
          ok[i] = true;
          flexUsed += size.flex;
        }
      }
    }
    flexTotal -= flexUsed;
  }

  // Remaining Flex columns
  {
    final int flexTotalWidth = remWidth;
    int flexUsed = 0;

    for (int i = 0; i < cols.length; i++) {
      Size? size = cols[i].width;
      if (size is Flex && !ok[i]) {
        final int allocWidth = (flexTotalWidth * size.flex) ~/ flexTotal;
        final width = Fixed(allocWidth)
            .clamp(cols[i].min, cols[i].max, totalSize: totalWidth);
        ret[i] = width.min(Fixed(remWidth));
        remWidth -= width.size;
        ok[i] = true;
        flexUsed += size.flex;
      }
    }
    flexTotal -= flexUsed;
  }

  // Make sure all flex columns are estimated
  assert(flexTotal == 0);

  // TODO try to distribute extra width to 0 length columns

  // Try to distribute extra width to columns which have long length
  for (int i = 0; i < cols.length && remWidth > 0; i++) {
    final col = cols[i];
    if (col.dataLength > ret[i]!.size) {
      final diff = col.dataLength - ret[i]!.size;
      if (diff >= remWidth) {
        ret[i] = Fixed(ret[i]!.size + remWidth);
        remWidth = 0;
      } else {
        ret[i] = Fixed(ret[i]!.size + diff);
        remWidth -= diff;
      }
    }
  }

  if (remWidth > 0) {
    ret.last = Fixed(ret.last!.size + remWidth);
    remWidth = 0;
  }

  return ret.cast();
}
