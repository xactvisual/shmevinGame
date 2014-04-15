  
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
package  com.myDomain.myApp{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	
	public class OptionState extends MovieClip {
		//property declarations go here...
		
		//declare reference to main document class (aka the "parent")
		var main:MovieClip;
		var mySound:Sound = new Click(); 
		
		public function OptionState() {
			// constructor code
			
			//initialize after this state has been added to the display list
			this.addEventListener(Event.ADDED_TO_STAGE,init);
			
		}
		private function init(evt:Event):void{
			trace("Option State Initialized!");
			
			//any setup and/or functionality code starts here...
			
			//cast main/parent as a MovieClip
			main = MovieClip(this.parent);
			
			//Note: buttons must be present in first frame of menu timeline for this to work!
			optionsBackBtn.addEventListener(MouseEvent.CLICK,onOptionsBackBtnClick);
		}
		
		private function onOptionsBackBtnClick(evt:MouseEvent) {
			mySound.play();
			//call public state changing method in parent
			main.changeState("pause");
		}
		
		//all state classes should have a public cleanup function to clear memory and maintain performance!
		public function clean():void{
			trace("Cleaning up Options state!");
			//remove objects and set them to null for garbage collection
			
			//remove event listeners
			this.removeEventListener(Event.ENTER_FRAME, onOptionsBackBtnClick);
		}
		
	}
}