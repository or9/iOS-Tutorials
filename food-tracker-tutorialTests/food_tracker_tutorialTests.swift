import UIKit
import XCTest

class food_tracker_tutorialTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: FoodTrackerTests
    
    func testMealInitilization ()
    {
        let potentialItem = Meal(name: "Delicious, new meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem, "Should init successfully if provided a name and valid rating")
        
        let failNoName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(failNoName, "Should require a name")
        
        let failRating = Meal(name: "Bad Rating", photo: nil, rating: -1)
        XCTAssertNil(failRating, "Should not be negative")
    }
}
