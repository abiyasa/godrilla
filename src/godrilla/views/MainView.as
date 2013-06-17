package godrilla.views
{
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import starling.textures.Texture;
    import godrilla.views.Utils;

    /**
     * The main view
     * @author abiyasa
     */
    public class MainView extends Sprite
    {
        public function MainView()
        {
            super();

            addEventListener(Event.ADDED_TO_STAGE, init );
        }

        private function init(event:starling.events.Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            var button:Button = Utils.createDummyButton('Hello world', 0x009eef, 128, 64);
            this.addChild(button);
        }

    }
}
