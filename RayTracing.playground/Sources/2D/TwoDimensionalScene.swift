import Foundation

struct TwoDimensionalScene {
    let items: [TwoDimensionalSceneItem]
    
    init(size: CGSize, items: [TwoDimensionalSceneItem]) {
        self.items = items
    }
    
    
    func hitTest(point: CGPoint) -> Bool {
        for item in items {
            if item.hitTest(point) {
                return true
            }
        }
        
        return false
    }
    
    static func someRandomRects(count: Int) -> [TwoDimensionalSceneItem] {
        return (0..<count/2).map { _ -> TwoDimensionalSceneItem in
            return Ellipse.randomEllipse()
            } + (0..<count/2).map { _ -> TwoDimensionalSceneItem in
                return Rect.randomRect()
        }
    }
}

protocol TwoDimensionalSceneItem {
    var rect: CGRect { get }
    
    func hitTest(point: CGPoint) -> Bool
}
