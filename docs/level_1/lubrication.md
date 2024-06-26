# Lubricate Rails
Current 3D printers, like the Troodon 2.0 Pro, are constructed with a number of linear rails. This allows the toolhead to move smoothly and quickly along each axis. 
Inside the linear rail block is a set of steel ball bearings that run along the steel rail - metal on metal. Over time, these can wear unevenly, resulting in poor performance that can directly impact print quality. 
In order to lubricate these rails, [syringes](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_1/syringes.md) are used to inject [grease](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_1/grease.md) into the service ports on the blocks.

Inside a Troodon 2.0 Pro printer:
- For the MGN9 rails (the vertical Z rails and the rails on the left and right) 16G needles are used.
- For the MGN12 rail (the gantry rail supporting the toolhead), an 18G needle is used.
- There's also an MGN9 rail for TAP embedded inside the toolhead that should be lubricated.

***NOTE: As of this writing, the Troodon 2.0 Pro printer ships with none of the rails lubricated. They include lubricant in the box, but not the syringes.***

To lubricate a block, inject the grease with a syringe directly into the service port. This can take a bit of force as the needles may be very thin compared to the grease being injected. 
Enough grease should be injected to fill the block to the point where it can be seen being pushed outside of the block.

Ideally, this should be done before the printer is assembled when the service ports are easily accessible. After assembly, this can be considerably more challenging. Some, like the TAP rail, require some disassembly before the service port can be accessed.

NOTE: In the YouTube video, there is a comment about applying grease to the rails directly in case the service port is inaccessible. 
While this may work for some linear rail blocks, in many cases the block has wipers to prevent contamination. 
These can prevent the grease outside the block from entering inside the block, and therefore this might not be very effective at all. 

## Resources
- [Misumi: Installation and Maintenance of Linear Guides](https://us.misumi-ec.com/pdf/fa/2010/p0501.pdf)
- [Hiwin: Lubricating instructions for linear guideways and ballscrews](https://www.hiwin.com/wp-content/uploads/lubricating_instructions.pdf)
- [YouTube: How to Lubricate MGN12 Linear Rails](https://www.youtube.com/watch?v=GWzz6fQiWmw)

#
Next: X/Y/Z Limits
