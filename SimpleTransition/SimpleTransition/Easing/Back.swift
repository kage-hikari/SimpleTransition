//  Reference resource:
//  http://www.robertpenner.com/easing/
//
//  License:
//  http://www.robertpenner.com/easing_terms_of_use.html

import Foundation

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInBack (t: Float, b: Float, c: Float, d: Float) -> Float {
	var t = t
	var s: Float? = nil
	if s == nil { s = 1.70158 }
	t = t / d
	return c * t * t * ((s! + 1 ) * t - s!) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutBack (t: Float, b: Float, c: Float, d: Float) -> Float {
	var t = t
	var s: Float? = nil
	if s == nil { s = 1.70158 }
	t = t / d - 1
	return c * (t * t * ((s! + 1) * t + s!) + 1) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutBack (t: Float, b: Float, c: Float, d: Float) -> Float {
	var t = t
	var s: Float? = nil
	if s == nil { s = 1.70158 }
	s = s! * 1.525
	t = t / d * 2
	if t < 1 {
		return c / 2 * (t * t * ((s! + 1) * t - s!)) + b
	} else {
		t = t - 2
		return c / 2 * (t * t * ((s! + 1) * t + s!) + 2) + b
	}
}
