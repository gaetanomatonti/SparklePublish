import SparkleCSS
import SparkleTools

/// An object that contains the rules that will be handed off to the renderer at the end of the HTML generation step.
actor RulesContainer {

  // MARK: - Stored Properties

  /// The set of rules that should be rendered.
  var rules: Set<Rule> = []

  // MARK: - Functions

  /// Inserts a rule in the set of rules to render.
  /// - Parameter rule: The rule to add to the set of rules.
  public func insert(_ rule: Rule) {
    rules.insert(rule)
  }

  /// Inserts a lit of rules in the set of rules to render.
  /// - Parameter rules: The list of rules to add to the set of rules.
  public func insert<C>(_ rules: C) where C: Collection, C.Element == Rule {
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
