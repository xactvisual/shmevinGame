﻿
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
	import flash.media.Sound;
		var mySound:Sound = new Click(); 
			nextTwoBtn.addEventListener(MouseEvent.CLICK,onNextTwoBtnClick);

			mySound.play();
		
		private function onNextTwoBtnClick(evt:MouseEvent) {
			mySound.play();
			//call public state changing method in parent
			main.changeState("instructionsFour");
		}
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up Instructions 3 state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, onBackThreeBtnClick);
			this.removeEventListener(Event.ENTER_FRAME, onNextTwoBtnClick);
		}