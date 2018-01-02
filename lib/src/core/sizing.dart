part of text_table.core;

List<Fixed> _estimateSize(List<Size> sizes, List<int> data,
    List<bool> multiline, List<Fixed> min, List<Fixed> max) {
  final ret = new List<Fixed>(sizes.length);

  for (int i = 0; i < sizes.length; i++) {
    Size size = sizes[i];
    if (size.isFixed) {
      ret[i] = size;
      continue;
    }

    if (size is Flex) {
      int len = data[i];
      if (min[i] != null) {
        if (len < min[i].size) len = min[i].size;
      }
      if (max[i] != null) {
        if (len > max[i].size) len = max[i].size;
      }
      ret[i] = new Fixed(len);
      continue;
    }

    throw new UnsupportedError('Unsupported size!');
  }

  return ret;
}

List<Fixed> _estimateFlex(
    int totalWidth,
    List<Size> sizes,
    List<int> data,
    List<bool> multiline,
    List<Fixed> min,
    List<Fixed> max,
    List<Padding> pads) {
  final ret = new List<Fixed>(sizes.length);
  final ok = new List<bool>.filled(sizes.length, false);

  int occWidth = pads.map((p) => p.total).reduce((s, p) => s + p);
  occWidth += 1 + sizes.length; // TODO use border to calculate

  int flexTotal = 0;

  for (int i = 0; i < sizes.length; i++) {
    Size size = sizes[i];

    if (size is Fixed) {
      ret[i] = size;
      occWidth += size.size;
      ok[i] = true;
      continue;
    }

    if (size is Flex) {
      if (size.isTight) {
        // TODO handle multiline tight
        int len = data[i];
        if (min[i] != null) {
          if (len < min[i].size) len = min[i].size;
        }
        if (max[i] != null) {
          if (len > max[i].size) len = max[i].size;
        }
        ret[i] = new Fixed(len);
        occWidth += len;
        ok[i] = true;
      } else {
        flexTotal += size.flex;
      }
      continue;
    }

    throw new UnsupportedError('Unsupported size!');
  }

  {
    final int remWidth = totalWidth - occWidth;

    for (int i = 0; i < sizes.length; i++) {
      Size size = sizes[i];

      if (size is Flex && !ok[i] && max[i] != null) {
        final int allocWidth = (remWidth * size.flex) ~/ flexTotal;
        if (allocWidth > max[i].size) {
          ret[i] = new Fixed(max[i].size);
          occWidth += max[i].size;
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

      if (size is Flex && !ok[i] && min[i] != null) {
        final int allocWidth = (remWidth * size.flex) ~/ flexTotal;
        if (allocWidth < min[i].size) {
          extraWidth -= min[i].size;

          if (extraWidth > oks) {
            ret[i] = new Fixed(min[i].size);
            occWidth += min[i].size;
            ok[i] = true;
            oks--;
            flexTotal -= size.flex;
          } else {
            break;
          }
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
      ret[i] = new Fixed(allocWidth);
    }
  }

  while (extraWidth != 0) {
    for (int i = 0; i < sizes.length; i++) {
      Size size = sizes[i];

      if (size is Flex && !ok[i]) {
        ret[i] = new Fixed(ret[i].size + 1);
        extraWidth--;
      }

      if (extraWidth == 0) break;
    }
  }

  return ret;
}
