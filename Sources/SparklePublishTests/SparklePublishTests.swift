import XCTest
import Plot
import SparkleCSS
@testable import SparklePublish

final class SparklePublishTests: XCTestCase {
  func testComponentStyle() {
    let component = Paragraph()
      .style(
        .fontSize(.rem(1)),
        .foregroundColor(NamedColor.red)
      )

    XCTAssertEqual(component.render(), "<p class=\"text-size-1rem color-red\"></p>")
  }
}
