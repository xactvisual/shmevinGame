  
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
package  com.myDomain.myApp{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	
	public class ExtraState extends MovieClip {
		//property declarations go here...
		
		//declare reference to main document class (aka the "parent")
		var main:MovieClip;
		var mySound:Sound = new Click(); 
		
		public function ExtraState() {
			// constructor code
			
			//initialize after this state has been added to the display list
			this.addEventListener(Event.ADDED_TO_STAGE,init);
			
		}
		private function init(evt:Event):void{
			trace("Extra State Initialized!");
			
			//any setup and/or functionality code starts here...
			
			//cast main/parent as a MovieClip
			main = MovieClip(this.parent);
			
			//Note: buttons must be present in first frame of menu timeline for this to work!
			extrasBackBtn.addEventListener(MouseEvent.CLICK,onExtrasBackBtnClick);
		}
		
		private function onExtrasBackBtnClick(evt:MouseEvent) {
			mySound.play();
			//call public state changing method in parent
			main.changeState("menu");
		}
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up extra state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, onExtrasBackBtnClick);
		}
		
	}
}