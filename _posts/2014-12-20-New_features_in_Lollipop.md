---
  title: Introduce the Material design and Lollipop changes
  layout: default
  tag: Android, Lollipop
  author:
    name: Ao Zhu
    url: http://zhuao.me
  summary: Quick introduction for new feature of Lollipop, and share the experience for applying material theme to your exsited app.
    
---

As we know Android Lollipop has been released, and google already push Lollipop to upgrade.
I listed following top 10 changes, and will take more time to introduce the Materail design. From Lollipop, Google started to release his own design theory, and don't need to be considered as following up iOS design.

###Top 10 changes on Lollipop

1. Material Design

	It's inspired by the study of paper and ink. It means all content is displayed in material blocks.

2. Enhanced Notification - Changed design,  Add notification to lock screen, and Support heads-up notification.

	It's redesigned with Material to support more size device, Enhance the display in security, Extend the stage to use it (Add heads-up notification).

3. WebView update - Unbundled from system, Support Access camera and microphone.

	It will be more easy to write web app. Web app support control the hardware by native.

4. Project Volta - Add API to understand power consumption

	Push develop and user to notice the power consumption before batter life is still the bottle neck of improving performance.	
5. ART - Support 64-bit
	
	Improved the Android device performance.

6. Concurrent documents on Overview - Support to display multi-task in one app to recents screen

	It's not history any more. It's work thread now.

7. Android work - Unified personal & work use

	Prepared for enterprise user now. Also a way to support parental control.

8. Advanced Camera capabilities

	It's a good update to chase up iOS.
9. Game development

	No comments on this. Since I don't have any experience in game developement.
10. Wireless & Connectivity - Support app to scan network, Enhance BLE support

	Hopefully one day we could use our Android device to control all devices of smart home. More control on network may help app know the env of user.

Also we shouldn't ignore there are almost 5000 API added or changed. Since most API change is added, so upgrade our app to support Lollipop won't spend much work except Web application and applicaon with NDK.

###Material Design

All my introduction on this is from [offical site](http://www.google.com/design/spec/material-design/introduction.html). I still proposal to read offical site if you have time.

#####What's Material?

I'm a dev, so I couldn't tell you too much design theory, and the history of it. I only can tell you how to understand it in an user way, and how to implements it in dev way.

I already tell you at the beginning the Material design is display all content in material blocks . That's all for user.

For dev, Material means there is Z-axis for all views. By default Material blocks' thickness is 1dp, content without thickness.

#####How does Material design think?
1. Material casts shadows.
2. Content is displayed on material, and the bound and the shape of material can limit the display of content.
3. Material is solid. 

	That means:
		a. Input events cannot pass through material. 
		b. Views cannot occupy the same point in space simultaneously. They should in different elevation.
		c. Material cannot pass through other material.
4. Material can change shape.
5. Material grows and shrinks along only its plane.
6. Material never bends or folds.
7. Sheets of material can join together to become a single sheet of material.
8. Material can be generated or destroyed anywhere in the environment.
9. Material can move along any axis.
10. User interaction will change the Z-axis value.
11. Material is located in one elevation

#####How to apply Material theme to app?
The following are steps to upgrade your existed theme to Material. Partically content from android blog [artical](http://feedproxy.google.com/~r/blogspot/hsDu/~3/8iCLAdk1Z2c/implementing-material-design-in-your.html)

1. Upgrade support-v4 to v7 support libraries.

		compile 'com.android.support:appcompat-v7:21.0.2'
	
2. Change you current theme to `Theme.AppCompat`

		Changed
		<style name="AppTheme" parent="android:style/Theme.Holo.Light.DarkActionBar">
		to
		<style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
		
	Absolutelly you will met a bunch of style issues. Please skip the step if you didn't use this component in you app.
3. Change you activity to extend android.support.v7.app.ActionBarActivity instead of FragmentActivity.
	
	At the same time, need to change to call getSupporActionBar instead of getActionBar().
	
4. Update navigation bar to three lines arrow. 

		a. Change import 'android.support.v4.app.ActionBarDrawerToggle'to import 'android.support.v7.app.ActionBarDrawerToggle'
		b. Add mDrawerToggle.setDrawerIndicatorEnabled(true) to display indicator of actionbar
	If you app allowed, it would be better to change actionbar to toolbar.
5. Change minWith of toolbar to keep humberge width as before.

Now you will get latest theme, such as you will see activity come up from bottom, EditText is simplified to a line, and so on. But it's not a real Material theme. Since you havn't redesign your app to be Material. One simple thing your can do to change you app to real thema. Tha's add Z-axis and elevation property for your view.







 







