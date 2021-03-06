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
public func easeInCubic (t: Float, b: Float, c: Float, d: Float) -> Float {
	let t: Float = t / d
	return c * pow(t, 3) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutCubic (t: Float, b: Float, c: Float, d: Float) -> Float {
	let t: Float = t / d - 1
	return c * (pow(t, 3) + 1) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutCubic (t: Float, b: Float, c: Float, d: Float) -> Float {
	var t: Float = t / d * 2
	if t < 1 {
		return c / 2 * t * t * t + b
	} else {
		t = t - 2
		return c / 2 * ( t * t * t + 2 ) + b
	}
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutInCubic (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t < d / 2 {
		return easeOutCubic(t: t * 2, b: b, c: c / 2, d: d)
	} else {
		return easeInCubic(t: (t * 2) - d, b: b + c / 2, c: c / 2, d: d)
	}
}
