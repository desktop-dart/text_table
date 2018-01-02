# text_table

Renders style-able flex ascii tables.

## Features

+ [X] Customizable table borders
+ [X] Column width customization
+ [ ] Flex column widths
+ [X] Cell text alignment
+ [ ] Cell padding
+ [X] Text truncation and ellipsis

## Usage

### Simple example

```dart
main() {
    final Table tab = table(['Player', 'Team', 'Goals'],
        columnWidths: [fixed(25), fixed(25), fixed(10)])
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
}
```

```
┌─────────────────────────┬─────────────────────────┬──────────┐
│Player                   │Team                     │Goals     │
┝━━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━━━━━━━┿━━━━━━━━━━┥
│Messi                    │Barcelona FC             │80        │
├─────────────────────────┼─────────────────────────┼──────────┤
│Christiano Ronaldo       │Real Madrid              │30        │
├─────────────────────────┼─────────────────────────┼──────────┤
│Luiz Suarez              │Barcelona FC             │50        │
└─────────────────────────┴─────────────────────────┴──────────┘
```

### Text alignment

```dart
main() {
    final Table tab = table(['Player', 'Team', 'Goals'],
        columnWidths: [fixed(25), fixed(25), fixed(10)], align: Align.center)
      ..row(['Messi', 'Barcelona FC', 80])..row(
          ['Christiano Ronaldo', 'Real Madrid', 30])..row(
          ['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
}
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
main() {
    final Table tab = table(['Player', 'Team', 'Goals'],
        columnWidths: [fixed(25), fixed(25), fixed(10)],
        aligns: [Align.left, Align.center, Align.right])
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
}
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

### Border styles

```dart
main() {
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      columnWidths: [fixed(25), fixed(25), fixed(10)],
      border: Border.doubleLines,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
}
```

```
╔═════════════════════════╤═════════════════════════╤══════════╗
║Player                   │Team                     │Goals     ║
╠═════════════════════════╪═════════════════════════╪══════════╣
║Messi                    │Barcelona FC             │80        ║
╟─────────────────────────┼─────────────────────────┼──────────╢
║Christiano Ronaldo       │Real Madrid              │30        ║
╟─────────────────────────┼─────────────────────────┼──────────╢
║Luiz Suarez              │Barcelona FC             │50        ║
╚═════════════════════════╧═════════════════════════╧══════════╝
```

#### Supported style

> TODO

#### No borders

```dart
main() {
    final Table tab = table(['Player', 'Team', 'Goals'],
        columnWidths: [fixed(25), fixed(25), fixed(10)], border: Border.compact)
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
}
```

```
Player                   Team                     Goals     
----------------------------------------------------------------
Messi                    Barcelona FC             80        
Christiano Ronaldo       Real Madrid              30        
Luiz Suarez              Barcelona FC             50         
```

### Padding

> TODO

### Flex columns

> TODO