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
public func easeOutBounce (var t: Float, b: Float, c: Float, d: Float) -> Float {
	t = t / d
	if t < 1 / 2.75 {
		return c * (7.5625 * t * t) + b
	} else if t < 2 / 2.75 {
		t = t - (1.5 / 2.75)
		return c * (7.5625 * t * t + 0.75) + b
	} else if t < 2.5 / 2.75 {
		t = t - (2.25 / 2.75 )
		return c * (7.5625 * t * t + 0.9375) + b
	} else {
		t = t - (2.625 / 2.75 )
		return c * (7.5625 * t * t + 0.984375) + b
	}
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInBounce (t: Float, b: Float, c: Float, d: Float) -> Float {
	return c - easeOutBounce(d - t, b: 0, c: c, d: d) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutBounce (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t < d / 2 {
		return easeInBounce(t * 2, b: 0, c: c, d: d) * 0.5 + b
	} else {
		return easeOutBounce(t * 2 - d, b: 0, c: c, d: d) * 0.5 + c * 0.5 + b
	}
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutInBounce (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t < d / 2 {
		return easeOutBounce(t * 2, b: b, c: c / 2, d: d)
	} else {
		return easeInBounce((t * 2) - d, b: b + c / 2, c: c / 2, d: d)
	}
}
