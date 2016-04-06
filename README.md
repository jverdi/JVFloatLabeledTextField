JVFloatLabeledTextField
=======================
[![Build Status](https://travis-ci.org/jverdi/JVFloatLabeledTextField.svg?branch=master)](https://travis-ci.org/jverdi/JVFloatLabeledTextField)
[![Pod Version](https://img.shields.io/cocoapods/v/JVFloatLabeledTextField.svg)](http://cocoadocs.org/docsets/JVFloatLabeledTextField/)
[![Pod Platform](https://img.shields.io/cocoapods/p/JVFloatLabeledTextField.svg)](http://cocoadocs.org/docsets/JVFloatLabeledTextField/)
[![Pod License](https://img.shields.io/cocoapods/l/JVFloatLabeledTextField.svg)](http://jaredverdi.mit-license.org)

`JVFloatLabeledTextField` is the first implementation a UX pattern that has come to be known the **"Float Label Pattern"**. 

Due to space constraints on mobile devices, it is common to rely solely on placeholders as a means to label fields.
This presents a UX problem, in that, once the user begins to fill out a form, no labels are present.

This UI component library, which includes both a `UITextField` and `UITextView` subclass, aims to improve the user experience by having placeholders transition into floating labels that hover above the fields after they are populated with text.

Credits for the concept to Matt D. Smith ([@mds](https://twitter.com/mds)), and his [original design](https://dribbble.com/shots/1254439--GIF-Mobile-Form-Interaction?list=users):

![Matt D. Smith's Design](http://dribbble.s3.amazonaws.com/users/6410/screenshots/1254439/form-animation-_gif_.gif)


The component is officially supported for iOS 7 and greater.


Getting started via CocoaPods
=============================
```
sudo gem install cocoapods
```

Create a ```Podfile``` in your project directory:
```
pod init
```

Add the following to your ```Podfile``` project's target:
```
pod 'JVFloatLabeledTextField'
```

Then run CocoaPods with ```pod install```.

Finally, include ```JVFloatLabeledTextField.h``` and ```JVFloatLabeledTextView.h``` in your project.


Getting started via Carthage
============================
```
brew update
brew install carthage
```

Create a ```Cartfile``` in your project directory that contains:
```
github "jverdi/JVFloatLabeledTextField"
```

Then run carthage with ```carthage update``` and add ```JVFloatLabeledText.framework``` to your project from the ```Carthage/Build/iOS``` directory.

Finally, include ```JVFloatLabeledText.h``` in your project:
```
#import <JVFloatLabeledText/JVFloatLabeledText.h>
```


Additional References
=======================
[How the Float Label Pattern Started](http://mds.is/float-label-pattern/) - Matt D. Smith  
[Float Label Pattern](http://bradfrost.com/blog/post/float-label-pattern/) - Brad Frost  
[Material Design - Floating Labels](http://www.google.com/design/spec/components/text-fields.html#text-fields-floating-labels) - Google  

Ports and Alternate Implementations
=====================================
[Android](https://github.com/wrapp/floatlabelededittext) - Henrik Sandström  
[Android](https://github.com/weddingparty/AndroidFloatLabel) - Kaushik Gopal  
[Android](https://github.com/KevinJ90825/FloatLabelPattern) - Kevin Johnson  
[Xamarin.iOS](https://github.com/gshackles/FloatLabeledEntry) - Greg Shackles  
[Xamarin.Android](https://github.com/Johan-dutoit/JVFloatSharp) - Johan du Toit  
[CSS](http://snook.ca/archives/html_and_css/floated-label-pattern-css) Jonathan Snook  
[JQuery / Zepto.js](https://github.com/maman/JVFloat.js) - Achmad Mahardi  
[JQuery](https://github.com/m10l/FloatLabel.js) - Mike Mitchell  
[AngularJS](https://github.com/dmackerman/angular-better-placeholders) - Dave Ackerman  
[Bootstrap plugin](https://github.com/fauxparse/bootstrap-floating-labels) - Matt Powell  
[JavaFX](https://github.com/andytill/floaty-field) - Andy Till  
[Swift](https://github.com/dirkfabisch/B68FloatingLabelTextField) - Dirk Fabisch  
[Swift](https://github.com/FahimF/FloatLabelFields) - Fahim Farook  
[Swift](https://github.com/kNeerajPro/CGFLoatingUIKit) - Neeraj Kumar  
[Swift](https://github.com/varshylmobile/VMFloatLabel) - Jimmy Jose  
[Swift](https://github.com/Skyscanner/SkyFloatingLabelTextField) - Skyscanner (Daniel Langh, Gergely Orosz, Raimon Lapuente)  
[ObjC](https://github.com/ArtSabintsev/UIFloatLabelTextField) - Arthur Ariel Sabintsev  
[ObjC](https://github.com/iwasrobbed/RPFloatingPlaceholders) - Rob Phillips  
[4D](http://forums.4d.fr/Post/EN/15995553/0/0/) - Maurice Inzirillo  
[Appcelerator Titanium](https://github.com/TheSmiths-Widgets/ts.floatlabelfield) - The Smiths  
[B4i](https://www.b4x.com/android/forum/threads/floatlabelededittext-iui8.64096/#post-405516) - Erel Uziel  
  
  
Added a port? Let me know - [@jverdi](https://twitter.com/jverdi)
