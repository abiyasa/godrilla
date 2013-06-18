package godrilla.views
{
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import godrilla.views.Utils;

    /**
     * The main game screen.
     * Also manage the game engine
     *
     * @author abiyasa
     */
    public class GameScreenView extends Sprite
    {
        private var _pauseButton:Button;
        private var _score:TextField;

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
            _score = Utils.createSimpleLabel("score", 0x009eef, 200, 200, 16);
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
        }

        private function destroy(event:Event = null):void
        {
            trace(this + ', destroy()');
            removeEventListener(Event.REMOVED_FROM_STAGE, destroy);

            // TODO stop timer and the game

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
