## Simple Easing

Xcode7 Swift2.0 iOS8.0~　OSX10.10~

Reference resource:  
[http://www.robertpenner.com/easing/](http://www.robertpenner.com/easing/)

License:  
[http://www.robertpenner.com/easing_terms_of_use.html](http://www.robertpenner.com/easing_terms_of_use.html)


### Description 
```swift 
SimpleTransition.create(
	time: time (sec),
	before: before value,
	after: after value,
	easiong: easiong function = def .easeLinear,
	update: update function(closure),
	complete: complete function(closure) = def nil
) -> Transition (Transition instance)
``` 

### Easing Function( [http://easings.net/ja](http://easings.net/ja) )
* Easing.easeLinear
* Easing.easeInQuad
* Easing.easeOutQuad
* Easing.easeInOutQuad
* Easing.easeOutInQuad
* Easing.easeInCubic
* Easing.easeOutCubic
* Easing.easeInOutCubic
* Easing.easeOutInCubic
* Easing.easeInQuart
* Easing.easeOutQuart
* Easing.easeInOutQuart
* Easing.easeOutInQuart
* Easing.easeInQuint
* Easing.easeOutQuint
* Easing.easeInOutQuint
* Easing.easeOutInQuint
* Easing.easeInSine
* Easing.easeOutSine
* Easing.easeInOutSine
* Easing.easeOutInSine
* Easing.easeInExpo
* Easing.easeOutExpo
* Easing.easeInOutExpo
* Easing.easeOutInExpo
* Easing.easeInCirc
* Easing.easeOutCirc
* Easing.easeInOutCirc
* Easing.easeOutInCirc
* Easing.easeInElastic
* Easing.easeOutElastic
* Easing.easeInOutElastic
* Easing.easeInBack
* Easing.easeOutBack
* Easing.easeInOutBack
* Easing.easeInBounce
* Easing.easeOutBounce
* Easing.easeInOutBounce
* Easing.easeOutInBounce

## Examples

```swift
import SimpleTransition

SimpleTransition.create(time: 1, before: 0, after: 100, easiong: .easeInOutElastic, update: { [weak self] (value) -> Void in
	print(value)
}) { [weak self] (value) -> Void in
	print("complete")
}.start() // start transition
``` 
```swift
import SimpleTransition

let myTransition: SimpleTransition.Transition = SimpleTransition.create(time: 1, before: 0, after: 100, easiong: .easeInOutElastic, update: { [weak self] (value) -> Void in
	print(value)
}) { [weak self] (value) -> Void in
	print("complete")
}

// start transition
myTransition.start()
``` 

```swift
import SimpleTransition

let myTransition: SimpleTransition.Transition = SimpleTransition.create(time: 1, before: 0, after: 100, easiong: .easeInOutElastic, update: { [weak self] (value) -> Void in
	print(value)
}) { [weak self] (value) -> Void in
	print("complete")
}.start()

// pause transition
myTransition.stop()

// resume transition
myTransition.start()
``` 