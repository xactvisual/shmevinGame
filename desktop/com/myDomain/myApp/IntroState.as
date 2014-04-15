﻿
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
	import flash.media.Sound;
		var mySound:Sound = new Click(); 
			trace("Instructions State Initialized!");
			mySound.play();
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up intro state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, listenForIntroOver);
		}
		