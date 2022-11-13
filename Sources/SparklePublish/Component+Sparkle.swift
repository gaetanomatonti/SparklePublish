import Plot
import SparkleCSS
import SparkleTools

extension Plot.Component {
  /// Applies the specified CSS rule to the HTML component and registers the rule for rendering.
  /// - Parameter rule: The rule to apply to the component.
  /// - Returns: The updated comopnent.
  public func rule(_ rule: Rule) -> Plot.Component {
    EnvironmentValues.styleSheetRenderer.insert(rule)

    switch rule.selector {
      case let .class(name):
        return self.class(name)

      case let .identifier(name):
        return self.id(name)

      case .element, .universal:
        return self
    }
  }

  public func style(_ rules: Rule...) -> Plot.Component {
    EnvironmentValues.styleSheetRenderer.insert(rules)

    let classNames = rules
      .map { rule in
        switch rule.selector {
          case let .class(className):
            return className

          case .identifier, .element, .universal:
            return ""
        }
      }
      .joined(separator: " ")

    return self.class(classNames)
  }
}
