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
public func easeInExpo (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t == 0 {
		return b
	} else {
		return c * pow(2, 10 * (t / d - 1)) + b - c * 0.001
	}
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutExpo (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t == d {
		return b + c
	} else {
		return c * 1.001 * (-pow(2, -10 * t / d) + 1) + b
	}
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutExpo (var t: Float, b: Float, c: Float, d: Float) -> Float {
	if t == 0 { return b }
	if t == d { return b + c }
	t = t / d * 2
	if t < 1 {
		return c / 2 * pow(2, 10 * (t - 1)) + b - c * 0.0005
	} else {
		t = t - 1
		return c / 2 * 1.0005 * (-pow(2, -10 * t) + 2) + b
	}
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutInExpo (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t < d / 2 {
		return easeOutExpo(t * 2, b: b, c: c / 2, d: d)
	} else {
		return easeInExpo((t * 2) - d, b: b + c / 2, c: c / 2, d: d)
	}
}