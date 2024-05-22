## 🔨 TAP Upgrades

TAP comes configured by default on Troodon printers. This is a mechanism incorporated into the print head that uses the nozzle of the print head directly to determine the relative height of the bed surface. This is used primarily in quad-gantry-levelling (QGL), where it taps the four corners. 
It is also used in bed mesh levelling, where it touches an array of points across the print surface to determine its shape. This information is then used to build up a model to help ensure that the filament is laid down consistently, no matter the condition of the build surface.

Some prefer to replace this mechanism entirely, particularly as new sensors that measure eddy currents have become available. These measure considerably more points to build a more accurate mesh, and do so in much less time and without physically touching the bed. We'll cover those in [this section](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/tap_alternatives.md). 

As the default TAP mechanism is made of plastic which can easily deform or become brittle over time, or even break. Given the nature of what this part does, it is perhaps more prone to damage than most. An obvious improvement is to replace it with a metal CNC part. Several such designs are readily available, with the [Vitalii3D CNC TAP](https://www.etsy.com/listing/1446827040/metal-tap-for-voron-cnc-voron-tap?variation0=3734336828) being a particular favorite. As is often the case, a variation without the name "Vitalii3D" can be found on AliExpress. 
Generally, searching for "Voron CNC Mount" is likely to turn up any number of similar products.

- [Etsy](https://www.etsy.com/listing/1446827040/metal-tap-for-voron-cnc-voron-tap?variation0=3734336828)
- [AliExpress](https://www.aliexpress.us/item/1005006097272960.html)
- [Amazon](https://a.co/d/a0ghedN)
- [KB-3D](https://kb-3d.com/store/voron/1001-vitalii-cnc-tap-kit-for-voron-1698614457953.html)

Variations of this product can be found from multiple vendors with a broad range of prices and delivery charges. Would likely be good to support Vitalii directly on Etsy. Other options might be straight-up knock-offs or something else entirely.

Other products include an entire replacement for TAP if some part of it has become damaged. One popular alternative is the Chaotic Lab TAP product, also available from multiple vendors.

- [Chaotic Lab - Voron TAP](https://www.chaoticlab.com/products/cnc-voron-tap)
- [West3D - Chaotic Lab Voron TAP](https://west3d.com/products/chaoticlab-cnc-voron-tap-complete?variant=44231531397332)

There are a few videos around that compare various TAP options. Here's [one](https://www.youtube.com/watch?v=bg1VPMuCgWk).

## Installing Vitalii TAP 
As far as complexity goes, this ranks as a little more involved, given that the print head has to be taken off and the main XY belts disconnected. Which does take some time. And it has to be assembled, requiring a few 3D-printed parts that need heat-set inserts. So a little bit of prep work ahead of time is needed.
