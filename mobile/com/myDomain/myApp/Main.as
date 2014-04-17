	/* 	This Demo created by Orion Atkinson		for the Interactive Media Development		program at Confederation College. */	package  com.myDomain.myApp{	import flash.display.MovieClip;	import flash.events.MouseEvent;	import flash.events.Event;
	import com.greensock.TweenLite;	import com.greensock.easing.Circ;
	//import com.greensock.*; 
	//import com.greensock.easing.*;
	public class Main extends MovieClip {		//PROPERTIES		//declare app states as objects (all MovieClip extentions linked to Library MovieClip Symbols)		private var intro:MovieClip;		private var menu:MovieClip;		private var instructions:MovieClip;
		private var instructionsTwo:MovieClip;
		private var instructionsThree:MovieClip;
		private var instructionsFour:MovieClip;				private var app:MovieClip;
		private var pause:MovieClip;
		private var options:MovieClip;
		private var extras:MovieClip;
		
		public var infinite:Boolean;		//keep track of current state		private var curState:String;		public function Main() {			// constructor code			//start with intro state			intro = new IntroState();			this.addChild(intro);			curState = "intro";		}		//STATE CHANGER METHOD		//- one custom function to change to any new state 		//  (just pass it the right string value)		//- make it public so you can change states from within any of the states		public function changeState(newState:String):void {			//first remove the current state			trace("\nRemoving "+curState+" state...");			switch (curState) {				case "intro" :					this.removeChild(intro);
					//clean up and set to null for garbage collection
					intro.clean();
					intro = null;					break;				case "menu" :					this.removeChild(menu);
					//clean up and set to null for garbage collection
					menu.clean();
					menu = null;					break;				case "instructions" :					this.removeChild(instructions);
					//clean up and set to null for garbage collection
					instructions.clean();
					instructions = null;					break;
				case "instructionsTwo" :
					this.removeChild(instructionsTwo);
					//clean up and set to null for garbage collection
					instructionsTwo.clean();
					instructionsTwo = null;
					break;
				case "instructionsThree" :
					this.removeChild(instructionsThree);
					//clean up and set to null for garbage collection
					instructionsThree.clean();
					instructionsThree = null;
					break;
				case "instructionsFour" :
					this.removeChild(instructionsFour);
					//clean up and set to null for garbage collection
					instructionsFour.clean();
					instructionsFour = null;
					break;				case "app" :					this.removeChild(app);
					//clean up and set to null for garbage collection
					app.clean();
					app = null;					break;
				case "app2" :
					this.removeChild(app);
					//clean up and set to null for garbage collection
					app.clean();
					app = null;
					break;
				case "pause" :
					this.removeChild(pause);
					//clean up and set to null for garbage collection
					pause.clean();
					pause = null;
					break;
				case "options" :
					this.removeChild(options);
					//clean up and set to null for garbage collection
					options.clean();
					options = null;
					break;
				case "extras" :
					this.removeChild(extras);
					//clean up and set to null for garbage collection
					extras.clean();
					extras = null;
					break;			}			//then add the new state (constructed from MovieClips in FLA Library)			trace("Adding "+newState+" state...");			switch (newState) {				case "intro" :					intro = new IntroState();
					intro.x = stage.stageWidth;					this.addChild(intro);
					TweenLite.to(intro, 0.5, {x:0, y:0, ease:Circ.easeInOut});					break;				case "menu" :					menu = new MenuState();
					menu.x = stage.stageWidth;					this.addChild(menu);
					TweenLite.to(menu, 0.5, {x:0, y:0, ease:Circ.easeInOut});					break;				case "instructions" :
					if (curState == "instructionsTwo") {
						trace("go back!");
						instructions = new InstrState();
						//instructionsTwo.y = 0-instructionsTwo.height;
						instructions.x = 0-instructions.width;
						this.addChild(instructions);
						TweenLite.to(instructions, 0.5, {x:0, y:0, ease:Circ.easeInOut});
						break;
					} else {						instructions = new InstrState();
						instructions.x = stage.stageWidth;						this.addChild(instructions);
						TweenLite.to(instructions, 0.5, {x:0, y:0, ease:Circ.easeInOut});						break;
					}
				case "instructionsTwo" :
					if (curState == "instructionsThree") {
						trace("go back!");
						instructionsTwo = new InstrTwoState();
						//instructionsTwo.y = 0-instructionsTwo.height;
						instructionsTwo.x = 0-instructionsTwo.width;
						this.addChild(instructionsTwo);
						TweenLite.to(instructionsTwo, 0.5, {x:0, y:0, ease:Circ.easeInOut});
						break;
					} else {					
						instructionsTwo = new InstrTwoState();
						instructionsTwo.x = stage.stageWidth;
						this.addChild(instructionsTwo);
						TweenLite.to(instructionsTwo, 0.5, {x:0, y:0, ease:Circ.easeInOut});
						break;
				    }
				case "instructionsThree" :
					if (curState == "instructionsFour") {
						trace("go back!")
						instructionsThree = new InstrThreeState();
						instructionsThree.x = 0-instructionsThree.width;
						this.addChild(instructionsThree);
						TweenLite.to(instructionsThree, 0.5, {x:0, y:0, ease:Circ.easeInOut});
						break;
					} else {
						instructionsThree = new InstrThreeState();
						instructionsThree.x = stage.stageWidth;
						this.addChild(instructionsThree);
						TweenLite.to(instructionsThree, 0.5, {x:0, y:0, ease:Circ.easeInOut});
						break;
					}
				case "instructionsFour" :
					instructionsFour = new InstrFourState();
					instructionsFour.x = stage.stageWidth;
					this.addChild(instructionsFour);
					TweenLite.to(instructionsFour, 0.5, {x:0, y:0, ease:Circ.easeInOut});
					break;				case "app" :
					app = new AppState();
					app.y = 0-app.height;					this.addChild(app);
					TweenLite.to(app, 0.5, {x:0, y:0, ease:Circ.easeInOut});					break;
				case "app2" :
					app = new AppState();
					app.y = 0-app.height;
					infinite = true;
					this.addChild(app);
					TweenLite.to(app, 0.5, {x:0, y:0, ease:Circ.easeInOut});
					break;
				case "pause" :
					pause = new PauseState();
					pause.y = 0-pause.height;
					this.addChild(pause);
					TweenLite.to(pause, 0.5, {x:0, y:0, ease:Circ.easeInOut});
					break;
				case "options" :
					options = new OptionState();
					options.x = stage.stageWidth;
					this.addChild(options);
					TweenLite.to(options, 0.5, {x:0, y:0, ease:Circ.easeInOut});
					break;
				case "extras" :
					extras = new ExtraState();
					extras.x = stage.stageWidth;
					this.addChild(extras);
					TweenLite.to(extras, 0.5, {x:0, y:0, ease:Circ.easeInOut});
					break;			}
			
						//must update current state var (now the new state IS the current state)			curState = newState;		}	}}