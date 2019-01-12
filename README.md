# VIPER

VIPER is a reduction for View, Interactor, Presenter, Entity, and Route. I'll try to explain how it works.
 
![Alt text](https://www.objc.io/images/issue-13/2014-06-07-viper-wireframe-76305b6d.png?raw=true "VIPER")
 
When the User wants to see some information on the screen, the View sends a request to the Presenter, "Presenter I want to show some information list to the user, could you help me?", the Presenter answer, "Wait for a minute". So the Presenter asks for help to Interactor,  "Mr. Interactor could you help me. The View wants some information", the Interactor answer. "Wait for a minute", so the Interactor answer, "I have this information, take it", so the Presenter gets the information and sends to the View and the View show to User. The Router just shows new Views.

That is a simple explanation, 
if you have some doubt or desire talk to me, please send me an email, 
I'll be happy to answer: asfcarvalho@me.com
