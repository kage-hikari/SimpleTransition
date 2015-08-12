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
public func easeInCirc (var t: Float, b: Float, c: Float, d: Float) -> Float {
	t = t / d
	return (-c * (sqrt( 1 - pow(t, 2)) - 1) + b)
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutCirc (var t: Float, b: Float, c: Float, d: Float) -> Float {
	t = t / d - 1
	return (c * sqrt(1 - pow(t, 2)) + b)
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutCirc (var t: Float, b: Float, c: Float, d: Float) -> Float {
	t = t / d * 2
	if t < 1 {
		return -c / 2 * (sqrt( 1 - t * t) - 1) + b
	} else {
		t = t - 2
		return c / 2 * (sqrt( 1 - t * t) + 1) + b
	}
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutInCirc (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t < d / 2 {
		return easeOutCirc(t * 2, b: b, c: c / 2, d: d)
	} else {
		return easeInCirc(( t * 2 ) - d, b: b + c / 2, c: c / 2, d: d)
	}
}
