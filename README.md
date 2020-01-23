Spy is a lightweight, multiplatform logging utility written in pure Swift. It allows to log with different levels and on different channels. You can define what levels and channels actually are.

## Requirements

### Development
Project uses following tools for development
1. XCodeGen
2. Cocoapods
3. SwiftLint

## Installation

To get started with the **Spy** you first have to decide how you will integrate it with your project. Spy supports following tools:

### Cocoapods

To install Spy using Cocoapods go through following steps:

1. Add the following entry in your **Podfile**:
```
pod 'Spy'
```
2. Then run `pod install`.


### Carthage

To install Spy using Carthage go through following steps:

1. Add the following entry to your **Cartfile**

```
github "appunite/Spy"
```

2. Then run ```carthage update```

### Swift Package Manager

To install Spy using **Swift Package Manager** go through following steps:

1. Add following package dependency in you **Package.swift** ``` .package(url: "https://github.com/appunite/Spy.git", from: "0.0.1") ```
2. Add following tatget dependency in your **Package.swift** ``` dependencies: ["Spy"]) ```

## Overview

Here is a quick overview of functionalities and concepts used in **Spy**.

## Contribution

Project is created by **Tomasz Lewandowski**.

If you created some new feature or fixed a bug you can create a pull request. Feel free to submit your feature requests if you have any.

## License

Spy is released under an MIT license. See [License.md](LICENSE.md) for more information.
