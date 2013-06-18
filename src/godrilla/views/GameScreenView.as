package godrilla.views
{
    import godrilla.game.Engine;
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import godrilla.views.Utils;

    /**
     * The main game screen.
     * Also manage the game engine and the main game loop
     *
     * @author abiyasa
     */
    public class GameScreenView extends Sprite
    {
        private var _pauseButton:Button;
        private var _score:TextField;

        private var _gameEngine:Engine;

        public function GameScreenView()
        {
            super();

            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event:Event = null):void
        {
            trace(this + ', init()');
            removeEventListener(Event.ADDED_TO_STAGE, init);

            // TODO this won't called when removed from stage. investigate!
            addEventListener(Event.REMOVED_FROM_STAGE, destroy);

            // show gui and buttons
            _score = Utils.createSimpleLabel("0", 0x009eef, 200, 200, 16);
            this.addChild(_score);

            // Note: no pause yet, just quitting the game
            _pauseButton = Utils.createDummyButton("Quit", 0x009eef, 64, 64);
            this.addChild(_pauseButton);

            // layout
            _score.x = 10;
            _score.y = 20;
            _pauseButton.x = this.stage.stageWidth - _pauseButton.width - 10;
            _pauseButton.y = 10;
            _pauseButton.name = "pause";
            _pauseButton.addEventListener(Event.TRIGGERED, onButtonTriggered);

            startGame();
        }

        private function destroy(event:Event = null):void
        {
            trace(this + ', destroy()');
            removeEventListener(Event.REMOVED_FROM_STAGE, destroy);

            stopGame();
        }

        /**
         * Starts the game loop and game engine
         */
        private function startGame():void
        {
            _gameEngine = new Engine(this, this.stage.stageWidth, this.stage.stageHeight);
            _gameEngine.init();
            _gameEngine.start();

            // start timer
            this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }

        /**
         * Handle enter frame event
         * @param event
         */
        private function onEnterFrame(event:Event):void
        {
            // TODO calculate elapsed time
            var elapsedTime:Number = 0;

            // update game UI and check game status
            if (_gameEngine.status == Engine.STATUS_WIN)
            {
                _score.text = "You WIN!! Have a coffee break";
            }
            else
            {
                // update game
                _gameEngine.update(elapsedTime);

                _score.text = _gameEngine.score.toString();
            }
        }

        /**
         * Stop the game loop and game engine
         */
        private function stopGame():void
        {
            // stop timer and the game
            this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            _gameEngine.stop();
            _gameEngine = null;
        }

        private function onButtonTriggered(event:Event):void
        {
            var clickedButton:Button = event.currentTarget as Button;
            if (clickedButton == null)
            {
                return;
            }

            trace('onButtonTriggered ' + clickedButton.name);

            // TODO pause game
            // Note: currently this button will quit the game
            destroy();
            this.dispatchEvent(new Event(Event.SELECT, false, "main"));
        }
    }
}
