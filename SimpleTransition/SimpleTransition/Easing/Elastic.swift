//  Reference resource:
//  http://www.robertpenner.com/easing/
//
//  License:
//  http://www.robertpenner.com/easing_terms_of_use.html

import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInElastic (t: Float, b: Float, c: Float, d: Float) -> Float {
	var t = t
	var a: Float? = nil
	var p: Float? = nil
	if t == 0 { return b }
	t = t / d
	if t == 1 { return b + c }
	if p == nil { p = d * 0.3 }
	var s: Float
	if a == nil || a < abs( c ) {
		a = c
		s = p! / 4
	} else {
		s = p! / (2 * Float(M_PI)) * asin(c / a!)
	}
	t = t - 1
	return -(a! * pow(2, 10 * t) * sin((t * d - s) * (2 * Float(M_PI)) / p!)) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutElastic (t: Float, b: Float, c: Float, d: Float) -> Float {
	var t = t
	var a: Float? = nil
	var p: Float? = nil
	if t == 0 { return b }
	t = t / d
	if t == 1 { return b + c }
	if p == nil { p = d * 0.3 }
	var s: Float
	if a == nil || a < abs(c) {
		a = c
		s = p! / 4
	} else {
		s = p! / (2 * Float(M_PI)) * asin(c/a!)
	}
	return a! * pow(2, -10 * t) * sin((t * d - s) * (2 * Float(M_PI)) / p!) + c + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutElastic (t: Float, b: Float, c: Float, d: Float) -> Float {
	var t = t
	var a: Float? = nil
	var p: Float? = nil
	if t == 0 { return b }
	t = t / d * 2
	if t == 2 { return b + c }
	if p == nil { p = d * (0.3 * 1.5) }
	if a == nil { a = 0 }

	var s: Float
	if a == nil || a < abs(c) {
		a = c
		s = p! / 4
	} else {
		s = p! / (2 * Float(M_PI)) * asin(c/a!)
	}

	if t < 1 {
		t = t - 1
		return -0.5 * (a! * pow(2, 10 * t) * sin((t * d - s) * (2 * Float( M_PI )) / p!)) + b
	} else {
		t = t - 1
		return a! * pow(2, -10 * t) * sin((t * d - s) * (2 * Float( M_PI )) / p! ) * 0.5 + c + b
	}
}
