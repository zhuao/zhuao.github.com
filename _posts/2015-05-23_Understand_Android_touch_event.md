---
  title: 理解Android触摸事件分发
  layout: post
  categories: Android
  author: Ao Zhu
  summary: Understand Android dispatch the touch event
    
---

1. Activity dispatch GenericMotionEvent/PopulateAccessibilityEvent/KeyEvent

GenericMotionEvent:joystick movements, mouse hovers, track pad touches, scroll wheel movements and other input events

KeyEvent: KeyEvent.Callback {
	//If you handled the event, return true.  If you want to allow the event to be handled by the next receiver, return false.
	onKeyDown;
	onKeyLongPress;
	onKeyUp;
	onKeyMultiple;
}

KeyEvent dispatch chain:
Window received -> Activity received


1. Activity -> root view -> son view
2. How to know it's on click
3. distiguist the onTouchListener, onScrollListener