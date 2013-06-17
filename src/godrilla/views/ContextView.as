package godrilla.views
{
    import flash.display.BitmapData;
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import starling.textures.Texture;

    /**
     * @author abiyasa
     */
    public class ContextView extends Sprite
    {
        public function ContextView()
        {
            super();

            addEventListener(Event.ADDED_TO_STAGE, init );
        }

        private function init(event:starling.events.Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            var button:Button = createDummyButton('Hello world', 0x009eef);
            this.addChild(button);
        }

        /**
         * Creates a dummy button with text
         * @return
         */
        private function createDummyButton(label:String, color:uint):Button
        {
            // create box sprite
            var bitmapData:BitmapData = new BitmapData(128, 128, false, color);
            var texture:Texture = Texture.fromBitmapData(bitmapData);
            var button:Button = new Button(texture, label, texture);
            button.fontName = 'Verdana';
            button.fontColor = 0xffffff;
            button.fontSize = 16;

            return button;
        }

    }
}
