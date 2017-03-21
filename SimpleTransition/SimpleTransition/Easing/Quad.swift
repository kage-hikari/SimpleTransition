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
public func easeInQuad (t: Float, b: Float, c: Float, d: Float) -> Float {
	let t: Float = t / d
	return c * pow(t, 2) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutQuad (t: Float, b: Float, c: Float, d: Float) -> Float {
	let t: Float = t / d
	return -c * t * (t - 2) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutQuad (t: Float, b: Float, c: Float, d: Float) -> Float {
	let t: Float = t / d * 2
	if t < 1 {
		return c / 2 * pow(t, 2) + b
	}
	return -c / 2 * ((t - 1) * (t - 3) - 1) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutInQuad (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t < d / 2 {
		return easeOutQuad(t: t * 2, b: b, c: c / 2, d: d)
	}
	return easeInQuad(t: (t * 2) - d, b: b + c / 2, c: c / 2, d: d)
}
