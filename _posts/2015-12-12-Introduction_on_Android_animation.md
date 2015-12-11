---
  title: Understand Android Animation
  layout: post
  categories: Android, Understan Android
  author: Ao Zhu
  summary: Understand Android Animation
    
---

我们知道电影是在一秒内通过播放至少24张图片完成视觉上的物体移动变化的。那同样的在Android的动画实现上，需要做的事情就是定义帧及其播放的时序。


### Property Animation

	Modifying view property value by animator

### View Animation
	Tween Animation: 通过 Animation 定义单张图片的移动轨迹
.

	Frame Animation: 通过 AnimationDrawable 定义帧动画


###Animation使用场景
#####Activity Animation
Android为Activity和Fragment的切换提供了转场动画.

Define its animation in style

	<style name="App.Theme" parent="Theme.AppCompat.NoActionBar">
        <item name="android:windowAnimationStyle">@style/activityAnimation</item>
    </style>

    <style name="activityAnimation" parent="android:Animation.Activity">
        <item name="android:activityOpenEnterAnimation">@anim/slide_in_right</item>
        <item name="android:activityOpenExitAnimation">@anim/slide_out_left</item>
        <item name="android:activityCloseEnterAnimation">@anim/slide_in_left</item>
        <item name="android:activityCloseExitAnimation">@anim/slide_out_right</item>
    </style>
    
Define its animation in code

	//Enter and exist Animation when start
	ActivityOptionsCompat animation = ActivityOptionsCompat.makeCustomAnimation(
	context, android.R.anim.slide_in_left, android.R.anim.slide_out_right);
    context.startActivity(destinationIntent, animation.toBundle());
    
    //Exit and enter Animation when finish
    //Called in Activity
    overridePendingTransition(R.anim.abc_slide_in_top, R.anim.abc_slide_out_bottom);
    
#####Fragment Animation

1. Define animation for support fragment

		FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
        fragmentTransaction.setCustomAnimations(R.anim.fragment_slide_down, 0, 0, R.anim.fragment_slide_up);
        
    OR
        
        public class BaseFragment extends Fragment {
			@Override
	    	public Animation onCreateAnimation(int transit, boolean enter, int nextAnim) {

    		}
		}

2. Define animator for fragment
	
		FragmentTransaction fT = getFragmentManager().beginTransaction();
        fT.setCustomAnimations(R.animator.fade_in, R.animator.fade_in, 0, 0)
       
    OR
       
		public class BaseFragment extends Fragment {
			@Override
	    	public Animator onCreateAnimator(int transit, boolean enter, int nextAnim) {

    		}
		}
	

*Note: Animator do `NOT` support translateX/translateY*

#####Layout Animation

Define in XML

	//In layout res
	android:layoutAnimation="@anim/layout_animation_slide"
	
	//layout_animation_slide.xml
	<layoutAnimation xmlns:android="http://schemas.android.com/apk/res/android"
        android:delay="30%"
        android:animationOrder="reverse"
        android:animation="@anim/slide_right" />

Define in code        
	
	layoutView.setLayoutAnimation(AnimationUtils.loadLayoutAnimation(this, R.anim.layout_animation_slide));
*Note: It's called only first time when laied out. scheduleLayoutAnimation() will restart it*

#####View Animation

	spaceshipImage.startAnimation(hyperspaceJumpAnimation);

#####Scene Animation

	// Create the scenes with same rootView and same element id
	mStartScene = Scene.getSceneForLayout(mSceneRoot, R.layout.a_scene, this);
	mEndScene =
    Scene.getSceneForLayout(mSceneRoot, R.layout.another_scene, this);
    
    //Play the transition to switch between these two scenes
    TransitionManager.go(mEndingScene, new Fade());
    
Define transition without scene
	
	// Start recording changes to the view hierarchy
	TransitionManager.beginDelayedTransition(mRootView, new Fade());

	// Add the new TextView to the view hierarchy
	mRootView.addView(mLabelText);

	// When the system redraws the screen to show this update,
	// the framework will animate the addition as a fade in

#####Shared element Animation

1. Enable window content transitions in your theme.
	
		getWindow().requestFeature(Window.FEATURE_CONTENT_TRANSITIONS);	
	OR

		//theme.xml
		<item name="android:windowContentTransitions">true</item>
	
	
2. Specify a shared elements transition in your style.

		<item name="android:windowSharedElementEnterTransition">
	    @transition/change_image_transform</item>
	    <item name="android:windowSharedElementExitTransition">
	    @transition/change_image_transform</item>
	
3. Define your transition as an XML resource.

	
4. Assign a common name to the shared elements in both layouts with the android:transitionName attribute.
	
		View.setTransitionName()
	
	OR
		
		<Button
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:transitionName="robot"/>
5. Use the ActivityOptions.makeSceneTransitionAnimation() method.
    
		ActivityOptions options = ActivityOptions
            .makeSceneTransitionAnimation(this, sharedView, "robot");
        // start the new activity
	    startActivity(intent, options.toBundle());

###Explaination on different object

####Animator <a name="animator"></a>

Resource loation `R.animator.object_animator`

Resource to define animator

	<set  android:ordering=["together" | "sequentially"]>

    <objectAnimator
        android:propertyName="string"
        android:duration="int"
        android:valueFrom="float | int | color"
        android:valueTo="float | int | color"
        android:startOffset="int"
        android:repeatCount="int"
        android:repeatMode=["repeat" | "reverse"]
        android:valueType=["intType" | "floatType"]/>

    <animator
        android:duration="int"
        android:valueFrom="float | int | color"
        android:valueTo="float | int | color"
        android:startOffset="int"
        android:repeatCount="int"
        android:repeatMode=["repeat" | "reverse"]
        android:valueType=["intType" | "floatType"]/>

    <set>
        ...
    </set>
	</set>


Code to play [animator](#animator)

	AnimatorSet set = (AnimatorSet) AnimatorInflater.loadAnimator(myContext,
    R.anim.property_animator);
    set.setTarget(myObject);
    set.start();
    
    
####Animation

Resource location `R.anim.animation`

Resource to define animation

	<?xml version="1.0" encoding="utf-8"?>
	<set xmlns:android="http://schemas.android.com/apk/res/android"
    android:interpolator="@[package:]anim/interpolator_resource"
    android:shareInterpolator=["true" | "false"] >
    <alpha
        android:fromAlpha="float"
        android:toAlpha="float" />
    <scale
        android:fromXScale="float"
        android:toXScale="float"
        android:fromYScale="float"
        android:toYScale="float"
        android:pivotX="float"
        android:pivotY="float" />
    <translate
        android:fromXDelta="float"
        android:toXDelta="float"
        android:fromYDelta="float"
        android:toYDelta="float" />
    <rotate
        android:fromDegrees="float"
        android:toDegrees="float"
        android:pivotX="float"
        android:pivotY="float" />
    <set>
        ...
    </set>
	</set>
	
	
####AnimationDrawable

Resource location `R.drawable.file`

Resource to define AnimationDrawable

	<?xml version="1.0" encoding="utf-8"?>
	<animation-list xmlns:android="http://schemas.android.com/apk/res/android"
    android:oneshot=["true" | "false"] >
    <item
        android:drawable="@[package:]drawable/drawable_resource_name"
        android:duration="integer" />
	</animation-list>