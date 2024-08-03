# Drop-In HotEnd Replacements

One of the quickest and easiest ways to improve the speed and quality of your prints is to swap out the stock HotEnd for something better. Here's a [Backgrounder on Hotends](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_0/hotends.md) if you want to brush up on the various parts of a HotEnd. But why would we want to replace a HotEnd? Well, lots of reasons, actually.

- **Quicker heating.** Stock HotEnds typically have a small heat block and low-power heater which, in combination, means that it takes an eternity for the HotEnd to reach the desired temperature. This is particularly important if you print with high-temperature filaments like ABS or ASA.
- **Higher temperatures.** Most of the time, the stock HotEnd will be able to achieve and maintain a suitable temperature for at least the most common filaments, perhaps at reduced speeds. Sometimes, though, you might want to print at higher temperatures to address various issues, like higher flow rates, bed adhesion or layer adhesion issues, and so on. Having that extra bit of room at the top-end of the temperature curve is sometimes very important.
- **More Power.** The heater in a HotEnd is usually limited in its power output. Say, 48W at 24V, that sort of thing. Sometimes, more power is needed to meet whatever criteria, like higher temperatures or higher flow rates, necessitating the need to replace the HotEnd entirely, or perhaps the heater part of the HotEnd.
- **Higher flow rate.** This is often the goal - being able to print faster. As cold filament enters the heat block to be heated, it cools the heat block, so the printer supplies more power to maintain that temperature. HotEnds with larger heat blocks (a larger reservoir of melted filament) can therefore more easily maintain a supply of melted filament, and can thus provide a higher flow rate and faster print speed.

Note that these are often interconnected. Having a higher-powered heater (say 60W vs 48W) means that the heat block will reach its target temperature faster. Which also means that it can achieve a higher flow rate, even if that's not the original goal. Often the HotEnd that ships with a pre-assembled printer, or a printer kit, will be on the lower end of the scale. Better HotEnds can be purchased for anywhere from $20-$30 for a simple HotEnd to hundreds of dollars for a fancy super-high-end water-cooled HotEnd.

For our purposes here, though, we're interested in what HotEnds can be swapped in without having to fall into the trap of endlessly upgrading everything else in the toolhead to get it to work. Let's take our typical Troodon 2.0 Pro example of a stock StealthBurner with an E3D V6 HotEnd. This is a HotEnd that is rated for 40W and can reach high enough temperatures to print ABS and ASA without problems. Similar replacements are readily available.
- Amazon 🇨🇦 - [Compatible J-Head V6 24V 40W HotEnd](https://a.co/d/5WuQlDV)

But there are some limitations we need to be mindful of here.

1. The default PRINTER_START script (and the version provided [here](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/PRINT_START.md)) go through a little dance of heating up to print temperatures (say, 260C), performing a NOZZLE_CLEAN, dropping to 150C to do a Quad-Gantry-Levelling, and then heating back up to print temperatures again, all before printing anything at all. With the stock HotEnd, this can take an agonizingly long amount of time. So long that people start stripping out those parts of PRINT_START just to avoid doing them. Which isn't good as those steps are part of the script on purpose, with valid reasons behind each part of the process.
2. When printing with higher temperatures, it can similarly take a really long time to reach those temperatures.
3. When trying to print faster, this particular HotEnd is a key limiting factor in that it can only sustain something around 10mm3/s, depending on the filament used.
4. The stock Troodon has been designed to support no more than 60W heater wiring, specifically in the breakout board in the back of the printer. While it is *possible* to provide more power with stock wiring, it is not a good idea and will *very likely* result in bigger problems down the road. Like needing to replace the breakout board. Or worse.

So let's explore three options for replacing the HotEnd where we don't need to re-print any parts of the StealthBurner toolhead, and where we don't need to change any wires other than what is in the toolhead itself, and we don't need to replace any other components, while we can still continue to use the same V6 nozzles. This is by no means an exhaustive list, and if you were to lift any of those restrictions, dozens more HotEnds would also be usable. For example, just printing a new StealthBurner part would open up access to a number of Bambu HotEnds. But we have to start somewhere, right?

## Upgrade #1 - Better Heat Block
The main reason to choose this option is to get a faster heater. Relatively speaking, this heater is almost instant. And it cools faster as well, which is almost as important when doing the little PRINT_STARTUP temperature dance.

- Amazon 🇨🇦 - [CHC Ceramic 48W 24V HotEnd](https://a.co/d/j8khpfI)

To get this up and running, the main challenge is in adjusting the length of the heater wire. They're really long, far too long to just bundle up inside the toolhead. If you've got some wire crimpers and some ends to crimp, this is a trivial task. Likewise if you like soldering. Otherwise it is a bit of a nuisance to have to fiddle with the wires. Once those are dealt with, replacing the stock HotEnd with this one is really just a drop-in replacement. Everything fits where it needs to fit, and you don't need to print any custom StealthBurner parts to get it to work.

The other thing to be mindful of is that this will very likely use a different thermistor. Be sure to check the one that comes with the HotEnd as it may be different if you've used a different link or bought it at a different time. Nearly all thermistors will be supported by Klipper, so no worries there, but be sure to check that it is specified properly in the printer.cfg file.

With this HotEnd installed, you should be able to exceed the stock max flow rates without any problems, and the heating/cooling times of the HotEnd will be dramatically better. This alone makes using a Troodon Pro 2.0 a much nicer experience already.

## Upgrade #2 - Bigger Heat Block
Next, let's try another variation of the same thing, but instead, let's use a larger heat block so we can get a better flow rate. With this configuration, it should be possible to hit a target flow rate of 20mm3/s, easily double of what is possible with a stock HotEnd. There are other considerations when it comes to overall print speed, but this removes one of the key obstacles.
- Amazon 🇨🇦 - [Improved High Speed Fast Heat V6 HotEnd 24V 48W Ceramic Heater Core](https://a.co/d/0SKyygp)

As with Upgrade #1, there is still some fiddling with the heater wire to get it to the right length. As it turns out, though, the larger heat block is offset by a shorter heat sink so the nozzle tip is positioned roughly at the same spot, which means no need to print a different StealthBurner duct to direct the part-cooling fan. This, too, is a drop-in replacement with minimal effort. 

The limitation here though is that the max temperature, while stated as 300C, is likely unachievable with the 48W heater. The heater block cools too quickly 275C can be achieved (printing ASA) but realistically, 260C is the usable temperature here. Which is indeed usable, but this is what limits the flow rate to around 20 mm3/s for ASA instead of the rated 33 mm3/s that is advertised. Printing PLA at a much lower 220C-230C may be more in-line with this rating.

The other thing to be aware of is that this does take longer to heat up. Perhaps not surprising as it is a larger heat block, but it falls somewhere between the stock heater and Upgrade #1. Maybe closer to the stock heater. 

## Upgrade #3 - Bigger Heater, Better Paste
Using the same approach as #2, the heater supplied with that HotEnd was 48W. This can be directly upgraded to a 60W heater without changing the thermistor and without having to redo the wiring that was done there - just replace the heater with a different one. This addresses the high temperature limitation as well as the heating time and can easily and safely print at 275C.

- Amazon 🇺🇸 - [60W Ceramic Heater Blade](https://a.co/d/0hgVW8B)

Another consideration we've not yet touched upon relates to how heat conducts between different HotEnd elements. To increase conductivity, particularly between the heater and the heat block, but also between the thermistor and the heat block as well as between the heat break and the heater, a special thermal paste is used. Anyone who has put together a modern PC will be familiar with the thermal paste used between the CPU and the heat sinks or water blocks used in those environments. HotEnds often ship with a tiny packet of thermal paste. Tiny, but plenty enough for the size of heater being used. 

But, as with all things, there are better products that can be used, specifically those with a higher conductivity. The value we're interested in here is Watts per meter by Kelvin at 100C, or W/mK. Typical thermal paste is around 4-5 W/mK and something like Copper is around 400 W/mK. Boron Nitride seems to be a popular choice in this area, something like this. Is it worth the money? Hard to say. Certainly for one printer printing exclusively PLA, it is likely overkill and whatever comes stock is plenty sufficient.

- Amazon 🇨🇦 - [Boron Nitride Thermal Paste](https://a.co/d/9qf7KV0)

With those upgrades installed, the HotEnd should be heating up just as fast as Upgrade #1, and the top limits are similarly increased. And 30 mm3/s is possible.

## Other Considerations
The HotEnds we've covered here are intended to be drop-in replacement, so we don't need to print anything to get them up and running. This can also be critically important if your HotEnd has become damaged somehow (eg: Blob of Death) or if you've broken a heater wire or thermistor or something like that. Nothing like needing to 3D print a part to get your 3D printer working again to ruin your day. With that in mind, it is a good idea to print replacement parts in case you find yourself in such a position. Many toolheads are comprised largely of 3D printed parts, so printing up a complete replacement to have on-hand isn't a terrible idea at all.

Moving on from these, the next class of HotEnds would likely be those that require different part-cooling fan ductwork. For example, a Volcano nozzle would extend lower, where the existing ductwork would result in the part-coooling not reaching where the nozzle is. Not too difficult to handle this.

Next would be a higher-powered HotEnd. In the case of the Troodon 2.0 Pro, this would necessitate the need to run a pair of heater wires directly from the toolhead to the MCU in the electronics bay, bypassing the breakout board and its wiring entirely. This can be done realitvely easily, using 18awg wire run through the existing cable chains. This would open up the possibility of higher wattage heaters, dramatically increasing the potential for higher flow rates.

After that, another stage would involve replacing the toolbard with either a CAN bus or USB-based toolbard. This would be primarily implemented so that the cable chains could be removed from the gantry, but because the wiring is being replaced anyway, it ould give the opportunity for the upgraded wiring to support higher wattage heaters at the same time, both of which can lead to higher print speeds.

And finally, replacing the extruder is also an option. And while extruders and HotEnds can often be mixed and matched, there are often optimal pairings that work better together, or, at the very least, *look* better together. Having an extruder that is under-powered for the HotEnd that is installed means that the overall print speed will be reduced to support the slowest component. Likewise, having an overpowered extruder compared to the HotEnd will also be less than ideal.

#
Next: [TAP Upgrades](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/tap_upgrades.md)
