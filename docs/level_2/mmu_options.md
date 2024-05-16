# Multi-material and Multi-color Options
Being able to change filaments mid-print is a substantial upgrade over a typical stock 3D printer. There are printers designed with this kind of capability at the outset. IDEX printers have two extruders, for example. or the Prusa XL has a tool changer that allows you to change toolheads on the fly, supporting up to five different tools. But MMUs like the kinds we're showcasing here typically support even more filaments.

- Ability to continue printing automatically with the same filament using a new spool when an old spool has run out. This can save time, particularly if it runs out when you're not available to do the swap yourself. Ensures that you use up the entire roll and don't end up starting a fresh role just to avoid having to do the swap mid-print.
- Printing supports using a different filament. With complex prints, supports can be added to make crazy overhangs possible, but removing them can sometimes be problematic as they can sometimes become fixed to the part, requiring extra post-processing to remove them. If the support is a different material entirely, like a water-soluble material for example, the print can just be rinsed off and the supports melt away. Super-helpful if the support material is in hard-to-access areas like cavities and that kind of thing.
- Multiple colors. Naturally, being able to print in multiple colors means that prints can come out in a more complete state, with less of a need for painting or other finishing work.
- Multiple materials in one part. Perhaps you're printing a tire of some kind and you'd like the tread to be in black TPU but the rim to be in white high-temp PLA or something. This generally works best when the materials have the same printing temperatures and similar warpage and shrinkage characteristics that enable the materials to fuse together seamlessly.

Generally, the approach is to have a mechanism that multiple filaments are fed into. The mechanism then takes care of selecting a filament to feed into the printer using its default feed mechanism. This means that these MMUs will work equally well with nearly any printer that can automatically load and unload filament. 

There is also typically a need for a filament cutter somewhere in the filament path, as an unloaded filament has a tip shape that makes it very difficult to feed back into the printer again. 

Most of the examples here have been designed to support a customizable number of inputs, making it easy to size them to your particular needs. Depending on how your filament sources are arranged, and the type of printer you have, these can be mounted directly on top of the printer or somewhere close by. For the most part, these are simple to use and aren't terribly expensive. Some can be built from scratch (kits are available) and others can be set up straight out of the box.

- 🔨 [ERCF](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/ercf.md) - Connects multiple filaments, based largely on the original VORON MMU design
- 🔨 [TradRack](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/tradrack.md) - Connects multiple filaments, similar to ERCF with a 4different design
- 🔨 [8-Track](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/8track.md) - Connects a set of custom filament dry boxes (cassettes), each with their own extruder
- 🔨 [Bambu Labs' AMS](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/ams.md) - If you have a Bambu printer, an AMS or AMS Lite is also an easy option

Next: [Toppers](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/toppers.md)
