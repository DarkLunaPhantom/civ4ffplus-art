Final Frontier Plus Art Assets
------------------------------

This repo contains the art assets for the Final Frontier Plus project.

Why are they in version control? Perhaps they shouldn't be, but I don't know
of a better way to organize them.

Building:
---------

For best results, you should use Firaxis's PakBuild (or another program which
knows how to create Civ4-style FPK files).

You can find PakBuild here: http://forums.civfanatics.com/showthread.php?t=136023
And a tutorial on it here: http://forums.civfanatics.com/showthread.php?t=297865

Building - With AutoPak!
------------------------

Because the above workflow is a little sad, and because the PakBuild.exe tool
supports command line options for building, I wrote a little script that I
called "AutoPak". (autopak.vbs). It's included.

To build, just run it. You need to be on Windows; it's in VBScript because that
seemed better than Python for something that was going to be Windows-only anyway.

AutoPak downloads PakBuild from CFC (so it doesn't need redistribution) and
invokes it using the right command line options to fpk up everything in the
current directory. The output file is FFPak0.fpk by default; for the art in
this repository I recommend renaming the file to FFPak1.fpk.

License:
--------

Final Frontier Plus is as "open source" as a mod of a proprietary video game
can get. In a nutshell that means you are welcome to use any assets (code,
art, etc.) created by Final Frontier Plus contributors in other Civilization
IV mods (or elsewhere, should you really want to).

Firaxis and 2K own Civilization 4.

"Final Frontier" is a scenario created by Jon Shafer for Civilization IV:
Beyond the Sword when he was employed by Firaxis Games.

"Final Frontier Plus" is an unofficial modification built by TC01 and God-Emperor, 
among other contributors (Please see the CREDITS.txt file in the main repo). 

None of the above parties are liable for any damages caused by any part of
Final Frontier Plus.
