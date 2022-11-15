import SparkleCSS

@resultBuilder
public struct RuleBuilder {
  public static func buildBlock(_ components: Rule) -> [Rule] {
    [components]
  }

  public static func buildBlock(_ components: Rule...) -> [Rule] {
    components
  }

  public static func buildArray(_ components: [Rule]) -> [Rule] {
    components
  }
}
