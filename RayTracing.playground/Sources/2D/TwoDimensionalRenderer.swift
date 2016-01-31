import Cocoa

public class TwoDimensionalRenderer {
    let hitColor = NSColor.redColor()
    let missColor = NSColor.blackColor()
    
    public init() {
        
    }
    
    lazy var scene: TwoDimensionalScene = {
        let size = Constants.outputSize
        
        let ellipse1 = Ellipse(rect: CGRectInset(CGRect(x: 0, y: 0, width: size.width/2, height: size.height/2), 5, 5))
        let rect1 = Rect(rect: CGRectInset(CGRect(x: size.width/2, y: 0, width: size.width/2, height: size.height/2), 10, 10))
        let ellipse2 = Ellipse(rect: CGRectInset(CGRect(x: size.width/2, y: size.height/2, width: size.width/2, height: size.height/2), 5, 5))
        let rect2 = Rect(rect: CGRectInset(CGRect(x: 0, y: size.height/2, width: size.width/2, height: size.height/2), 10, 10))
        
        return TwoDimensionalScene(size: size, items: [ellipse1,ellipse2,rect1,rect2])
    }()
    
    public func colorForPoint(point: CGPoint) -> NSColor {
        if scene.hitTest(point) {
            return hitColor
        } else {
            return missColor
        }
    }
}