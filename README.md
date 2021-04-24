# faded_widget

A Flutter package that allows to fade a widget with a gradient of colors in any direction you prefer

## Features

This widget applies a fade effect on a widget (eg an image). You can define the direction of the fade using the `direction` property.

Available values are:
- `GradientDirection.ttb` (Top to Bottom, default)
- `GradientDirection.btt` (Bottom to Top)
- `GradientDirection.ltr` (Left to Right)
- `GradientDirection.rtl` (Right to left)

```dart
FadedWidget(
  height: 400,
  width: 400,
  direction: GradientDirection.ltr,
  fade: [
    Colors.black,
    Colors.grey,
    Colors.white,
  ],
  child: Image(
    height: 400,
    width: 400,
    image: AssetImage('assets/image.jpg'),
    fit: BoxFit.cover,
  ),
),
```
