# FixedMenu

A SwiftUI Menu wrapper that keeps your label visible in iOS 26.

## The Problem

iOS 26 changed how `Menu` works. Now the label disappears when you open the menu. This looks bad and confuses users.

## Solution

`FixedMenu` keeps the label visible on iOS 26, while working normally on older iOS versions.

## Installation

Add this to your project via Swift Package Manager:

```
https://github.com/mezhevikin/FixedMenu.git
```

## Usage

Just replace `Menu` with `FixedMenu`:

```swift
import FixedMenu

FixedMenu(content: {
    Button("Edit") { }
    Button("Share") { }
    Button("Delete", role: .destructive) { }
}, label: {
    Text("Options")
})
```

## Requirements

- iOS 15.0+

## License

MIT
