# Build a Trad Rack MMU
Adding a multi-material unit (or MMU) to your 3D printer can greatly expand its capabilities. 
- Print with multiple colors in the same object
- Switch to a new roll of filament automatically when one runs out
- Print with different support materials, like water-soluble supports
- Print with purge or cleaning filament regularly with less effort

But MMUs aren't all that common, aside from perhaps the AMS line of products that have been created specifically for Bambu Labs' printers. 
This is because they're not the simplest mechanisms to setup or operate and they come with a host of potential problems. 
MMUs can sometimes be as complex as the printer itself. And even Bambu Labs' AMS products come with a long list of limitations and additional considerations.

There are a number of more generic MMUs available for 3D printers. The Enraged Rabbit Carrot Feeder, or [ERCF](https://github.com/Enraged-Rabbit-Community/ERCF_v2), is a popular choice. [Trad Rack](https://github.com/Annex-Engineering/TradRack) is another in a similar vein, albeit a bit simpler in its design.

In this HOWTO, we're going to go through the steps of building a Trad Rack using a kit and some self-printed parts, with the goal of producing a 14-lane MMU that works well with a Troodon 2.0 Pro printer. This style of MMU would work equally well with nearly any modern Klipper-based printer, so if you fall in that category, there should be plenty of material here that you'll find helpful as well.

## Contents
Step 1: Ordering a Kit<br/>
Step 2: Printing Parts<br/>
Step 3: Getting Started<br/>
Step 4: Basic Assembly<br/>
Step 5: Wiring<br/>
Step 6: Software<br/>
Step 7: Initial Testing<br/>
Step 8: Tuning<br/>
Step 9: Mounting Options<br/>
Step 10: Filament Buffering<br/>
Step 11: Filament Management<br/>
Step 12: Where to put it all<br/>
Step 13: Sample Prints<br/>

## Step 1: Ordering a Kit
There are Trad Rack kits available from a handful of typical 3D printer vendors, but AliExpress works just as well. `Set A` gets us the parts we need.
Other kit variations may leave out some of the encoder hardware. Or may include additional hardware to support filament buffers such as ERCF's Carrot Patch, for example.
We'll address the filament buffer in a different manner, so we don't need those parts.<br/>
https://www.aliexpress.com/item/1005006702643127.html

![image](https://github.com/user-attachments/assets/ce957c75-ac17-4630-a92f-1cfcc4b9e621)

Depending on where you are in the world, deliveries from AliExpress may take anywhere from a few days to a few weeks. 

## Step 2: Printing Parts
While waiting for the kit to arrive, there's a bit of prep work that can be done - printing the parts that we'll need to build the Trad Rack. The kit doesn't include any of the printed parts.
Overall, there are about 250g worth of parts to print. 

<img width=500 src=https://github.com/user-attachments/assets/b3b51cba-8cbd-4f61-a3e1-78cec443b6da>

As far as what to print, the collection of STL files can be found here:
https://github.com/Annex-Engineering/TradRack/blob/main/STLs/README.md

There are variations depending on what parts come in the kit that you use. For the AliExpress kit, it comes with these parts.
- MGN9 Linear rail with C Carriage
- 2GT 20T Pulley 9mm width with 5mm bore
- 10x10 cable chain with a two-hole mounting pattern

Parts can also be printed in contrasting colors, and they are marked as such in the list of STL files. Depending on how you plan on mounting the Trad Rack, there may also be different legs that you can use. 
Here's what the parts look like when organized a little bit.

<img width=500 src=https://github.com/user-attachments/assets/9ced5fc9-aca3-4e71-9cd3-0eabc40fac75>

## Step #3: Getting Started
Once the kit arrives, work can begin in earnest. It arrives in a tidy little box, deceptively hiding what lurks within.






