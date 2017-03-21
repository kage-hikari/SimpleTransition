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
public func easeInSine (t: Float, b: Float, c: Float, d: Float) -> Float {
	return -c * cos(t / d * (Float(M_PI) / 2)) + c + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutSine (t: Float, b: Float, c: Float, d: Float) -> Float {
	return c * sin(t / d * (Float(M_PI / 2))) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeInOutSine (t: Float, b: Float, c: Float, d: Float) -> Float {
	return -c / 2 * (cos(Float(M_PI) * t / d) - 1) + b
}

/**
:param: t current time
:param: b begInnIng value
:param: c change In value
:param: d duration
:returns: current value
*/
public func easeOutInSine (t: Float, b: Float, c: Float, d: Float) -> Float {
	if t < d / 2 {
		return easeOutSine(t: t * 2, b: b, c: c / 2, d: d)
	} else {
		return easeInSine(t: (t * 2) - d, b: b + c / 2, c: c / 2, d: d)
	}
}
