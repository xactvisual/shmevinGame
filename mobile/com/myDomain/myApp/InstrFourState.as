﻿
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
	import flash.media.Sound;
		var mySound:Sound = new Click(); 
			backFourBtn.addEventListener(MouseEvent.CLICK,onBackFourBtnClick);
			
			nextThreeBtn.addEventListener(MouseEvent.CLICK,onNextThreeBtnClick);
			mySound.play();
		private function onNextThreeBtnClick(evt:MouseEvent) {
			mySound.play();
			//call public state changing method in parent
			main.changeState("menu");
		}
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up Instructions 4 state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, onBackFourBtnClick);
			this.removeEventListener(Event.ENTER_FRAME, onNextThreeBtnClick);
		}
		