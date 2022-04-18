import 'dart:math';
import 'package:collection/collection.dart';

import '../style/style.dart';
import '../dimension/dimension.dart';
import 'sizing.dart';
import 'drawer.dart';

class ColSpec {
  final String? name;

  final Size? width;

  final Fixed? minWidth;

  final Fixed? maxWidth;

  final Padding? padding;

  final Align headAlign;

  final Align align;

  ColSpec(
      {this.name,
      this.width,
      this.minWidth,
      this.maxWidth,
      this.padding,
      this.headAlign = Align.center,
      this.align = Align.left});

  static List<ColSpec> fromNames(Iterable<String> names) =>
      names.map((e) => ColSpec(name: e)).toList();
}

class TableRenderer {
  final Border border;

  final Fixed? minColWidth;

  final Fixed? maxColWidth;

  final Padding padding;

  const TableRenderer(
      {this.border = Border.def,
      this.minColWidth,
      this.maxColWidth,
      this.padding = const Padding()});

  String render(Iterable<List> rows,
      {bool withHead = true,
      List? /* <String | Column> */ columns,
      int? width}) {
    // Make column spec
    if (columns == null) {
      withHead = false;
      final firstRow = rows.firstOrNull;
      if (firstRow == null || firstRow.isEmpty) {
        columns = <ColSpec>[];
      } else {
        columns = List<ColSpec>.filled(firstRow.length, ColSpec());
      }
    } else {
      columns = columns.map((e) {
        if (e is String) return ColSpec(name: e);
        return e as ColSpec;
      }).toList();
    }
    if (columns is! List<ColSpec>) {
      throw ArgumentError('invalid argument', 'columns');
    }

    final paddings = columns.map((e) => e.padding ?? padding).toList();
    final headAligns = columns.map((e) => e.headAlign).toList();
    final aligns = columns.map((e) => e.align).toList();

    final decorWidth =
        max((columns.length - 1) * border.contentIntersect.length, 0) +
            border.contentLeft.length +
            border.contentRight.length +
            paddings.map((p) => p.total).fold<int>(0, (p, c) => p + c);
    final colSpecs = columns
        .mapIndexed((i, e) => ColumnArgs(
            width: e.width,
            min: e.minWidth ?? minColWidth,
            max: e.maxWidth ?? maxColWidth,
            dataLength: _findLongest(e.name ?? '', rows, i),
            pad: e.padding ?? padding))
        .toList();

    // Estimate column sizes
    List<Fixed> estimated;
    int totalWidth;
    if (width == null) {
      estimated = estimateColumnSizes(colSpecs);
      totalWidth = Fixed.sum(estimated) + decorWidth;
    } else {
      totalWidth = width;
      estimated =
          estimateColumnSizeWithTotalWidth(totalWidth - decorWidth, colSpecs);
    }

    final List<int> widths = Fixed.toInt(estimated).toList(growable: false);

    final sb = StringBuffer();

    // Render heading
    if (withHead) {
      {
        final LineStyle sepStyle = border.topLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty)
          sb.writeln(TableDrawer.drawRowSeparator(
              widths, totalWidth, border.topLine, paddings));
      }

      TableDrawer.drawRow(columns.map((e) => e.name ?? '').toList(), widths,
              headAligns, border.contentLine, paddings)
          .forEach(sb.writeln);

      sb.writeln(TableDrawer.drawRowSeparator(
          widths, totalWidth, border.headLine, paddings));
    } else {
      sb.writeln(TableDrawer.drawRowSeparator(
          widths, totalWidth, border.topLine, paddings));
    }

    // Render row and its separator
    for (List cells in rows) {
      if (cells.length != columns.length) {
        throw Exception('Invalid number of columns in a row');
      }
      TableDrawer.drawRow(cells, widths, aligns, border.contentLine, paddings)
          .forEach(sb.writeln);

      if (cells != rows.last) {
        final LineStyle sepStyle = border.separatorLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty) {
          sb.writeln(TableDrawer.drawRowSeparator(
              widths, totalWidth, border.separatorLine, paddings));
        }
      }
    }

    // Render bottom separator
    {
      final LineStyle sepStyle = border.bottomLine;
      if (sepStyle.left.isNotEmpty ||
          sepStyle.horizontal.isNotEmpty ||
          sepStyle.intersection.isNotEmpty ||
          sepStyle.right.isNotEmpty)
        sb.writeln(TableDrawer.drawRowSeparator(
            widths, totalWidth, border.bottomLine, paddings));
    }

    return sb.toString();
  }
}

int _findLongest(String name, Iterable<List> values, int index) {
  int length = name.length;

  for (final row in values) {
    length = max(length, (row[index]?.toString() ?? '').length);
  }

  return length;
}
