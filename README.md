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
* Make kill counters look reasonable when added to a pre-existing game
* Make kill counters persistent across restarts by writing to file
* Make kill counters reset on player death

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