﻿
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
	import flash.media.Sound;

	
		var mySound:Sound = new Click(); 

			//initialize after this state has been added to the display list
			 mySound.play();
			mySound.play();
			mySound.play();
			mySound.play();
			//call public state changing method in parent
			main.changeState("extras");
			
		}		
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up Menu state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, onIntroBtnClick);
			this.removeEventListener(Event.ENTER_FRAME, onStartBtnClick);
			this.removeEventListener(Event.ENTER_FRAME, onInstructionsBtnClick);
			this.removeEventListener(Event.ENTER_FRAME, onExtrasBtnClick);
		}