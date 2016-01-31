//: Playground - noun: a place where people can play

import Cocoa
import QuartzCore
import XCPlayground
var str = "Hello, playground"


// Build these targets manually for OS X if import is failing
import RxSwift
import RxCocoa

class ResultView: NSView {
    let renderer = TwoDimensionalRenderer()
    
    let image: NSImage
    
    override init(frame frameRect: NSRect) {
        let image = NSImage(size: frameRect.size)
        self.image = image
        
        super.init(frame: frameRect)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) { [weak self] in
            for y in 0 ..< Int(Constants.outputSize.height) {
                image.lockFocusFlipped(true)
                for x in 0 ..< Int(Constants.outputSize.width) {
                    let context = NSGraphicsContext.currentContext()?.CGContext
                    let point = CGPointMake(CGFloat(x), CGFloat(y))
                    
                    self?.renderer.colorForPoint(point).set()
                    CGContextFillRect(context, CGRectMake(point.x,point.y,1,1));
                }
                image.unlockFocus()
                
                self?.setNeedsDisplayInRect(frameRect)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(dirtyRect: NSRect) {
        image.drawInRect(dirtyRect)
        super.drawRect(dirtyRect)
    }
}



let view = ResultView(frame: NSRect(x: 0, y: 0, width: Constants.outputSize.width, height: Constants.outputSize.height))

XCPlaygroundPage.currentPage.liveView = view

