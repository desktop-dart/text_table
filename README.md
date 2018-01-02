# text_table

Renders style-able flex ascii tables.

## Features

+ Customizable table borders
+ Column width customization
+ Flex column widths
+ Cell text alignment
+ Cell padding
+ Text truncation and ellipsis

### TODO

+ [ ] Multiline cells

## Usage

### Simple example

```dart
main() {
  final Table tab = table(['Player', 'Team', 'Goals'])
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
  print(tab);
}
```

```
┌──────────────────┬────────────┬─────┐
│Player            │Team        │Goals│
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
final Table tab = table(['Player', 'Team', 'Goals'],
    colWidths: [fixed(25), fixed(25), fixed(10)], globalAlign: Align.center)
  ..row(['Messi', 'Barcelona FC', 80])
  ..row(['Christiano Ronaldo', 'Real Madrid', 30])
  ..row(['Luiz Suarez', 'Barcelona FC', 50]);
```

```
┌─────────────────────────┬─────────────────────────┬──────────┐
│         Player          │          Team           │  Goals   │
┝━━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━┥
│          Messi          │      Barcelona FC       │    80    │
├─────────────────────────┼─────────────────────────┼──────────┤
│   Christiano Ronaldo    │       Real Madrid       │    30    │
├─────────────────────────┼─────────────────────────┼──────────┤
│       Luiz Suarez       │      Barcelona FC       │    50    │
└─────────────────────────┴─────────────────────────┴──────────┘
```

#### Column specific text alignment

```dart
final Table tab = table(['Player', 'Team', 'Goals'],
    colWidths: [fixed(25), fixed(25), fixed(10)],
    aligns: [Align.left, Align.center, Align.right])
  ..row(['Messi', 'Barcelona FC', 80])
  ..row(['Christiano Ronaldo', 'Real Madrid', 30])
  ..row(['Luiz Suarez', 'Barcelona FC', 50]);
```

```
┌─────────────────────────┬─────────────────────────┬──────────┐
│Player                   │          Team           │     Goals│
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
  final Table tab = table(['Player', 'Team', 'Goals'],
      globalPadding: pad(before: 2, after: 2))
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
```

```
┌──────────────────────┬────────────────┬─────────┐
│  Player              │  Team          │  Goals  │
┝━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━┿━━━━━━━━━┥
│  Messi               │  Barcelona FC  │  80     │
├──────────────────────┼────────────────┼─────────┤
│  Christiano Ronaldo  │  Real Madrid   │  30     │
├──────────────────────┼────────────────┼─────────┤
│  Luiz Suarez         │  Barcelona FC  │  50     │
└──────────────────────┴────────────────┴─────────┘
```

### Elipses

```dart
  final Table tab = table(['Player', 'Team', 'Goals'])
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
  tab.maxColWidths[0] = fixed(10);
  tab.minColWidths[2] = fixed(10);
```

```
┌──────────┬────────────┬──────────┐
│Player    │Team        │Goals     │
┝━━━━━━━━━━┿━━━━━━━━━━━━┿━━━━━━━━━━┥
│Messi     │Barcelona FC│80        │
├──────────┼────────────┼──────────┤
│Christi...│Real Madrid │30        │
├──────────┼────────────┼──────────┤
│Luiz Su...│Barcelona FC│50        │
└──────────┴────────────┴──────────┘
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