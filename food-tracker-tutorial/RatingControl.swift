import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    let spacing = 5
    let stars = 5

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let btn = UIButton()
            
            btn.setImage(emptyStarImage, forState: .Normal)
            btn.setImage(filledStarImage, forState: .Selected)
            btn.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            btn.adjustsImageWhenHighlighted = false
            
            btn.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            
            ratingButtons += [btn]
            addSubview(btn)
        }
        
    }
    
    override func layoutSubviews() {
        let btnSize = Int(frame.size.height)
        var btnFrame = CGRect(x: 0, y: 0, width: btnSize, height: btnSize)
        
        // Offset each by width + spsacing
        for (index, btn) in ratingButtons.enumerate() {
            btnFrame.origin.x = CGFloat(index * (btnSize + 5))
            btn.frame = btnFrame
        }
        
        updateBtnSelectedStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let btnSize = Int(frame.size.height)
        let width = (btnSize + spacing) * stars
        
        return CGSize(width: width, height: btnSize)
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(btn: UIButton) {
        rating = ratingButtons.indexOf(btn)! + 1
        
        updateBtnSelectedStates()
    }
    
    func updateBtnSelectedStates () {
        for (index, btn) in ratingButtons.enumerate() {
            // If index is less than button, that button should be selected
            btn.selected = index < rating
        }
    }

}
