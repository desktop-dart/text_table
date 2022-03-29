# text_table

Renders style-able flex ascii tables.

## Features

+ Customizable table borders
+ Multiline rows
+ Column size control
    + Min and max Column widths
    + Flex column widths
    + Percentage based column widths
+ Cell text alignment
+ Cell padding

### TODO

+ [ ] Merged cells
+ [ ] Text truncation and ellipsis

## Usage

### Simple example

```dart
import 'package:text_table/text_table.dart';

main() {
  final tab = TableRenderer().render([
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    'Player',
    'Team',
    'Goals'
  ]);
  print(tab);
}
```

```
┌──────────────────┬────────────┬─────┐
│      Player      │    Team    │Goals│
┝━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━┿━━━━━┥
│Messi             │Barcelona FC│80   │
├──────────────────┼────────────┼─────┤
│Christiano Ronaldo│Real Madrid │30   │
├──────────────────┼────────────┼─────┤
│Luiz Suarez       │Barcelona FC│50   │
└──────────────────┴────────────┴─────┘
```

### Text alignment

```dart
final tab = TableRenderer().render([
  ['Messi', 'Barcelona FC', 80],
  ['Christiano Ronaldo', 'Real Madrid', 30],
  ['Luiz Suarez', 'Barcelona FC', 50]
], columns: [
  ColSpec(name: 'Player', width: Fixed(25), align: Align.left),
  ColSpec(name: 'Team', width: Fixed(25), align: Align.center),
  ColSpec(name: 'Goals', width: Fixed(10), align: Align.right)
]);
print(tab);
```

```
┌─────────────────────────┬─────────────────────────┬──────────┐
│         Player          │          Team           │  Goals   │
┝━━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━┥
│Messi                    │      Barcelona FC       │        80│
├─────────────────────────┼─────────────────────────┼──────────┤
│Christiano Ronaldo       │       Real Madrid       │        30│
├─────────────────────────┼─────────────────────────┼──────────┤
│Luiz Suarez              │      Barcelona FC       │        50│
└─────────────────────────┴─────────────────────────┴──────────┘
```

### Padding

```dart
import 'package:text_table/text_table.dart';

main() {
  final tab = TableRenderer(padding: Padding.same(1)).render([
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    'Player',
    'Team',
    ColSpec(name: 'Goals', padding: Padding.same(2)),
  ]);
  print(tab);
}
```

```
┌────────────────────┬──────────────┬─────────┐
│       Player       │     Team     │  Goals  │
┝━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━┿━━━━━━━━━┥
│ Messi              │ Barcelona FC │  80     │
├────────────────────┼──────────────┼─────────┤
│ Christiano Ronaldo │ Real Madrid  │  30     │
├────────────────────┼──────────────┼─────────┤
│ Luiz Suarez        │ Barcelona FC │  50     │
└────────────────────┴──────────────┴─────────┘
```

### No borders

```dart
  final Table tab = table(['Player', 'Team', 'Goals'],
      globalPadding: pad(after: 5), border: Border.compact)
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
```

```
Player                 Team             Goals     
--------------------------------------------------
Messi                  Barcelona FC     80        
Christiano Ronaldo     Real Madrid      30        
Luiz Suarez            Barcelona FC     50        
```

### Border styles

```dart
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      border: Border.doubleLines,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
```

```
╔══════════════════╤════════════╤═════╗
║Player            │Team        │Goals║
╠══════════════════╪════════════╪═════╣
║Messi             │Barcelona FC│80   ║
╟──────────────────┼────────────┼─────╢
║Christiano Ronaldo│Real Madrid │30   ║
╟──────────────────┼────────────┼─────╢
║Luiz Suarez       │Barcelona FC│50   ║
╚══════════════════╧════════════╧═════╝
```

#### Out-of-the-box styles

> TODO

### Flex columns

```dart
  final Table tab = table(['Player', 'Team', 'Goals'],
      width: 90,
      colWidths: [flex(2), flex(1), fixed(5)],
      maxColWidths: [fixed(22)],
      globalPadding: padEven(1))
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
```

```
┌────────────────────────┬───────────────────────────────────────────────────────┬───────┐
│ Player                 │ Team                                                  │ Goals │
┝━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━┥
│ Messi                  │ Barcelona FC                                          │ 80    │
├────────────────────────┼───────────────────────────────────────────────────────┼───────┤
│ Christiano Ronaldo     │ Real Madrid                                           │ 30    │
├────────────────────────┼───────────────────────────────────────────────────────┼───────┤
│ Luiz Suarez            │ Barcelona FC                                          │ 50    │
└────────────────────────┴───────────────────────────────────────────────────────┴───────┘
```