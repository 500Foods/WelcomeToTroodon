The toolhead of typical modern 3D printers consists primarily of an Extruder, a HotEnd, a toolboard, and one or more part-cooling fans. The Extruder is responsible for pushing the filament into the HotEnd in highly precise movements using its motor. The HotEnd then melts this filament and deposits it on the build plate. The HotEnd typically doesn't have any moving parts in the filament's path - that's all handled by the Extruder. It does have a critically important fan that keeps the cool part of the HotEnd cool. This is different from the part cooling fan, which is responsible for cooling the filament after it has left the HotEnd. And finally, the toolboard is what coordinates everything. Toolboards can be in one or more pieces, attached to different sides of the toolhead. Sometimes they are simple, just providing wiring connections, with all of the wires connected via a cable guide to a computer not in the toolhead. Or sometimes the toolboard has its own CPU, and just power and data need to connect to the toolhead.

The pressure applied to the filament by the Extruder is used to control how much plastic is fed into and subsequently melted by the HotEnd and is a key factor in how quickly it flows out the nozzle. This flow rate is a major component of the overall performance of a 3D printer. Achieving higher flow rates is often a key optimization goal or a key criterion when selecting a printer in the first place. One of the most popular toolheads found in printers like the Troodon 2.0 Pro, Voron 2.4r2, and many others, is called the StealthBurner. This consists of a ClockWork2 extruder and an E3D V6 HotEnd, along with a simple toolboard, a single HotEnd fan, and a single part-cooling fan.

So what's in a HotEnd? Here's what an E3D HotEnd looks like. Others typically have many of the same components, but in different shapes and sizes, doing largely the same sorts of things.

![image](https://github.com/user-attachments/assets/9cc9862c-4a05-437b-ae4a-c3ed12f6f25c)
Image Credit: https://3dprinting.stackexchange.com/questions/1519/what-are-the-parts-that-make-up-a-hotend-and-what-do-they-do

## Filament guide
This is usually a piece of PTFE tubing (aka Teflon) that ensures the filament goes into the HotEnd and not elsewhere. If you're forcing filament into the Extruder and finding that it is coming out the side, this is the likely culprit. 

For a stock StealthBurner with the CW2 extruder and E3D HotEnd, the PTFE tubing should "stick up" 11mm from the top of the heat sink, and should be inserted into the heat sink all the way until it hits the top of the heat break. 

It is important that this PTFE tubing is cut cleanly and squarely. When filament is extracted, it can fill in any gaps here and clog the filament path when it cools. 

Some recommend using Capricorn PTFE tubing due to its tighter tolerances. Regardless of the PTFE tubing used, this is something to [inspect regularly](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_m/monthly.md) and proactively replace when convenient.

## Heat Sink 
This is typically a metal section with many fins, designed to dissipate any heat coming up from the heat break or the nozzle. The main goal here is to prevent "heat creep" where excess heat can melt or damage other parts of the toolhead.

Different HotEnds may use different styles of heat sinks, sometimes much bigger or smaller, or even water-cooled in some cases. Generally, if you want to change the type of heat sink, you'll need to print or purchase a replacement part for that part of the toolhead or HotEnd that you're using. For example, if you wanted to use the heat sink from a Bambu P1P in a stock Stealthburner, you'd have to print a new part for the Stealththat fits the Bambu style, like [this](https://www.printables.com/model/323196-voron-stealthburner-for-bambu-lab-x1cx1-hotend/collections).

## HotEnd Fan
Different from the part cooling fan, this fan is usually on 100% of the time, or at the very least, whenever the HotEnd is still hot. Normally, it cannot be turned off or adjusted as this is a key protection mechanism, preventing excess heat from reaching the rest of the toolhead. It is usually a smaller fan as it's job is just to maintain a constant airflow over the heat sink fins. 

In terms of upgrades, replacing this fan with one that can be monitored is a pretty good idea, as if this fan were to fail for any reason, it is likely that the resulting high temperatures would melt other parts of the HotEnd or even parts of the Extruder, resulting in extensive damage.

## Heat Break
A tube, often made from two different metals, separating the Heat Sink and Heat Block. This is used as the primary means to block heat from the heat block creeping up into the heat sink. Different HotEnds sometimes employ more exotic metals like Titanium to help improve the efficiency of the heat break. As a result, you can purchase heat breaks separately from other HotEnd components, but this is normally not required.

## Heat Block
These come in different materials, usually aluminum or ceramic, along with a huge array of sizes and shapes. The heat block is essentially a small reservoir that can melt a precise amount of filament. Once melted, any additional filament pushed into the heat block by the extruder results in the same amount of filament being pushed out the nozzle at the bottom of the heater. 

The size of this reservoir, and how well it can be maintained in a melted state as filament flows through it, is a key factor in the overall performance of the printer. For relatively normal print speeds, a small reservoir is plenty sufficient to melt incoming filament and deposit it on the build plate. As the speed increases, new filament coming into the heat block cools it and the material already in the reservoir. At some point, the flow rate is impacted as melted filament can be pushed out quickly enough to keep up with the demand.

To compensate for this, a larger reservoir, a higher-powered heater, or both, can be used.

## Heater
The heat block is passive. Cool filament is pushed into the top by the extruder, which then gets melted and pushed out the nozzle at the bottom. In between, it is just heat being applied.

The heat is supplied via a thicker pair of wires coming into the toolhead. The polarity doesn't matter. These are terminated in some fashion. Sometimes they are joined into a rod that is inserted into the heat block at a particular spot. Sometimes they are connected to a plate that is attached to the side of the heat block. Or sometimes they are embedded directly into the heat block, like in some ceramic variations. It is essentially the resistance between these wires, as well as the amount of power supplied, that produces heat. 

To give some numbers, though these can vary greatly from one HotEnd to another, a typical E3D V6 HotEnd might have a 48W heater, supplied at 24V, that can get a heat block all the way up to 300C consistently. How quickly the desired temperature can be reached, how much power can be supplied safely, and how easily the temperature can be maintained at different filament flow rates, are key elements in selecting which heater, and often which HotEnd, to use in a 3D printer.

## Thermistor
In order to maintain a specific temperature, HotEnds use one or more thermistors. What's a thermistor? Think of it as the business end of a thermometer sensor. As the end of the thermistor is heated, it generates a different voltage across its two wires which, when properly calibrated, can be used to measure the precise temperature. Like the heater, the thermistor is a pair of wires combined into a rod, typically, that is then inserted into the heat block. These wires, just like the heater wires, don't have polarity so you can't wire them in backwards.

Surprisingly uncommon in many other aspects of a 3D printer, thermistors provide actual feedback to the software running the printer (eg: Klipper). Using this data, the printer will supply more or less power to the heater wires to achieve and maintain the desired temperature. In order for this to work properly, the software needs to know precisely which thermistor type is being used. Sometimes these have names like PT100, PT1000, or NTC 3850 100K. There are differences between each type, such as their accuracy, the amount of resistance provided, the temperature/voltage curve, and so on. The type of thermistor needs to be configured properly in the printer.cfg file, curiously in the [extruder] section (there's no [hotend] section) under "sensor_type". If you've plugged in a new HotEnd with a new thermistor, and you're seeing the default temperature reported as thousands of degrees, when in reality the thermistor is at room temperature, it likely means that this value hasn't been updated correctly.

When changing a thermistor, particularly when changing a thermistor type, but even when swapping out a thermistor of the same type, it is important to run the [PID Tuning.](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_1/pid_tuning.md) calibration. This enables the software to properly determine the power supply curve that it can use to efficiently achieve the desired temperatures. 

It is also important to note that if the printer software has commanded a particular temperature from the HotEnd, it monitors the thermistor to see that this temperature is achieved. If the temperature is not achieved, or if there is any kind of variance or instability in the thermistor output on its way to achieving that temperature, Klipper sees this as a catastrophic failure and will shut everything down. This is a key safety mechanism, though it can surely be an annoying one if you're printer is operating at the very limits of its capabilities. However, in normal operation, if you're running into this kind of problem, it could be an indication that there is a loose wire, a failing thermistor, or something else that isn't working corretly. So be careful to check that the wiring has not been damaged before proceeding. 

As an example, if a print fails, there have been situations (aka the Blob of Death) where plastic goes up around the outside of the heater block rather than down onto the print surface. This can sometimes result in pulling out or damaging wires along the way. 

## Nozzle
The nozzle is largely what controls the diameter of the melted filament as it comes out of the HotEnd. Note that a nozzle of 0.4mm doesn't mean that what ends up in the printed object is going to be 0.4mm in diameter.  Several other factors, like the gap between the nozzle tip and the print surface, the flow rate, the temperature of the melted filament, the airflow generated from the part cooling fan, and the chamber temperature, all contribute to the diameter and shape of the filament that is laid down. 

Most of the drama around the nozzle relates to the first layer. The z-offset (the gap between the very tip of the nozzle and the build surface) can be adjusted so that more or less of the filament is squished into the build surface. The temperatures of everything, along with the type of surface, speed, and so on are factors in how well this works. 

When choosing a nozzle, it is first important to select a nozzle that is properly mated to the type of HotEnd (V6 nozzles for example). The type of material is also important. Brass nozzles for PLA, Stainless Steel nozzles for more abrasive filaments like ABS or ASA, and hardened steel nozzles for anything with additives like carbon fiber, glass fiber, "galaxy", "sparkle", or glow-in-the-dark filaments. The more granular the additives, the larger the nozzle diameter should be. 0.4mm is by far the most common, but if you're printing larger objects with CF, for example, 0.6mm or 0.8mm might be a better choice.

When it comes to performance, there is another category of nozzles called CHT nozzles. Rather than a simple straight-through hole, the nozzle has three different openings on the inlet side. This causes the filament to be more thoroughly mixed and melted before it is extruded, which can result in higher flow rates. But as with everything, there are trade-offs. In this case, the trade-off is that clogs are more likely to occur with abrasive filaments or with additives as they can get caught in the different chambers of the CHT. These are very popular though, as just changing the nozzle (a trivial task) can increase the overall flow rate and thus reduce print times significantly.
