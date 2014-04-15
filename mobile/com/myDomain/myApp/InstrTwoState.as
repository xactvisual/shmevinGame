﻿
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
	import flash.media.Sound;
		var mySound:Sound = new Click(); 
			nextBtn.addEventListener(MouseEvent.CLICK,onNextBtnClick);
			mySound.play();
		
		private function onNextBtnClick(evt:MouseEvent) {
			mySound.play();
			//call public state changing method in parent
			main.changeState("instructionsThree");
		}
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up Instructions 2 state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, onBackTwoBtnClick);
			this.removeEventListener(Event.ENTER_FRAME, onNextBtnClick);
		}