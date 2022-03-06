part of text_table.style;

class Border {
  final String? topLeft;
  final String topFlat;
  final String? topIntersect;
  final String? topRight;

  final String? bottomLeft;
  final String bottomFlat;
  final String? bottomIntersect;
  final String? bottomRight;

  final String? separatorLeft;
  final String separatorFlat;
  final String? separatorIntersect;
  final String? separatorRight;

  final String contentLeft;
  final String contentSpace;
  final String contentIntersect;
  final String contentRight;

  final String? headLeft;
  final String? headFlat;
  final String? headIntersect;
  final String? headRight;

  const Border(
      {this.topLeft,
      required this.topFlat,
      this.topIntersect,
      this.topRight,
      this.bottomLeft,
      required this.bottomFlat,
      this.bottomIntersect,
      this.bottomRight,
      this.separatorLeft,
      required this.separatorFlat,
      this.separatorIntersect,
      this.separatorRight,
      required this.contentLeft,
      this.contentSpace: ' ',
      required this.contentIntersect,
      required this.contentRight,
      this.headLeft,
      this.headFlat,
      this.headIntersect,
      this.headRight});

  LineStyle get topLine => LineStyle(
      left: topLeft ?? topFlat,
      horizontal: topFlat,
      intersection: topIntersect ?? topFlat,
      right: topRight ?? topFlat);

  LineStyle get headLine => LineStyle(
      left: headLeft ?? headFlat ?? separatorLeft ?? separatorFlat,
      horizontal: headFlat ?? separatorFlat,
      intersection:
          headIntersect ?? headFlat ?? separatorIntersect ?? separatorFlat,
      right: headRight ?? headFlat ?? separatorRight ?? separatorFlat);

  LineStyle get separatorLine => LineStyle(
      left: separatorLeft ?? separatorFlat,
      horizontal: separatorFlat,
      intersection: separatorIntersect ?? separatorFlat,
      right: separatorRight ?? separatorFlat);

  LineStyle get contentLine => LineStyle(
      left: contentLeft,
      horizontal: contentSpace,
      intersection: contentIntersect,
      right: contentRight);

  LineStyle get bottomLine => LineStyle(
      left: bottomLeft ?? bottomFlat,
      horizontal: bottomFlat,
      intersection: bottomIntersect ?? bottomFlat,
      right: bottomRight ?? bottomFlat);

  Border copyWith(
          {String? topLeft,
          String? topFlat,
          String? topIntersect,
          String? topRight,
          String? bottomLeft,
          String? bottomFlat,
          String? bottomIntersect,
          String? bottomRight,
          String? separatorLeft,
          String? separatorFlat,
          String? separatorIntersect,
          String? separatorRight,
          String? contentLeft,
          String? contentSpace,
          String? contentIntersect,
          String? contentRight,
          String? headLeft,
          String? headFlat,
          String? headIntersect,
          String? headRight}) =>
      Border(
          topLeft: topLeft ?? this.topLeft,
          topFlat: topFlat ?? this.topFlat,
          topIntersect: topIntersect ?? this.topIntersect,
          topRight: topRight ?? this.topRight,
          bottomLeft: bottomLeft ?? this.bottomLeft,
          bottomFlat: bottomFlat ?? this.bottomFlat,
          bottomIntersect: bottomIntersect ?? this.bottomIntersect,
          bottomRight: bottomRight ?? this.bottomRight,
          separatorLeft: separatorLeft ?? this.separatorLeft,
          separatorFlat: separatorFlat ?? this.separatorFlat,
          separatorIntersect: separatorIntersect ?? this.separatorIntersect,
          separatorRight: separatorRight ?? this.separatorRight,
          contentLeft: contentLeft ?? this.contentLeft,
          contentSpace: contentSpace ?? this.contentSpace,
          contentIntersect: contentIntersect ?? this.contentIntersect,
          contentRight: contentRight ?? this.contentRight,
          headLeft: headLeft ?? this.headLeft,
          headFlat: headFlat ?? this.headFlat,
          headIntersect: headIntersect ?? this.headIntersect,
          headRight: headRight ?? this.headRight);

  static const Border def = const Border(
      topLeft: '┌',
      topFlat: '─',
      topIntersect: '┬',
      topRight: '┐',
      bottomLeft: '└',
      bottomFlat: '─',
      bottomIntersect: '┴',
      bottomRight: '┘',
      separatorLeft: '├',
      separatorFlat: '─',
      separatorIntersect: '┼',
      separatorRight: '┤',
      contentLeft: '│',
      contentSpace: ' ',
      contentIntersect: '│',
      contentRight: '│',
      headLeft: '┝',
      headFlat: '━',
      headIntersect: '┿',
      headRight: '┥');

  static const Border defRound = const Border(
      topLeft: '╭',
      topFlat: '─',
      topIntersect: '┬',
      topRight: '╮',
      bottomLeft: '╰',
      bottomFlat: '─',
      bottomIntersect: '┴',
      bottomRight: '╯',
      separatorLeft: '├',
      separatorFlat: '─',
      separatorIntersect: '┼',
      separatorRight: '┤',
      contentLeft: '│',
      contentSpace: ' ',
      contentIntersect: '│',
      contentRight: '│',
      headLeft: '┝',
      headFlat: '━',
      headIntersect: '┿',
      headRight: '┥');

  static const Border simple = const Border(
      topLeft: '┌',
      topFlat: '─',
      topIntersect: '┬',
      topRight: '┐',
      bottomLeft: '└',
      bottomFlat: '─',
      bottomIntersect: '┴',
      bottomRight: '┘',
      separatorLeft: '├',
      separatorFlat: '─',
      separatorIntersect: '┼',
      separatorRight: '┤',
      contentLeft: '│',
      contentSpace: ' ',
      contentIntersect: '│',
      contentRight: '│');

  static const Border simpleRound = const Border(
      topLeft: '╭',
      topFlat: '─',
      topIntersect: '┬',
      topRight: '╮',
      bottomLeft: '╰',
      bottomFlat: '─',
      bottomIntersect: '┴',
      bottomRight: '╯',
      separatorLeft: '├',
      separatorFlat: '─',
      separatorIntersect: '┼',
      separatorRight: '┤',
      contentLeft: '│',
      contentSpace: ' ',
      contentIntersect: '│',
      contentRight: '│');

  static const Border singleLine = const Border(
      topLeft: '┌',
      topFlat: '─',
      topIntersect: '┬',
      topRight: '┐',
      bottomLeft: '└',
      bottomFlat: '─',
      bottomIntersect: '┴',
      bottomRight: '┘',
      separatorLeft: '├',
      separatorFlat: '─',
      separatorIntersect: '┼',
      separatorRight: '┤',
      contentLeft: '│',
      contentSpace: ' ',
      contentIntersect: '│',
      contentRight: '│',
      headLeft: '╞',
      headFlat: '═',
      headIntersect: '╪',
      headRight: '╡');

  static const Border compact = const Border(
      topFlat: '',
      topIntersect: '',
      topLeft: '',
      topRight: '',
      bottomFlat: '',
      bottomIntersect: '',
      bottomLeft: '',
      bottomRight: '',
      contentLeft: '',
      separatorLeft: '',
      separatorFlat: '',
      separatorIntersect: '',
      contentRight: '',
      separatorRight: '',
      contentIntersect: '',
      headFlat: '-');

  static const Border doubleLines = const Border(
      topFlat: '═',
      topIntersect: '╤',
      topLeft: '╔',
      topRight: '╗',
      bottomFlat: '═',
      bottomIntersect: '╧',
      bottomLeft: '╚',
      bottomRight: '╝',
      contentLeft: '║',
      separatorLeft: '╟',
      separatorFlat: '─',
      separatorIntersect: '┼',
      contentRight: '║',
      separatorRight: '╢',
      contentIntersect: '│',
      headLeft: '╠',
      headFlat: '═',
      headIntersect: '╪',
      headRight: '╣');

  static const Border doubleLines2 = const Border(
      topFlat: '═',
      topIntersect: '╦',
      topLeft: '╔',
      topRight: '╗',
      bottomFlat: '═',
      bottomIntersect: '╩',
      bottomLeft: '╚',
      bottomRight: '╝',
      separatorLeft: '╟',
      separatorFlat: '─',
      separatorIntersect: '╫',
      separatorRight: '╢',
      contentLeft: '║',
      contentIntersect: '║',
      contentRight: '║',
      headLeft: '╠',
      headFlat: '═',
      headIntersect: '╬',
      headRight: '╣');

  static const Border doubleLines3 = const Border(
      topLeft: '╓',
      topFlat: '─',
      topIntersect: '╥',
      topRight: '╖',
      bottomLeft: '╙',
      bottomFlat: '─',
      bottomIntersect: '╨',
      bottomRight: '╜',
      separatorLeft: '╟',
      separatorFlat: '─',
      separatorIntersect: '╫',
      separatorRight: '╢',
      contentLeft: '║',
      contentIntersect: '║',
      contentRight: '║',
      headLeft: '╠',
      headFlat: '═',
      headIntersect: '╬',
      headRight: '╣');
}
