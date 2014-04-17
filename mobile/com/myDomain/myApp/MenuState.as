
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	package  com.myDomain.myApp{		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;
	import flash.media.Sound;

		public class MenuState extends MovieClip {		//property declarations go here...				//declare reference to main document class (aka the "parent")		var main:MovieClip;
		var mySound:Sound = new Click(); 
		public function MenuState() {			// constructor code
			//initialize after this state has been added to the display list			this.addEventListener(Event.ADDED_TO_STAGE,init);					}		private function init(evt:Event):void{			trace("Menu State Initialized!");						//any setup and/or functionality code starts here...						//cast main/parent as a MovieClip			main = MovieClip(this.parent);						//Note: buttons must be present in first frame of menu timeline for this to work!			introBtn.addEventListener(MouseEvent.CLICK,onIntroBtnClick);			startBtn.addEventListener(MouseEvent.CLICK,onStartBtnClick);
			startBtn2.addEventListener(MouseEvent.CLICK,onStartBtn2Click);			intstrBtn.addEventListener(MouseEvent.CLICK,onInstructionsBtnClick);			extrasBtn.addEventListener(MouseEvent.CLICK,onExtrasBtnClick);		}				private function onIntroBtnClick(evt:MouseEvent) {
			 mySound.play();			//call public state changing method in parent			main.changeState("intro");		}				private function onInstructionsBtnClick(evt:MouseEvent) {
			mySound.play();			//call public state changing method in parent			main.changeState("instructions");		}				private function onStartBtnClick(evt:MouseEvent):void {
			mySound.play();			//call public state changing method in parent			main.changeState("app");					}
		private function onExtrasBtnClick(evt:MouseEvent):void {
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
		}	}}