# Introduction 
ALTris is a Tetris clone for Microsoft Dynamics 365 Business Central.
It was developed for BC14 (aka 2019 spring release), but will also work on later versions.

# Author
Gert Lynge
SIMTEQ A/S, www.simteq.com
gl@simteq.com
+45 3124 2879

# Inspiration for timers, controls and sound:
* https://www.hougaard.com/blast-from-the-past-first-game-in-financials/
* https://www.hougaard.com/video-add-dynamically-html-rendering-to-business-central/
* http://www.peterzentner.com/2018/07/19/dynamics-365-business-central-how-to-use-timers-in-al/
* https://www.w3schools.com/jsref/event_onkeydown.asp
* https://odino.org/emit-a-beeping-sound-with-javascript/

# Design goals:
- As few objects as possible (easy installation / renumbering)
  (I'm aware this is not the right way <tm>. This is NOT for developer training :-) )
- AL logic, minimizing CSS/HTML/JavaScript (after all the challenge is doing this in AL)
- Playable