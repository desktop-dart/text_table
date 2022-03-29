part of text_table.style;

class Border {
  final String topLeft;
  final String topFlat;
  final String topIntersect;
  final String topRight;

  final String bottomLeft;
  final String bottomFlat;
  final String bottomIntersect;
  final String bottomRight;

  final String separatorLeft;
  final String separatorFlat;
  final String separatorIntersect;
  final String separatorRight;

  final String contentLeft;
  final String contentSpace;
  final String contentIntersect;
  final String contentRight;

  final String headLeft;
  final String headFlat;
  final String headIntersect;
  final String headRight;

  const Border(
      {required this.topLeft,
      required this.topFlat,
      required this.topIntersect,
      required this.topRight,
      required this.bottomLeft,
      required this.bottomFlat,
      required this.bottomIntersect,
      required this.bottomRight,
      required this.separatorLeft,
      required this.separatorFlat,
      required this.separatorIntersect,
      required this.separatorRight,
      required this.contentLeft,
      this.contentSpace: ' ',
      required this.contentIntersect,
      required this.contentRight,
      required this.headLeft,
      required this.headFlat,
      required this.headIntersect,
      required this.headRight});

  LineStyle get topLine => LineStyle(
      left: topLeft,
      horizontal: topFlat,
      intersection: topIntersect,
      right: topRight);

  LineStyle get headLine => LineStyle(
      left: headLeft,
      horizontal: headFlat,
      intersection: headIntersect,
      right: headRight);

  LineStyle get separatorLine => LineStyle(
      left: separatorLeft,
      horizontal: separatorFlat,
      intersection: separatorIntersect,
      right: separatorRight);

  LineStyle get contentLine => LineStyle(
      left: contentLeft,
      horizontal: contentSpace,
      intersection: contentIntersect,
      right: contentRight);

  LineStyle get bottomLine => LineStyle(
      left: bottomLeft,
      horizontal: bottomFlat,
      intersection: bottomIntersect,
      right: bottomRight);

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

  static const Border round = const Border(
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
      contentIntersect: '│',
      contentRight: '│',
      headLeft: '│',
      headIntersect: '│',
      headRight: '│',
      headFlat: '─');

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
      contentIntersect: '│',
      contentRight: '│',
      headLeft: '│',
      headIntersect: '│',
      headRight: '│',
      headFlat: '─');

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
      separatorLeft: '',
      separatorFlat: '',
      separatorIntersect: '',
      separatorRight: '',
      contentLeft: '',
      contentRight: '',
      contentIntersect: ' ',
      headFlat: '-',
      headLeft: '',
      headRight: '',
      headIntersect: '-');

  static const Border compact1 = const Border(
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
      contentIntersect: ' ',
      headFlat: '-',
      headLeft: '',
      headRight: '',
      headIntersect: ' ');

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
