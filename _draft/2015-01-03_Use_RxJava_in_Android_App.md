---
  title: Use Reactive in Android app
  layout: default
  tag: Android, RxJava, Reactive Programming
  author:
    name: Ao Zhu
    url: http://zhuao.me
  summary: What's reactive programming, why Android need it, How to apply it, 
    
---

We know that FRP (Functional Reactive programming) is introduced in .Net extension. Netflix involved this framework for our Java programmer.

###What's FRP

###What issue does it resolve

#####Reactive vs Java Future vs Callback
'Heavy' request is 

#####Reactive vs Observer pattern
* The ability for the producer to signal to the consumer that there is no more data available.
* The ability for the producer to signal to the consumer that an error has occurred.

###When should we apply to Android App



#####How to use observable
filtering, selecting, transforming, combining and composing Observable's.
Methods in Observable

 1. create method
 	from(), just(), empty()
 2. composition method
 	map(), flatMap(), scan()
 3. comsumption method
 	buffer(), window(), groupBy(), skip(), take(), elementAt(), first()
 	
###Error Handling

###execution on thread
1. All observable are cancelled after no subscriber
2. 



 