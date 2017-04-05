
import XCTest

class UITest: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

		let app = XCUIApplication()
		app.launch()

		addUIInterruptionMonitor(withDescription: "Location Dialog") { alert -> Bool in
			alert.buttons["Allow"].tap()
			return true
		}

		// Causes the interuption above to fire.
		app.tap()
    }

	func testApp() {

		let app = XCUIApplication()
		let latitude = app.staticTexts.matching(identifier: "latitude").element
		let longitude = app.staticTexts.matching(identifier: "longitude").element

		let exists = NSPredicate(format: "exists == 1")
		expectation(for: exists, evaluatedWith: latitude, handler: nil)
		expectation(for: exists, evaluatedWith: longitude, handler: nil)
		waitForExpectations(timeout: 10, handler: nil)

		XCTAssertEqual(latitude.label, "51.50998")
		XCTAssertEqual(longitude.label, "-0.1337")
	}
}
