# Claymorphism Package

[![Pub](https://img.shields.io/pub/v/claymorphism.svg)](https://pub.dev/packages/claymorphism)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/your-username/claymorphism/blob/main/LICENSE)

A Flutter package that provides claymorphic UI containers for a modern and aesthetic design.

## Features

- Easy-to-use claymorphic containers for UI design.
- Customizable properties to adjust the appearance of the containers.
- Provides various container shapes and styles.
- Compatible with Flutter web and mobile applications.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  claymorphism: ^0.1.2
```

## Example
### Clay Card
<table>
<tr>
<td>

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: ClayCard(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
    );
  }
}
```
</td>
<td>
<img src="https://firebasestorage.googleapis.com/v0/b/bauhaus-research.appspot.com/o/Screenshot%202023-06-28%20at%208.47.23%20AM.png?alt=media&token=c0fe3777-61a9-46ac-ba45-9cb44fbedea9" height="300" alt="">
</td>
</tr>
</table>

### Clay Card with Shadow
<table>
<tr>
<td>

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: CardWithShadow(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.height * 0.35,
        ),
      ),
    );
  }
}

```
</td>
<td>
<img src="https://firebasestorage.googleapis.com/v0/b/bauhaus-research.appspot.com/o/Screenshot%202023-06-28%20at%208.47.46%20AM.png?alt=media&token=91f6b271-32a4-441d-aefc-f8d5c236ddd5" height="300" alt="">
</td>
</tr>
</table>

