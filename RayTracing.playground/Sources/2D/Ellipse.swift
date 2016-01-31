import Cocoa

struct Ellipse: TwoDimensionalSceneItem {
    
    let rect: CGRect
    
    private let path: NSBezierPath
    
    init(rect: CGRect) {
        self.rect = rect
        self.path = NSBezierPath(ovalInRect: rect)
    }
    
    func hitTest(point: CGPoint) -> Bool {
        return path.containsPoint(point)
    }
    
    static func randomEllipse() -> Ellipse {
        let width = CGFloat(10 * (arc4random_uniform(5)+2))
        let height = CGFloat(10 * (arc4random_uniform(5)+2))
        
        let x = CGFloat(arc4random_uniform(UInt32(Constants.outputSize.width)))
        let y = CGFloat(arc4random_uniform(UInt32(Constants.outputSize.height)))
        
        return Ellipse(rect: CGRectMake(x, y, width, height))
    }
}
