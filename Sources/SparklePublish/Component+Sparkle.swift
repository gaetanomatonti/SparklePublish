import Plot
import SparkleCSS
import SparkleTools

extension Plot.Component {
  /// Applies the specified CSS rule to the HTML component and registers the rule for rendering.
  /// - Parameter rule: The rule to apply to the component.
  /// - Returns: The updated comopnent.
  public func rule(_ rule: Rule) -> Plot.Component {
    Task {
      await EnvironmentValues.rulesContainer.insert(rule)
    }

    switch rule.selector {
      case let .class(name):
        return self.class(name)

      case let .identifier(name):
        return self.id(name)

      case .element, .universal:
        return self
    }
  }

  /// Applies a set of rules to the HTML component and registers the rules for rendering.
  /// - Parameter rules: The rules to apply to the component.
  /// - Returns: The component updated with the class names associated with the rules.
  public func style(@RuleBuilder rules: () -> [Rule]) -> Plot.Component {
    let rules = rules()
    
    Task {
      await EnvironmentValues.rulesContainer.insert(rules)
    }

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
