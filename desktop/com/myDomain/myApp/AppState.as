
	/* 	This Demo created by Orion Atkinson
		for the Interactive Media Development
		program at Confederation College. */
	
package  com.myDomain.myApp{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.events.FocusEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	public class AppState extends MovieClip {
		
		var main:MovieClip;
		var player:MovieClip;
		var coin:MovieClip;
		var coffee:MovieClip;
		var computers:MovieClip;
		var computersBack:MovieClip;
		var keyboards:MovieClip;
		var whiteboard:MovieClip;
		var gum:MovieClip;
		var copter:MovieClip;
		var hand:MovieClip;
		var mouse:MovieClip;
		var desk:MovieClip;
		var ctrl:MovieClip;
		var topHud:MovieClip;
		var handWarning:MovieClip;
		var upgrades:MovieClip;
		var levelRotate:MovieClip;
		
		// environment //
		var middle:Number = 500;
		var deskTop:Number = 1400;
		
		var gravity:Number = 12;
		
		var distance:Number = 0;
		
		
		var paused:Boolean = false;
		
		var left:Boolean = false;
		var right:Boolean = false;
		var jumping:Boolean = false;
		var hit:Boolean = false;
		var sticking:Boolean = false;
		
		var playerScale:Number = 1;
		var playerXV:Number = 0;
		var playerYV:Number = 0;
		var playerSpeedMultiplier:Number = 0.15;
		
		var upgradeCost1:Number = 100;
		var upgradeCost2:Number = 200;
		var upgradeCost3:Number = 400;
		
		var obsticleMultiplier:Number = 1;
		var coinMultiplier:Number = 1;
		
		var upgradesShow:Boolean = false;
		var closeUpgrade:Boolean = false;
		
		var energy:Number = 100;
		var health:Number = 3;
		
		var forceX:Number = 0;
		var forceY:Number = 0;
		
		var handSpeed:Number = 20;
		
		var mouseSpeed:Number = 10;
		
		var jumpPower:Number = 140;
		
		var riddingSpeed:Number = 50;
		
		var ctrlXV:Number = 0;
		var ctrlResist:Number = 0;
		var ctrlSpeed:Number = 50;
		
		var coinsGot:Number = 0;
		
		var mySound:Sound = new Click(); 
		
		var distanceTimer:Timer;
		var coinTimer:Timer;
		var copterTimer:Timer;
		var coffeeTimer:Timer;
		var mouseTimer:Timer;
		var hitTimer:Timer;
		var coinDelay:Timer;
		var upgrade2Timer:Timer;
		var upgrade3Timer:Timer;
		
		var coins:Array = new Array();
		var copters:Array = new Array();
		var coffees:Array = new Array();
		var mice:Array = new Array();
		var garbageCollection:Array = new Array();
		
		
		// constructor code
		public function AppState() {
			
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		} // constructor code />
		
		
		// initialize //
		private function init(obj:Event):void{
			trace("Shmevin State");
			
			//cast main/parent as a MovieClip
			main = MovieClip(this.parent);
			
			this.focusRect = false;
			stage.focus = this;
			
			stage.frameRate = 30;
			
			addEventListener(Event.ENTER_FRAME, motion);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			distanceTimer = new Timer(200);
			distanceTimer.addEventListener(TimerEvent.TIMER, distanceCount);
			distanceTimer.start();
			
			coinTimer = new Timer(2000);
			coinTimer.addEventListener(TimerEvent.TIMER, coinSpawn);
			coinTimer.start();
			
			coffeeTimer = new Timer(5000);
			coffeeTimer.addEventListener(TimerEvent.TIMER, coffeeSpawn);
			coffeeTimer.start();
			
			copterTimer = new Timer(4000);
			copterTimer.addEventListener(TimerEvent.TIMER, copterSpawn);
			copterTimer.start();
			
			mouseTimer = new Timer(3000);
			mouseTimer.addEventListener(TimerEvent.TIMER, mouseSpawn);
			mouseTimer.start();
			
			upgrade2Timer = new Timer(30000);
			upgrade2Timer.addEventListener(TimerEvent.TIMER, upgrade2Stop);
			upgrade2Timer.start();
			
			upgrade3Timer = new Timer(60000);
			upgrade3Timer.addEventListener(TimerEvent.TIMER, upgrade3Stop);
			upgrade3Timer.start();
			
			hitTimer = new Timer(500);
			hitTimer.addEventListener(TimerEvent.TIMER, hitStop);
			
			
			
			// level Rotate //
			levelRotate = new LevelRotate();
			
			levelRotate.x = middle;
			levelRotate.y = deskTop;
			levelRotate.scaleX = 1;
			levelRotate.scaleY = levelRotate.scaleX;
			
			addChild(levelRotate);
			
			// controller //
			ctrl = new Ctrl();
			
			ctrl.x = middle;
			ctrl.y = 700;
			ctrl.scaleX = 2;
			ctrl.scaleY = ctrl.scaleX;
			
			addChild(ctrl);
			
			ctrl.visible = false;
			
			// whiteboard //
			whiteboard = new Whiteboard();
			
			whiteboard.x = 0;
			whiteboard.y = -1500;
			whiteboard.scaleX = 2;
			whiteboard.scaleY = whiteboard.scaleX;
			
			levelRotate.addChild(whiteboard);
			
			// desk //
			desk = new Desk();
			
			desk.x = 0;
			desk.y = 60;
			desk.scaleX = 3;
			desk.scaleY = 3;
			
			levelRotate.addChild(desk);
			
			computersBack = new ComputersBack();
			
			computersBack.x = 0;
			computersBack.y = -250;
			computersBack.scaleX = 1.8;
			computersBack.scaleY = 1.8;
			
			levelRotate.addChild(computersBack);
			
			computers = new Computers();
			
			computers.x = 0;
			computers.y = -120;
			computers.scaleX = 1.8;
			computers.scaleY = 1.8;
			
			levelRotate.addChild(computers);
			
			keyboards = new Keyboards();
			
			keyboards.x = 0;
			keyboards.y = -70;
			keyboards.scaleX = 2;
			keyboards.scaleY = 2;
			
			levelRotate.addChild(keyboards);
			
			gum = new Gum();
			
			gum.x = 6000;
			gum.y = 0;
			gum.scaleX = 0.8;
			gum.scaleY = 0.8;
			
			levelRotate.addChild(gum);
			
			hand = new Hand();
			
			hand.x = -2000;
			hand.y = -30;
			hand.scaleX = 2;
			hand.scaleY = 2;
			
			levelRotate.addChild(hand);
			
			player = new Player();
			
			player.x = 0;
			player.y = 0;
			player.scaleX = playerScale;
			player.scaleY = playerScale;
			
			levelRotate.addChild(player);
			
			topHud = new TopHud();
			
			topHud.x = 10;
			topHud.y = 0;
			topHud.scaleX = 2.5;
			topHud.scaleY = 2.5;
			
			addChild(topHud);
			
			topHud.pauseBtn.addEventListener(MouseEvent.CLICK, pause);
			
			handWarning = new HandWarning();
			
			handWarning.x = 100;
			handWarning.y = -500;
			handWarning.scaleX = 0.8;
			handWarning.scaleY = 0.8;
			
			player.addChild(handWarning);
			
			handWarning.visible = false;
			
			upgrades = new Upgrades();
			
			upgrades.x = 60;
			upgrades.y = 300;
			upgrades.scaleX = 1;
			upgrades.scaleY = 1;
			
			addChild(upgrades);
			
			upgrades.visible = false;
			
			upgrades.exitUpgradesBtn.addEventListener(MouseEvent.CLICK, exitUpgrades);
			
			
		} // initialize />
		
		// motion //
		public function motion(obj:Event):void {
			
			hud();
			
			if (!paused) {
			
			deskMotion();
			
			playerMotion();
				
			parallax();
			
			foreground();
				
			}
			
			
			
		} // motion />
		
		// desk //
		public function deskMotion():void {
			
			levelRotate.rotation = (ctrl.x - middle)*0.01
		} // desk />
		
		// player motion //
		public function playerMotion():void {
			
			// controller //
			ctrl.x += ctrlXV - ctrlResist;
			
			if (left){
				
				ctrlXV = -ctrlSpeed;
			}	else if (right){
				
				ctrlXV = ctrlSpeed;
			}	else {
				
				ctrlXV = 0;
			}
			
			ctrlResist = (ctrl.x - middle) / 8;
		// controller />
			
		// player motion in X //
			if (player.x > 0) { 
			
				player.x += playerXV - (player.x*0.15);
			} else {
			
				if (player.x < -700 && ctrl.x < middle){
					
					player.x += Math.abs(playerXV*0.2);
				} else {
					
					player.x += playerXV;
				}
				
			} 
		// player motion in X />
		
		// player X velocity controller //
			
			playerXV = (ctrl.x - middle)*playerSpeedMultiplier;
			
		// player X velocity controller />
		
		// force x //
			playerXV += forceX;
			
			forceX *= 0.8;
			
	
			
		// player motion in Y //
			
			player.y += playerYV;
			
		// player motion in Y />
			
		// force x //
			playerYV += forceY;
			
			forceY *= 0.8;
			
		// player Y velocity controller //
			
			if (player.y >= 0) {
				
				jumping = false;
				player.y = 0;
				playerYV = 0;
			} else {
				
				playerYV += gravity;
			} 
			
		// player Y velocity controller />
				
			
		
		} // player motion />
		
		// parallax //
		public function parallax():void {
			
			// moving forward && past middle //
			if (playerXV > 0 && player.x > 0) {
				
				// background X velocity //
				var backgroundXV:Number = 0;
				backgroundXV = playerXV*0.8;
				
				// distance count //
				distance += playerXV*0.001;
				
				// background MovieClips //
				whiteboard.x -= backgroundXV*0.5;
				computersBack.x -= backgroundXV*0.7;
				computers.x -= backgroundXV;
				keyboards.x -= backgroundXV*1.1;
			} 
			
			if (computers.x < -2500) {
				
				computersBack.x = 0;
				computers.x = 0;
				keyboards.x = 0;
			}
			
			if (whiteboard.x < -35000) {
				whiteboard.x = 0;
			}
		} // paralax />
		
		// foreground //
		public function foreground():void {
			
			
			if (hand.x > -3000) {
				
				handWarning.visible = true;
			} else {
				handWarning.visible = false;
			}
			
			
			for (var a:Number = 0; a < garbageCollection.length; a++) {
				
				  if (garbageCollection[a].y < -1400) {
					  
					  garbageCollection[a].parent.removeChild(garbageCollection[a]);
					  
					  garbageCollection.splice(a, 1);
					  
					  
				  }
				
			}
			
			// coins //
			for (var i:Number = 0; i < coins.length; i++) {
				
				if (playerXV > 0 && player.x > 0) {
					
					coins[i].x -= playerXV;
				} 
				
				if (coins[i].x < -1500) {
					
					coins[i].parent.removeChild(coins[i]);
					
					coins.splice(i, 1);
				}
				
				if (coins[i] != null) {
				
					if (coins[i].hitTestObject(player.hitBox)) {
						
						coinsGot += 1*coinMultiplier;
						
						coin = new Coin();
						
						coin.x = coins[i].x;
						coin.y = coins[i].y;
						coin.scaleX = coins[i].scaleX;
						coin.scaleY = coins[i].scaleY;
						
						levelRotate.addChild(coin);
						
						garbageCollection.push(coin);
						
						TweenLite.to(coin, 1.2, {x:-250, y:-1500, scaleX:0.5, scaleY:0.5, ease:Back.easeInOut});
						
						coins[i].parent.removeChild(coins[i]);
						
						coins.splice(i, 1);
						
						
					}
				}
				
				
			} // coins />
			
			// coffees //
			for (var l:Number = 0; l < coffees.length; l++) {
				
				if (playerXV > 0 && player.x > 0) {
					
					coffees[l].x -= playerXV;
				} 
				
				if (coffees[l].x < -1500) {
					
					coffees[l].parent.removeChild(coffees[l]);
					
					coffees.splice(l, 1);
				}
				
				if (coffees[l] != null) {
				
					if (coffees[l].hitBox.hitTestObject(player.hitBox)) {
						
						if (health < 3) {
							health += 1;
						} else {
							energy = 100;
						}
						
						
						coffee = new Coffee();
						
						coffee.x = coffees[l].x;
						coffee.y = coffees[l].y;
						coffee.scaleX = coffees[l].scaleX;
						coffee.scaleY = coffees[l].scaleY;
						
						levelRotate.addChild(coffee);
						
						garbageCollection.push(coffee);
						
						TweenLite.to(coffee, 2, {x:1500, y:-1500, scaleX:0.02, scaleY:0.02, ease:Back.easeInOut});
						
						coffees[l].parent.removeChild(coffees[l]);
						
						coffees.splice(l, 1);
					}
				}
				
				
			} // coffees />
			
			// copters //
			for (var k:Number = 0; k < copters.length; k++) {
				
				if (playerXV > 0 && player.x > 0) {
					
					copters[k].x -= playerXV;
				} 
				
				if (copters[k].x < -1500) {
					
					copters[k].parent.removeChild(copters[k]);
					
					copters.splice(k, 1);
				}
				
				if (copters[k] != null) {
					
					if (!hit) {
				
					if (copters[k].topHit.hitTestObject(player.feetBox)) {
						
						playerYV = 0;
						
						forceY -= 30;
						
						TweenLite.to(copters[k], 0.6, {x:copters[k].x, y:800, ease:Back.easeIn});
						
						
						for (var f:Number = 0; f < randRange(3, 6); f++) {
							
							coin = new Coin();
							
							coin.x = copters[k].x + 500;
							coin.y = copters[k].y + 100;
							coin.scaleX = 2.5;
							coin.scaleY = 2.5;
							
							levelRotate.addChild(coin);
							
							coins.push(coin);
							
							TweenLite.to(coin, randRange(300, 400)/200, {x:copters[k].x + randRange(400, 1000), y:0, scaleX:3, scaleY:3, ease:Bounce.easeOut});
							
						}
						
						
						hit = true;
						
						hitTimer.start();
						
					} else if (copters[k].bottomHit.hitTestObject(player.headBox)) {
						
						playerYV = 0;
						
						forceY += 130;
						
						if (coinsGot > 0) {
						
							energy -= 30;
							
							for (var w:Number = 0; w < randRange(1, 3) && coinsGot > 0; w++) {
								
								coin = new Coin();
								
								coin.x = player.x + 200;
								coin.y = player.y + 100;
								coin.scaleX = 2.5;
								coin.scaleY = 2.5;
								
								levelRotate.addChild(coin);
								
								coins.push(coin);
								
								if (coinsGot > 0) {
									coinsGot -= 1;
								}
								
								TweenLite.to(coin, randRange(100, 200)/200, {x:player.x + randRange(200, 600), y:0, scaleX:3, scaleY:3, ease:Bounce.easeOut});
								
							}
							
							for (var h:Number = 0; h < randRange(1, 3)  && coinsGot > 0; h++) {
								
								coin = new Coin();
								
								coin.x = player.x - 100;
								coin.y = player.y + 100;
								coin.scaleX = 2.5;
								coin.scaleY = 2.5;
								
								levelRotate.addChild(coin);
								
								coins.push(coin);
								
								if (coinsGot > 0) {
									coinsGot -= 1;
								} 
								
								TweenLite.to(coin, randRange(100, 200)/200, {x:player.x - randRange(200, 600), y:0, scaleX:3, scaleY:3, ease:Bounce.easeOut});
								
							}
							
						} else {
							health -= 1;
						}
						
						hit = true;
						
						hitTimer.start();
						
					} else if ( copters[k].y > 300) {
						
						copters[k].parent.removeChild(copters[k]);
						
						copters.splice(k, 1);
					}
					
					}
					
				}
				
				
			} // copters />
			
			// mice //
			for (var j:Number = 0; j < mice.length; j++) {
				
				if (playerXV > 0 && player.x > 0) {
					
					mice[j].x -= playerXV - mouseSpeed;
				} else {
					
					mice[j].x += mouseSpeed;
				}
				
				if (mice[j].x < -1000) {
					
					mice[j].parent.removeChild(mice[j]);
					
					mice.splice(j, 1);
				}
				
				if (mice[j] != null) {
					
					if (!hit) {
				
					if (mice[j].hitTestObject(player.hitBox)) {
						
						mice[j].x = player.x;
						
						ctrl.x += riddingSpeed;
						
					}
					
					}
				}
				
				
			} // mice />
			
			// moving forward && past middle //
			if (playerXV > 0 && player.x > 0) {
				
				hand.x += handSpeed + distance*0.04 - playerXV;
				gum.x -= playerXV;
			} else {
				
				hand.x += handSpeed + distance*0.04;
			}
			
			if (hand.x < -4000) {
				
				hand.x = -4000
			} 
			
			if (gum.x < randRange(-7000, -10000)*obsticleMultiplier) {
				
				gum.x = 2000;
			}
			
			
			if (gum.hitBox.hitTestObject(player.hitBox)) {
				
				player.alpha = 0.3;
				gum.gotoAndStop('stretch');
				
				playerXV *= 0.1;
				ctrlXV *= 0.1;
				
			} else if (hand.hitBox.hitTestObject(player.hitBox)) {
				
				player.alpha = 0.3;
				
				ctrl.x += 200;
				
			} else {
				
				player.alpha = 1;
				
				gum.gotoAndStop('still');
			}
			
			
		} // foreground />
		
		// coinSpawn //
		public function coinSpawn(obj:TimerEvent) {
			
			coin = new Coin();
			
			coin.x = 2000;
			coin.y = randRange(0, -1000);
			coin.scaleX = 3;
			coin.scaleY = 3;
			
			coinTimer.delay = randRange(500, 1000);
			
			levelRotate.addChildAt(coin, numChildren + 1);
			
			coins.push(coin);
			
		} // coinSpawn //>
		
		// coffeeSpawn //
		public function coffeeSpawn(obj:TimerEvent) {
			
			coffee = new Coffee();
			
			coffee.x = 2000;
			coffee.y = randRange(-300, -1000);
			coffee.scaleX = 0.7;
			coffee.scaleY = 0.7;
			
			coffeeTimer.delay = randRange(30000, 60000);
			
			levelRotate.addChildAt(coffee, numChildren + 1);
			
			coffees.push(coffee);
			
		} // coffeeSpawn //>
		
		// copterSpawn //
		public function copterSpawn(obj:TimerEvent) {
			
			copter = new Copter();
			
			copter.x = 2000;
			copter.y = randRange(-300, -1000);
			copter.scaleX = 1;
			copter.scaleY = 1;
			
			copterTimer.delay = (randRange(3000, 5000) - (distance*2.5))*obsticleMultiplier;
			
			levelRotate.addChildAt(copter, numChildren + 1);
			
			copters.push(copter);
			
		} // copterSpawn //>
		
		// mouseSpawn //
		public function mouseSpawn(obj:TimerEvent) {
			
			if (mice.length < 1) {
				
				mouse = new RideMouse();
				
				mouse.x = 2000;
				mouse.y = 0;
				mouse.scaleX = 1;
				mouse.scaleY = 1;
				
				
				mouseTimer.delay = randRange(10000, 15000);
				
				levelRotate.addChild(mouse);
				
				mice.push(mouse);
				
			}
			
			
		} // mouseSpawn //>
		
		// distance //
		public function distanceCount(obj:TimerEvent) {
			
			topHud.distanceText.text = 1000 - Math.round(distance);
			
		} // distance />
		
		// hit stop //
		public function hitStop(obj:TimerEvent) {
			
			hit = false;
			
			hitTimer.stop();
			hitTimer.reset();
			
			
			
		} // hit stop />
		
		// hud //
		public function hud():void {
			
			topHud.coinText.text = coinsGot;
			
			// health //
			topHud.energyBar.gotoAndStop(energy);
			
			topHud.health.gotoAndStop(health + 1);
			
			if (energy < 5) {
				
				if (health > 0) {
					
					health -= 1;
					
					energy = 100;
				} else {
					
					stage.frameRate = 0;
				}
			}
			
			
			
			if (upgradesShow) {
				
				upgrades.visible = true;
				
				paused = true;
					
				if (coinsGot >= upgradeCost3) { 
					
					upgrades.coffeePotBtn.addEventListener(MouseEvent.CLICK, Upgrade1);
					upgrades.lessObsticlesBtn.addEventListener(MouseEvent.CLICK, Upgrade2);
					upgrades.x2CoinsBtn.addEventListener(MouseEvent.CLICK, Upgrade3);
					
					upgrades.lock1.visible = false;
					upgrades.lock2.visible = false;
					upgrades.lock3.visible = false;
				}
				
				if (coinsGot >= upgradeCost2) {
					
					upgrades.coffeePotBtn.addEventListener(MouseEvent.CLICK, Upgrade1);
					upgrades.lessObsticlesBtn.addEventListener(MouseEvent.CLICK, Upgrade2);
					
					upgrades.lock1.visible = false;
					upgrades.lock2.visible = false;
				}
				
				if (coinsGot >= upgradeCost1) {
					
					upgrades.coffeePotBtn.addEventListener(MouseEvent.CLICK, Upgrade1);
					
					upgrades.lock1.visible = false;
					
				}
				
			} else {
				
				upgrades.visible = false;
				
				paused = false;
				
				upgrades.lock1.visible = true;
				upgrades.lock2.visible = true;
				upgrades.lock3.visible = true;
				
				upgrades.coffeePotBtn.removeEventListener(MouseEvent.CLICK, Upgrade1);
				upgrades.lessObsticlesBtn.removeEventListener(MouseEvent.CLICK, Upgrade2);
				upgrades.x2CoinsBtn.removeEventListener(MouseEvent.CLICK, Upgrade3);
				
				if (coinsGot == upgradeCost1 || coinsGot == upgradeCost2 || coinsGot == upgradeCost3) {
					
					if (!closeUpgrade) {
						
						upgradesShow = true;
					}
				} else if (coinsGot == (upgradeCost1 + 1) || coinsGot == (upgradeCost2 + 1) || coinsGot == (upgradeCost3 + 1)) {
					
						closeUpgrade = false;
				}
			}
			
		}
		
		// upgrades //
		
		public function exitUpgrades(obj:MouseEvent):void {
			
			upgradesShow = false;
			
			closeUpgrade = true;
			
			trace('exit');
		}
		
		public function Upgrade1(obj:MouseEvent):void {
			
			energy = 100;
			health = 3;
			
			upgradesShow = false;
			
			coinsGot -= upgradeCost1;
			
		}
		
		public function Upgrade2(obj:MouseEvent):void {
			
			upgradesShow = false;
			
			coinsGot -= upgradeCost2;
			
			obsticleMultiplier = 4;
			
			upgrade2Timer.reset();
			upgrade2Timer.start();
			
		}
		
		public function Upgrade3(obj:MouseEvent):void {
			
			upgradesShow = false;
			
			coinsGot -= upgradeCost3;
			
			coinMultiplier = 2;
			
			upgrade3Timer.reset();
			upgrade3Timer.start();
			
		}
		
		public function upgrade2Stop(obj:TimerEvent) {
			
			upgrade2Timer.stop();
			
			obsticleMultiplier = 1;
			
			
		}
		
		public function upgrade3Stop(obj:TimerEvent) {
			
			upgrade3Timer.stop();
			
			coinMultiplier = 1;
		}
		
		// key down //
		public function keyDown(obj:KeyboardEvent):void {
			
			switch(obj.keyCode){
							
					// right key
					case Keyboard.RIGHT:
						
						left = false;
						right = true;
						this.player.scaleX = playerScale;
					break;
					
					// left key
					case Keyboard.LEFT:
						
						left = true;
						right = false;
						this.player.scaleX = -playerScale;
					break;
					
					// space key
					case Keyboard.SPACE:
						
						if (!jumping) {
			
							playerYV -= jumpPower;
							jumping = true;
						} 
					break;
					
					// shift key
					case Keyboard.SHIFT:
						
						if (!jumping) {
			
							playerYV -= jumpPower;
							jumping = true;
						} 
					break;
			}
		} // key down />
		
		// key up //
		public function keyUp(obj:KeyboardEvent):void {
			
			switch (obj.keyCode) {
				
				// right key
				case Keyboard.RIGHT:
					
					right = false
				;
				break;
				
				// left key
				case Keyboard.LEFT:
					
					left = false;
				break;
			}
		} // key up />
		
		// pause //
		public function pause(obj:MouseEvent):void {
			
			paused = true;
		} // pause />
		
		// clean up //
		public function clean():void{
			trace("Cleaning up");
		} // clean up />
		
		// random range //
		function randRange(start:Number, end:Number) : Number {  
		
			return Math.floor(start +(Math.random() * (end - start)));  
		} // random range />
		
	}
}