# text_table

Renders style-able flex ascii tables.

# Features

+ Customizable table borders
+ Multiline rows
+ Column size control
    + Min and max Column widths
    + Flex column widths
    + Percentage based column widths
+ Cell text alignment
+ Cell padding

# TODO

+ [ ] Merged cells
+ [ ] Text truncation and ellipsis

# Usage

## Simple example

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

## Text alignment

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

## Padding

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

## Flex columns

```dart
import 'package:text_table/text_table.dart';

main() {
  final tab = TableRenderer(padding: Padding.same(2)).render([
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    ColSpec(name: 'Player', width: Flex(2)),
    ColSpec(name: 'Team', width: Flex(1), minWidth: Fixed(15)),
    ColSpec(name: 'Goals', width: Flex(1), align: Align.right)
  ], width: 50);
  print(tab);
}
```

```
┌─────────────────┬───────────────────┬──────────┐
│     Player      │       Team        │  Goals   │
┝━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━┥
│  Messi          │  Barcelona FC     │      80  │
├─────────────────┼───────────────────┼──────────┤
│  Christiano Ro  │  Real Madrid      │      30  │
│  naldo          │                   │          │
├─────────────────┼───────────────────┼──────────┤
│  Luiz Suarez    │  Barcelona FC     │      50  │
└─────────────────┴───────────────────┴──────────┘
```

## Customize border styles

Use `border` field of `TableRenderer` to customize the border style of the table.

### Double line

```dart
final tab = TableRenderer(border: Border.doubleLines)
    .render(rows, columns: columns);
print(tab);
```

```
╔══════════════════╤════════════╤═════╗
║      Player      │    Team    │Goals║
╠══════════════════╪════════════╪═════╣
║Messi             │Barcelona FC│80   ║
╟──────────────────┼────────────┼─────╢
║Christiano Ronaldo│Real Madrid │30   ║
╟──────────────────┼────────────┼─────╢
║Luiz Suarez       │Barcelona FC│50   ║
╚══════════════════╧════════════╧═════╝
```

### Compact

```dart
final tab =
  TableRenderer(border: Border.compact).render(rows, columns: columns);
print(tab);
```

```
      Player           Team     Goals
-------------------------------------
Messi              Barcelona FC 80   
Christiano Ronaldo Real Madrid  30   
Luiz Suarez        Barcelona FC 50    
```

### Rounded corners

```dart
final tab =
  TableRenderer(border: Border.round).render(rows, columns: columns);
print(tab);
```

```
╭──────────────────┬────────────┬─────╮
│      Player      │    Team    │Goals│
┝━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━┿━━━━━┥
│Messi             │Barcelona FC│80   │
├──────────────────┼────────────┼─────┤
│Christiano Ronaldo│Real Madrid │30   │
├──────────────────┼────────────┼─────┤
│Luiz Suarez       │Barcelona FC│50   │
╰──────────────────┴────────────┴─────╯
```