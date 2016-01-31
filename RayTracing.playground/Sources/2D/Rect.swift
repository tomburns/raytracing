import Foundation

struct Rect: TwoDimensionalSceneItem {
    
    let rect: CGRect
    
    func hitTest(point: CGPoint) -> Bool {
        return rect.contains(point)
    }
    
    static func randomRect() -> Rect {
        let width = CGFloat(10 * (arc4random_uniform(5)+2))
        let height = CGFloat(10 * (arc4random_uniform(5)+2))
        
        let x = CGFloat(arc4random_uniform(UInt32(Constants.outputSize.width)))
        let y = CGFloat(arc4random_uniform(UInt32(Constants.outputSize.height)))
        
        return Rect(rect: CGRectMake(x, y, width, height))
    }
}