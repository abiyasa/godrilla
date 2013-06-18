package godrilla.views
{
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import godrilla.views.Utils;

    /**
     * Main menu screen
     * @author abiyasa
     */
    public class MainScreenView extends Sprite
    {
        private var _startButton:Button;

        public function MainScreenView()
        {
            super();

            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            // show title and add buttons
            _startButton = Utils.createDummyButton("Play", 0x009eef, 128, 64);
            this.addChild(_startButton);

            // layout
            _startButton.x = 100;
            _startButton.y = 100;
            _startButton.name = "play";
            _startButton.addEventListener(Event.TRIGGERED, onButtonTriggered);
        }

        private function onButtonTriggered(event:Event):void
        {
            var clickedButton:Button = event.currentTarget as Button;
            if (clickedButton == null)
            {
                return;
            }

            // trigger view event
            trace('onButtonTriggered ' + clickedButton.name);
            this.dispatchEvent(new Event(Event.SELECT, false, clickedButton.name));
        }
    }
}
