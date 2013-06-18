package godrilla.views
{
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import godrilla.views.Utils;

    /**
     * Main menu screen
     * @author abiyasa
     */
    public class MainScreenView extends Sprite
    {
        private var _startButton:Button;
        private var _title:TextField;

        public function MainScreenView()
        {
            super();

            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            // show title and add buttons
            _title = Utils.createSimpleLabel("Godrilla Arkanoid", 0x009eef, 200, 200, 32);
            this.addChild(_title);
            _startButton = Utils.createDummyButton("Play", 0x009eef, 128, 64);
            this.addChild(_startButton);

            // layout
            _title.x = (this.stage.stageWidth - _title.width) / 2;
            _title.y = 50;
            _startButton.x = (this.stage.stageWidth - _startButton.width) / 2;
            _startButton.y = 300;
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
