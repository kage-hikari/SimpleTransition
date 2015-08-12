//: Playground - noun: a place where people can play

import UIKit
import SimpleTransition
import XCPlayground


////////////////////////////////////////////////////////////////////////
// simple
var a: Float = 0
SimpleTransition.create(time: 1, before: a, after: 100, update: { (value) -> Void in
	a = value
	print(a)
}) { (value) -> Void in
	print(value)
}.start()

var b: Float = 0
SimpleTransition.create( time: 1, before: b, after: 100, easiong: .easeInOutElastic ) { ( value: Float ) -> Void in
	b = value
	print(b)
}.start()

var c: Float = 0
SimpleTransition.create( time: 1, before: b, after: 100, easiong: .easeInOutBack ) { ( value: Float ) -> Void in
	c = value
	print(c)
}.start()


////////////////////////////////////////////////////////////////////////
// animation
let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
let item01: UIView = UIView(frame: CGRect(x: 10, y: 20, width: 10, height: 10))
item01.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
view.addSubview(item01)
let item02: UIView = UIView(frame: CGRect(x: 10, y: 50, width: 10, height: 10))
item02.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
view.addSubview(item02)
let item03: UIView = UIView(frame: CGRect(x: 10, y: 80, width: 10, height: 10))
item03.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
view.addSubview(item03)


SimpleTransition.create( time: 3, before: Float( item01.frame.origin.x ), after: 150, easiong: .easeOutElastic ) { ( value: Float ) -> Void in
	item01.frame.origin.x = CGFloat( value )
}.start()
SimpleTransition.create( time: 3, before: Float( item02.frame.origin.x ), after: 150, easiong: .easeOutBack ) { ( value: Float ) -> Void in
	item02.frame.origin.x = CGFloat( value )
}.start()
SimpleTransition.create( time: 3, before: Float( item03.frame.origin.x ), after: 150, easiong: .easeInOutElastic ) { ( value: Float ) -> Void in
	item03.frame.origin.x = CGFloat( value )
}.start()


let label01: UILabel = UILabel(frame: CGRect(x: 50, y: 110, width: 200, height: 20))
label01.textAlignment = NSTextAlignment.Center
view.addSubview( label01 )
SimpleTransition.create( time: 3, before: 0, after: 1000 ) { ( value: Float ) -> Void in
	label01.text = String( Int( value ) )
}.start()

let label02: UILabel = UILabel(frame: CGRect(x: 50, y: 140, width: 200, height: 20))
label02.textAlignment = NSTextAlignment.Center
view.addSubview( label02 )
SimpleTransition.create( time: 3, before: 65, after: 90, easiong: .easeInOutElastic ) { ( value: Float ) -> Void in
	label02.text = String( Character(UnicodeScalar(Int(value))))
}.start()
SimpleTransition.easeOutInSine(10, b: 0, c: 100, d: 100)

XCPShowView("view", view: view)
XCPSetExecutionShouldContinueIndefinitely()
