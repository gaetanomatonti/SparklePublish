# SparklePublish

A package that provides [Publish](https://github.com/JohnSundell/Publish) extensions to work with [Sparkle](https://github.com/gaetanomatonti/Sparkle).

## Why use Sparkle?
Sparkle is a framework to generate static websites without writing a single line of HTML or CSS. It allows doing so by providing a DSL powered by Swift, which makes templating and styling type-safe.

However, Sparkle is still in development and does not allow generating more than one web page. On the other hand, Publish is a much more mature tool for site generation, but you still have to get your hands dirty with CSS when it comes to styling.

With this Swift Package, you can get the best of both worlds: use Publish for site generation and Sparkle for styling.

## Installation
Inside your website's `Package.swift`, add SparklePublish as a dependency.

```swift
dependencies: [
  .package(url: "https://github.com/gaetanomatonti/SparklePublish.git", branch: "main")
],
```

Then, add the `generateCSS` `PublishingStep` to your publishing pipeline and provide the name of the CSS stylesheet file you wish to generate.

```swift
.generateHTML(withTheme: .foundation, indentation: indentation),
.generateCSS("styles"),
```

> Be aware that this step should **always** follow the `generateHTML` step.

You can also use the `configureStyleSheet(_:)` step to configure the CSS renderer with custom rules such as import statements or font face directives. This must be placed **before** the `generateCSS` step.

## Styling
You can add styling to your currently existing [Plot](https://github.com/JohnSundell/Plot) components.
All you have to do is modify the component with the `style(_:)` modifier. This will accept a closure allowing you to list pre-existing or custom rules.

```swift
var body: Component {
  Paragraph("Hello World")
    .style {
      .foregroundColor(NamedColor.black)
      .backgroundColor(NamedColor.white)
      Rule(.class("text"), declaration: ...)
    }
}
```