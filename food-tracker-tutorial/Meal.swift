import UIKit

class Meal {
	// MARK: Properties
	
	var name: String
	var rating: Int
	var photo: UIImage?
	
	// MARK: Initialization
	
	init?(name: String, photo: UIImage?, rating: Int)
	{
		self.name = name
		self.photo = photo
		self.rating = rating
		
		// Init should fail if incorrect values provided
		if name.isEmpty || rating < 0 {
			return nil
		}
	}
}
