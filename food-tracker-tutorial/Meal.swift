import UIKit

class Meal: NSObject, NSCoding {
	
	// MARK: Properties
	var name: String
	var rating: Int
	var photo: UIImage?
	
	// MARK: Archiving Paths
	static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
	
	static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
	
	// MARK: Types
	struct PropertyKey {
		static let nameKey = "name"
		static let photoKey = "photo"
		static let ratingKey = "rating"
	}
	
	// MARK: Initialization
	
	init?(name: String, photo: UIImage?, rating: Int)
	{
		self.name = name
		self.photo = photo
		self.rating = rating
		
		super.init()
		
		// Init should fail if incorrect values provided
		if name.isEmpty || rating < 0 {
			return nil
		}
	}
	
	// MARK: NSCoding
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
		aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
		aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
		
		// Because photo is optional use conditional cast
		let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
		// No need to downcast since decodeIntegerForKey is already Int
		let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
		
		// Must call designated initializer
		self.init(name: name, photo: photo, rating: rating)
	}
}
