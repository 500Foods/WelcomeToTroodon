# ABS / ASA
TBD.

Brainstorming...
- Need heated bed
- Need enclosure
- Need active carbon filter
- Be aware of VOCs
- Higher chamber temperature is better
- Bed adhesive
    
- Each layer shrinks as it cools
- Higher layers cool more quickly than lower layers closer to the heated build plate
- This can cause corners of object to lift off of build plate, causing warping
- This can cause parts to get knocked off build plate entirely
- Fixing adhesion not the only problem - parts can lift the build plate off of aluminum base plate
- Part design can have a big impact on how cooling relates to adhesion and warping
- Solid parts are more of a problem, whereas gaps lessen the forces being applied
- Print monitoring applicable here - watching for parts that have been knocked out of position
  
Bed adhesion is a big challenge getting started, and for bigger objects, the challenge grows exponentially, particularly for anything that has even a small amount of shrinkage like ABS/ASA. Here are a few things to think about.

- Bed temp of maybe 110C for the first layer, then 105C. Or mabye 105C and then 100C. The idea, a suggestion I'd credit to <@769630188266455080> if I recall, is that the slight amount of cooling causes the first layer to constrict a little bit, giving better adhesion.
- Bed adhesive. I avoided it like the plague initially. Not really sure why, just thought it wasn't necessary. But now I use it all the time. People will swear by their adhesive of choice, but various types of purple glue or Magigoo are popular. The image I posted earlier was using Layerneer Bedweld which is all I've ever used and works great.
- If you do get things to stick to the bed, sometimes getting them unstuck is the problem. Bed adhesives usually work best when applied to a cooler bed, and generally release when the temps drop back down as well. Sometimes requires a bit of patience!
- Large objects tend to get unstuck more easily because the upper layers are further from the bed so they're cooler. This causes them to shrink more, which often presents as corners pulling up off the bed. 
- To help mitigate a bit more, having the chamber as hot as possible is ideal particularly for ABS/ASA. Much less of an issue for PLA/PETG which don't even benefit much from the enclosure.
- Heating up the chamber ahead of time (aka heat soaking) can help with this, ensuring everything is nice and toasty before printing even starts. There are macros that can help with this (one recently posted by <@741282031673147412> for example) or you can just run that PRINT_START macro with whatever temps you want, and come back in 20-30 minutes, that sort of thing.
- This uneven cooling and lifting off the bed also causes a fun problem where the print head can collide with the part, knocking it off entirely. When printing lots of smaller parts, that's where that [exclude_object] thing comes in - when something gets knocked out of place, you can remove it from the print and take it off the bed, and everything else will still tick along.
- There are settings within Orca that can also change the path that the toolhead moves when moving from one object to another (avoiding walls?) so that the risk of such collisions is lessened.
