FBLogin
=======

Problem 1:
Navigations are on all pages, but I don't need it in the first page.

The 1st facebook login page has no navigational controllers, I don't know what I'm doing wrong. The navigation controllers only seem to be on the facebook login page instead of the feed page. 
I know I should be doing 

    self.window.rootViewController = tabBarController;

but it seems with the navigation controllers, this is needed? But then this turns into the rootcontroller view?

    self.window.rootViewController = tabBarController;
    


Problem 2:
My CGRecMake for moving the screen elements up when the keyboard moves up is not moving back to the origin?

The shift up is correct, but I don't know how to make them return to their original positions.


Problem 3:
I'm not sure about the logic for alerts?

I set up my alert so it appers when you tap the login button. However, I don't know how to hook it to the text fields.
My assumption is...the alert is a else if statement? If the text fields are not populated with @"blank@gmail.com" then the alert appears.
I tried doing that but it screwed up the code completely so I'm not sure if there's another way of doing it.


https://raw.githubusercontent.com/diannasu/FBLogin/master/FBLoginV1.gif
https://raw.githubusercontent.com/diannasu/FBLogin/master/FBLoginV1b.gif
