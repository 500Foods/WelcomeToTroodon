# Notifications

Keeping tabs on an ongoing print is critically important. Stuff happens. And when it does, you want to catch it before little problems turn into big problems. Directly monitoring prints is not what we want to do most of the time though.
It can often be time-consuming and anxiety-inducing. Instead, let the printer do the hard work and send out notifications when something has happened. 

There are quite a few options here. And some depend on whether you're using other systems like Obico or Home Assistant as part of your overall environment. Let's first get a list of things we want to know about and then see how we might get notified.

- Print Status - What's it doing? What's it supposed to be doing?
- Temperatures - There are many temp sensors. Are they all within the expected range?
- CPU/MCU - Is the CPU overworked? Connection Issues? Network Issues?
- Disk Space - Klipper needs room to work. Does it have what it needs?
- Times - How much time is left? How much time has elapsed?
- Milestones - Is it time for more maintenance?

Generally speaking, what we're after here is reducing the number of surprises as we go about our day. Running out of disk space is a rare occurrence, for example, but when it happens it creates problems that might not immediately point to that as the underlying cause. 
So doing a bit of work to set up such a notification can save running into that kind of problem. Likewise, being reminded that you've crossed a 500 Print Hour boundary might be just the little nudge you need to look over a few less common things. Tighten a few belts. 
That sort of thing.

#
Next: [Between Every Print](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_m/every_print.md)
