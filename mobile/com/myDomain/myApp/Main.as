﻿
	import com.greensock.TweenLite;
	//import com.greensock.*; 
	//import com.greensock.easing.*;

		private var instructionsTwo:MovieClip;
		private var instructionsThree:MovieClip;
		private var instructionsFour:MovieClip;		
		private var pause:MovieClip;
		private var options:MovieClip;
		private var extras:MovieClip;
					//clean up and set to null for garbage collection
					intro.clean();
					intro = null;
					//clean up and set to null for garbage collection
					menu.clean();
					menu = null;
					//clean up and set to null for garbage collection
					instructions.clean();
					instructions = null;
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
					break;
					//clean up and set to null for garbage collection
					app.clean();
					app = null;
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
					break;
					intro.x = stage.stageWidth;
					TweenLite.to(intro, 0.5, {x:0, y:0, ease:Circ.easeInOut});
					menu.x = stage.stageWidth;
					TweenLite.to(menu, 0.5, {x:0, y:0, ease:Circ.easeInOut});
					if (curState == "instructionsTwo") {
						trace("go back!");
						instructions = new InstrState();
						//instructionsTwo.y = 0-instructionsTwo.height;
						instructions.x = 0-instructions.width;
						this.addChild(instructions);
						TweenLite.to(instructions, 0.5, {x:0, y:0, ease:Circ.easeInOut});
						break;
					} else {
						instructions.x = stage.stageWidth;
						TweenLite.to(instructions, 0.5, {x:0, y:0, ease:Circ.easeInOut});
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
					break;
					app = new AppState();
					app.y = 0-app.height;
					TweenLite.to(app, 0.5, {x:0, y:0, ease:Circ.easeInOut});
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
					break;
			
			