part of text_table.core;

List<Fixed> _estimateSize(List<Size> sizes, List<int> data,
    List<bool> multiline, List<Fixed?> min, List<Fixed?> max) {
  final ret = List<Fixed?>.filled(sizes.length, null);

  for (int i = 0; i < sizes.length; i++) {
    Size size = sizes[i];
    if (size is Fixed) {
      ret[i] = size;
    } else if (size is Flex) {
      int len = data[i];
      final minSize = min[i];
      if (minSize != null) {
        if (len < minSize.size) len = minSize.size;
      }
      final maxSize = max[i];
      if (maxSize != null) {
        if (len > maxSize.size) len = maxSize.size;
      }
      ret[i] = Fixed(len);
    } else {
      throw UnsupportedError('Unsupported size!');
    }
  }

  return ret.cast<Fixed>();
}

List<Fixed> _estimateFlex(
    int totalWidth,
    List<Size> sizes,
    List<int> data,
    List<bool> multiline,
    List<Fixed?> min,
    List<Fixed?> max,
    List<Padding> pads) {
  final ret = List<Fixed?>.filled(sizes.length, null);
  final ok = List<bool>.filled(sizes.length, false);

  int occWidth = pads.map((p) => p.total).reduce((s, p) => s + p);
  occWidth += 1 + sizes.length; // TODO use border to calculate

  int flexTotal = 0;

  for (int i = 0; i < sizes.length; i++) {
    Size size = sizes[i];

    if (size is Fixed) {
      ret[i] = size;
      occWidth += size.size;
      ok[i] = true;
    } else if (size is Flex) {
      if (size.isTight) {
        // TODO handle multiline tight
        int len = data[i];
        final minSize = min[i];
        if (minSize != null) {
          if (len < minSize.size) len = minSize.size;
        }
        final maxSize = max[i];
        if (maxSize != null) {
          if (len > maxSize.size) len = maxSize.size;
        }
        ret[i] = Fixed(len);
        occWidth += len;
        ok[i] = true;
      } else {
        flexTotal += size.flex;
      }
    } else {
      throw UnsupportedError('Unsupported size!');
    }
  }

  {
    final int remWidth = totalWidth - occWidth;

    for (int i = 0; i < sizes.length; i++) {
      Size size = sizes[i];
      final maxSize = max[i];
      if (size is Flex && !ok[i] && maxSize != null) {
        final int allocWidth = (remWidth * size.flex) ~/ flexTotal;
        if (allocWidth > maxSize.size) {
          ret[i] = Fixed(maxSize.size);
          occWidth += maxSize.size;
          ok[i] = true;
          flexTotal -= size.flex;
        }
      }
    }
  }

  {
    final int remWidth = totalWidth - occWidth;
    int extraWidth = remWidth;
    int oks = ok.map((b) => b ? 1 : 0).reduce((s, p) => s + p);

    for (int i = 0; i < sizes.length; i++) {
      Size size = sizes[i];
      final minSize = min[i];
      if (size is Flex && !ok[i] && minSize != null) {
        final int allocWidth = (remWidth * size.flex) ~/ flexTotal;
        if (allocWidth < minSize.size) {
          extraWidth -= minSize.size;

          if (extraWidth <= oks) {
            break;
          }

          ret[i] = Fixed(minSize.size);
          occWidth += minSize.size;
          ok[i] = true;
          oks--;
          flexTotal -= size.flex;
        }
      }
    }
  }

  final int remWidth = totalWidth - occWidth;
  int extraWidth = remWidth;

  for (int i = 0; i < sizes.length; i++) {
    Size size = sizes[i];

    if (size is Flex && !ok[i]) {
      final int allocWidth = (remWidth * size.flex) ~/ flexTotal;
      extraWidth -= allocWidth;
      ret[i] = Fixed(allocWidth);
    }
  }

  while (extraWidth != 0) {
    for (int i = 0; i < sizes.length; i++) {
      Size size = sizes[i];

      if (size is Flex && !ok[i]) {
        ret[i] = Fixed(ret[i]!.size + 1);
        extraWidth--;
      }

      if (extraWidth == 0) break;
    }
  }

  return ret.cast();
}
