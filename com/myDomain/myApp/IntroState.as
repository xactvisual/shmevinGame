
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	package  com.myDomain.myApp{	import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;
	import flash.media.Sound;	public class IntroState extends MovieClip {		//property declarations go here...		//declare reference to main document class (aka the "parent")		var main:MovieClip;
		var mySound:Sound = new Click(); 		public function IntroState() {			// constructor code			//initialize after this state has been added to the display list			this.addEventListener(Event.ADDED_TO_STAGE,init);		}		private function init(evt:Event):void {			//clean up redundant listener?			this.addEventListener(Event.ADDED_TO_STAGE,init);
			trace("Instructions State Initialized!");			//any setup and/or functionality code starts here...			//cast main/parent as a MovieClip			main = MovieClip(this.parent);			//listen for intro to reach its last frame			this.addEventListener(Event.ENTER_FRAME, listenForIntroOver);			//Note: skip button must be present in first frame of intro timeline for this to work!			skipBtn.addEventListener(MouseEvent.CLICK,onSkipIntroBtnClick);		}		private function listenForIntroOver(evt:Event):void {			if (this.currentFrame >= this.totalFrames) {				//call public state changing method in parent				main.changeState("menu");				//clean up enterframe listener (uses up resources)				this.removeEventListener(Event.ENTER_FRAME, listenForIntroOver);			}		}		private function onSkipIntroBtnClick(evt:MouseEvent):void {
			mySound.play();			//call public state changing method in parent			main.changeState("menu");		}
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up intro state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, listenForIntroOver);
		}
			}}