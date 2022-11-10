import Foundation
import Publish
import Sparkle
import SparkleCSS
import SparkleTools

public extension PublishingStep {
  /// Configures the CSS stylesheet renderer.
  /// - Parameter configure: A closure that allows to configure the main `StyleSheetRenderer` instance.
  static func configureStyleSheet(_ configure: (StyleSheetRenderer) -> Void) -> Self {
    configure(EnvironmentValues.styleSheetRenderer)
  }

  /// Generates the CSS from Sparkle.
  /// - Parameter filename: The name of the file to generate.
  static func generateCSS(_ filename: String, path: #file) -> Self {
    step(named: "Generate CSS ✨") { context in
      let filePath = URL(fileURLWithPath: path.description)
      let packagePath = FileManager.default.packagePath(from: filePath)
      let outputPath = packagePath.appendingPathComponent("Output")

      let renderer = EnvironmentValues.styleSheetRenderer
      let generator = Generator(content: renderer.render())
      try generator.write(file: filename, with: "css", to: outputPath)
    }
  }
}
