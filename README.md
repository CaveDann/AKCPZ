# AKCPZ
Additional Kill Counters Mod for Project Zomboid

## To Do List
* Test git push (Done)
* Get intial directory structure intact (Done)
* Start some lua (Done)
* Get a window to generate (Done)
* Add some text to the window (Done)
* Build a complex string (Done)
* Make kill counters increment (Done)
* Make kill counters look reasonable when added to a pre-existing game (Done)
* Make kill counters write to file (Done)
* Make kill counters persistent across restarts by reading from file (Done)
* Fix nil nil nil on new game (Done)
* Make kill counters reset on player death (No work needed)
* Fix weird counting on early kills for game + 1 issue (Partial)
* Fix window height (Done)
* Make counters update every hour to ensure they're in sync
* Make AKCDataFile.txt generate zeros if not present

## Comments
* Fix nil nil nil on new game
  * The variables needed to be set to 0 outside of a function, not just used inside a function. 
  * It looks like, on creating a new game, all functions are called which resets the file to 0 0 0. 
  * Hence, when variables had not been set outside a function, it would write them as nil nil nil, then read them in on starting the game. 
  
* Make counters reset on new game
  * Appears game does this without me making any modifications to the code.

## Open Questions
* Can we add a diff element to 'catch up' when a zombie vehicle kill fails to trigger an OnZombieDeath event?
  * Yes, we did this in AKCUpdate, by comparing the value of gk from the last time AKCUpdate was called (ogk) with the value from the current call (ngk). We are able to increment tk even when gk doesn't update (i.e. Fire Kills).

* Does a zombie always trigger OnZombieDeath from fire?
  * Tested from molotov source - seems so
  * Tested from zombie ground source - seems so
  * Tested from grass ground source - seems so
  * Tested from zombie bump - seems so (though unclear if actually from bump or from ground source created by zombie group)
  * Tested hitting zombie before fire - seems so
  * Tested hitting zombie whilst on fire - seems so
  * None of the above have indicated the counter doesn't work properly
  
* How do we fix nil nil nil?
  * The file is being created and filled with nil, nil, nil before the game finished loading. Pretty odd. 
  * This is true whether AKCFile.readData is called or not. 
  * We have confirmed that the file is showing as present on starting a new game. I.e., the if statement that checks for the file is working correctly. 
  * Perhaps the next step to try is create the file with the mod, start it with 0, 0, 0, so that unless it's already written to it, it will start fresh. 
    * However, then you'd also need to check that it still works well when added to an existing game.
  * You've commented out a bunch of stuff, stripped it down to not using the Test, and it still happens. So maybe it occurs somewhere in the Read. If not happening in the Read, then it happens as part of starting a game?
    * Can we prevent the use of the Read in the draw, and check if the file still becomes populated with nils? I.e., comment out line 13 in AKCStart.lua, so that it isn't used at all. Then launch the game and start a new game. If the file becomes populated with nils then it's either due to something in the game, or something in the way AKCStart.readData is working, or in the way it's being checked by the game before finishing loading. Odd that it works well when the game has written the file though. 
    * Perhaps another alternative to try is to get the game to check for the file, and if it isn't there, write the file to be filled with zeros. Perhaps the game has to have written the file itself to be able to read it properly. You could do another AKCPrepData function to facilitate this. 
    
* Can we update the kills every in-game hour so that they're out of sync for less time?
