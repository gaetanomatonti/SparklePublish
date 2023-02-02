import Foundation
import Publish
import Sparkle
import SparkleCSS
import SparkleTools

public extension PublishingStep {
  /// Configures the CSS stylesheet renderer.
  /// - Parameter configure: A closure that allows to configure the main `StyleSheetRenderer` instance.
  static func configureStyleSheet(_ configure: @escaping (RulesContainer) async -> Void) -> Self {
    step(named: "Sparkle Stylesheet Configuration ✨") { _ in
      await configure(EnvironmentValues.rulesContainer)
    }
  }
  
  /// Generates the CSS from Sparkle.
  /// - Parameter filename: The name of the file to generate.
  static func generateCSS(_ filename: String, path: StaticString = #file) -> Self {
    step(named: "Generate CSS ✨") { context in
      let filePath = URL(fileURLWithPath: path.description)
      let packagePath = FileManager.default.packagePath(from: filePath)
      let outputPath = packagePath.appendingPathComponent("Output")
      
      let renderer = StyleSheetRenderer()
      let renderedContent = await renderer.render()
      let generator = FileGenerator(content: renderedContent)
      try generator.write(file: filename, with: "css", to: outputPath)
    }
  }
}
