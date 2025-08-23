# fadiiir

16 channel configurable CC fader bank style iii script for Monome Grids

## [User Manual](/manual.md)

## Prerequisites

* Python 3.11
* A One or Zero grid with >=[250114](https://github.com/monome/iii/releases/tag/250114) or newer iii firmware.
  
*iii [Grid Compatibility](https://github.com/monome/iii?tab=readme-ov-file#compatibility) varies*

Follow `diii` install steps from the [monome iii repo](https://github.com/monome/iii?tab=readme-ov-file#diii)

## How to Install

1. Run `diii` from your commandline of choice
2. Run `^^c` to clear the currently installed script !This step is important, there is a bug causing issues flashing without a clear first!
3. Run `u fadiiir.lua` to upload the script

## Slider Controls

Bottom and top button: jump straight to the top or bottom position
Middle buttons: progressively slower slews towards the target position
Pressing the middle two buttons at the same time: jump straight to the middle position

## Ideas

* Layers
  * Faders
  * Configure
  * Sequencer?
* Assignable MIDI CCs per fader
* Assignable MIDI channel per fader
* Assignable MIDI value range per fader
* MIDI clock sync'd sequencer?
* Grid Zeros show two layers the same time
* Need to find a better way to detect toggling layers on Grid One
