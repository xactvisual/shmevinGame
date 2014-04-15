﻿
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	package  com.myDomain.myApp{		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;
	import flash.media.Sound;		public class InstrTwoState extends MovieClip {		//property declarations go here...				//declare reference to main document class (aka the "parent")		var main:MovieClip;
		var mySound:Sound = new Click(); 				public function InstrTwoState() {			// constructor code						//initialize after this state has been added to the display list			this.addEventListener(Event.ADDED_TO_STAGE,init);					}		private function init(evt:Event):void{			trace("Instructions State 2 Initialized!");						//any setup and/or functionality code starts here...						//cast main/parent as a MovieClip			main = MovieClip(this.parent);						//Note: buttons must be present in first frame of menu timeline for this to work!			backTwoBtn.addEventListener(MouseEvent.CLICK,onBackTwoBtnClick);			//Note: buttons must be present in first frame of menu timeline for this to work!
			nextBtn.addEventListener(MouseEvent.CLICK,onNextBtnClick);		}				private function onBackTwoBtnClick(evt:MouseEvent) {
			mySound.play();			//call public state changing method in parent			main.changeState("instructions");		}
		
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
		}			}}