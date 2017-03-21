//
//  EasyTransition.swift
//  EasyTransition
//
//  Created by hideyuki machida on 2015/08/10.
//  Copyright © 2015年 machidahideyuki. All rights reserved.
//
//  Reference resource:
//  http://www.robertpenner.com/easing/
//
//  License:
//  http://www.robertpenner.com/easing_terms_of_use.html


import Foundation

// MARK: - Transition
open class Transition: NSObject {

	fileprivate let _easeFunc: (_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float
	fileprivate let _updateFunc: (_ value: Float) -> Void
	fileprivate let _completeFunc: ((_ value: Float) -> Void)?

	fileprivate var _et: Double = 0
	fileprivate var _currentT: Float = 0
	fileprivate let _d: Float
	fileprivate let _b: Float
	fileprivate let _c: Float
	fileprivate var _delayTimer: Timer?
	fileprivate var _timer: Timer?

	/**
	initialize Tween
	
	:param: time
	:param: before
	:param: after
	:param: easeFunc
	:param: updateFunc
	*/
	public init(time: Float, before: Float, after: Float, easeFunc: @escaping (_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float,  updateFunc: @escaping (_ value: Float) -> Void, completeFunc: ((_ value: Float) -> Void)? = nil) {

		self._easeFunc = easeFunc
		self._updateFunc = updateFunc
		self._completeFunc = completeFunc

		self._d = time
		self._b = before
		self._c = after - before

		super.init()
	}

	/**
	class deinit
	*/
	deinit {
		print( "deinit" )
		self._timer = nil
	}

	/**
	transition start or resume
	*/
	open func start(_ delay: Float = 0.0) {
		self.stop()
		self._delayTimer = Timer.scheduledTimer(timeInterval: TimeInterval(delay), target: self, selector: #selector(Transition.onCompleteDelay(_:)), userInfo: nil, repeats: false)
	}

	/**

	*/
	func onCompleteDelay( _ timer: Timer ){
		self._et = Date().timeIntervalSince1970 + Double(self._d - self._currentT)
		self._timer = Timer.scheduledTimer(timeInterval: 0.016, target: self, selector: #selector(Transition.onUpdate(_:)), userInfo: nil, repeats: true)
	}
	
	/**
	transition stop
	*/
	open func stop() {
		if self._timer?.isValid == true {
			self._timer?.invalidate()
			self._timer = nil
		}
		if self._delayTimer?.isValid == true {
			self._delayTimer?.invalidate()
			self._delayTimer = nil
		}
	}

	/**
	timer updateHandler
	*/
	open func onUpdate( _ timer: Timer ){
		let ct: Double = Date().timeIntervalSince1970
		var t: Float = self._d - Float(self._et - ct)
		var isCompleted: Bool = false
		if t >= self._d {
			t = self._d
			self.stop()
			isCompleted = true
		}

		self._currentT = t
		let value: Float = self._easeFunc(t, self._b, self._c, self._d)
		self._updateFunc(value)
		if isCompleted == true && self._completeFunc != nil {
			self._completeFunc!(value)
		}
	}
	
}

// MARK: - Easin
public enum Easing: String {
	case easeLinear = "easeLinear"
	case easeInQuad = "easeInQuad"
	case easeOutQuad = "easeOutQuad"
	case easeInOutQuad = "easeInOutQuad"
	case easeOutInQuad = "easeOutInQuad"
	case easeInCubic = "easeInCubic"
	case easeOutCubic = "easeOutCubic"
	case easeInOutCubic = "easeInOutCubic"
	case easeOutInCubic = "easeOutInCubic"
	case easeInQuart = "easeInQuart"
	case easeOutQuart = "easeOutQuart"
	case easeInOutQuart = "easeInOutQuart"
	case easeOutInQuart = "easeOutInQuart"
	case easeInQuint = "easeInQuint"
	case easeOutQuint = "easeOutQuint"
	case easeInOutQuint = "easeInOutQuint"
	case easeOutInQuint = "easeOutInQuint"
	case easeInSine = "easeInSine"
	case easeOutSine = "easeOutSine"
	case easeInOutSine = "easeInOutSine"
	case easeOutInSine = "easeOutInSine"
	case easeInExpo = "easeInExpo"
	case easeOutExpo = "easeOutExpo"
	case easeInOutExpo = "easeInOutExpo"
	case easeOutInExpo = "easeOutInExpo"
	case easeInCirc = "easeInCirc"
	case easeOutCirc = "easeOutCirc"
	case easeInOutCirc = "easeInOutCirc"
	case easeOutInCirc = "easeOutInCirc"
	case easeInElastic = "easeInElastic"
	case easeOutElastic = "easeOutElastic"
	case easeInOutElastic = "easeInOutElastic"
	case easeInBack = "easeInBack"
	case easeOutBack = "easeOutBack"
	case easeInOutBack = "easeInOutBack"
	case easeInBounce = "easeInBounce"
	case easeOutBounce = "easeOutBounce"
	case easeInOutBounce = "easeInOutBounce"
	case easeOutInBounce = "easeOutInBounce"
}

// MARK: - create

/**
create TransitionObject

:param: time( sec )
:param: before value
:param: after value
:param: easing function
:param: update function(closure)
:param: complete function(closure)
:returns: Transition instance
*/
public func create (
		time: Float,
		before: Float,
		after: Float,
		easing: Easing,
		update: @escaping (_ value: Float) -> Void,
		complete: @escaping (_ value: Float) -> Void
	) -> Transition {
		
	let easingFunc: (_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float = _getEasingFunc(easing)
	return Transition(time: time, before: before, after: after,  easeFunc: easingFunc, updateFunc: update, completeFunc: complete)
}

/**
create TransitionObject

:param: time( sec )
:param: before value
:param: after value
:param: update function(closure)
:param: complete function(closure)
:returns: Transition instance
*/
public func create (
		time: Float,
		before: Float,
		after: Float,
		update: @escaping (_ value: Float) -> Void,
		complete: @escaping (_ value: Float) -> Void
	) -> Transition {
		
	let easingFunc: (_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float = _getEasingFunc(.easeLinear)
	return Transition(time: time, before: before, after: after, easeFunc: easingFunc, updateFunc: update, completeFunc: complete)
}

/**
create TransitionObject

:param: time( sec )
:param: before value
:param: after value
:param: easing function
:param: update function(closure)
:returns: Transition instance
*/
public func create (
		time: Float,
		before: Float,
		after: Float,
		easing: Easing,
		update: @escaping (_ value: Float) -> Void
	) -> Transition {
		
	let easingFunc: (_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float = _getEasingFunc(easing)
	return Transition(time: time, before: before, after: after, easeFunc: easingFunc, updateFunc: update)
}

/**
create TransitionObject

:param: time( sec )
:param: before value
:param: after value
:param: update function(closure)
:returns: Transition instance
*/
public func create (
		time: Float,
		before: Float,
		after: Float,
		update: @escaping (_ value: Float) -> Void
	) -> Transition {
		
	let easingFunc: (_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float = _getEasingFunc(.easeLinear)
	return Transition(time: time, before: before, after: after, easeFunc: easingFunc, updateFunc: update)
}


/**
:param: easing
:returns: easeingFunc
*/
private func _getEasingFunc(_ easing: Easing) -> (_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
	var easingFunc: ((_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float)?
	switch(easing) {
		case Easing.easeLinear: easingFunc = easeLinear
		case Easing.easeInQuad: easingFunc = easeInQuad
		case Easing.easeOutQuad: easingFunc = easeOutQuad
		case Easing.easeInOutQuad: easingFunc = easeInOutQuad
		case Easing.easeOutInQuad: easingFunc = easeOutInQuad
		case Easing.easeInCubic: easingFunc = easeInCubic
		case Easing.easeOutCubic: easingFunc = easeOutCubic
		case Easing.easeInOutCubic: easingFunc = easeInOutCubic
		case Easing.easeOutInCubic: easingFunc = easeOutInCubic
		case Easing.easeInQuart: easingFunc = easeInQuart
		case Easing.easeOutQuart: easingFunc = easeOutQuart
		case Easing.easeInOutQuart: easingFunc = easeInOutQuart
		case Easing.easeOutInQuart: easingFunc = easeOutInQuart
		case Easing.easeInQuint: easingFunc = easeInQuint
		case Easing.easeOutQuint: easingFunc = easeOutQuint
		case Easing.easeInOutQuint: easingFunc = easeInOutQuint
		case Easing.easeOutInQuint: easingFunc = easeOutInQuint
		case Easing.easeInSine: easingFunc = easeInSine
		case Easing.easeOutSine: easingFunc = easeOutSine
		case Easing.easeInOutSine: easingFunc = easeInOutSine
		case Easing.easeOutInSine: easingFunc = easeOutInSine
		case Easing.easeInExpo: easingFunc = easeInExpo
		case Easing.easeOutExpo: easingFunc = easeOutExpo
		case Easing.easeInOutExpo: easingFunc = easeInOutExpo
		case Easing.easeOutInExpo: easingFunc = easeOutInExpo
		case Easing.easeInCirc: easingFunc = easeInCirc
		case Easing.easeOutCirc: easingFunc = easeOutCirc
		case Easing.easeInOutCirc: easingFunc = easeInOutCirc
		case Easing.easeOutInCirc: easingFunc = easeOutInCirc
		case Easing.easeInElastic: easingFunc = easeInElastic
		case Easing.easeOutElastic: easingFunc = easeOutElastic
		case Easing.easeInOutElastic: easingFunc = easeInOutElastic
		case Easing.easeInBack: easingFunc = easeInBack
		case Easing.easeOutBack: easingFunc = easeOutBack
		case Easing.easeInOutBack: easingFunc = easeInOutBack
		case Easing.easeInBounce: easingFunc = easeInBounce
		case Easing.easeOutBounce: easingFunc = easeOutBounce
		case Easing.easeInOutBounce: easingFunc = easeInOutBounce
		case Easing.easeOutInBounce: easingFunc = easeOutInBounce
	}
	return easingFunc!
}

