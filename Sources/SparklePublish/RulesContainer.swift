import SparkleCSS
import SparkleTools

actor RulesContainer {
  var rules: Set<Rule> = []

  func insert(_ rule: Rule) {
    rules.insert(rule)
  }

  func insert<C>(_ rules: C) where C: Collection, C.Element == Rule {
    self.rules.formUnion(rules)
  }
}

struct RulesContainerKey: EnvironmentKey {
  static var defaultValue = RulesContainer()
}

extension EnvironmentValues {
  /// The instance of the `Renderer` in the environment.
  static var rulesContainer: RulesContainer {
    get {
      self[RulesContainerKey.self]
    }
    set {
      self[RulesContainerKey.self] = newValue
    }
  }
}
