package godrilla.views
{
    import flash.display.BitmapData;
    import starling.display.Button;
    import starling.text.TextField;
    import starling.textures.Texture;

    /**
     * Utility class for views
     * @author abiyasa
     */
    public class Utils
    {

        /**
         * Creates a dummy button with text
         * @return
         */
        public static function createDummyButton(label:String, color:uint,
            width:int, height:int):Button
        {
            // create box sprite
            var bitmapData:BitmapData = new BitmapData(width, height, false, color);
            var texture:Texture = Texture.fromBitmapData(bitmapData);
            var button:Button = new Button(texture, label, texture);
            button.fontName = 'Verdana';
            button.fontColor = 0xffffff;
            button.fontSize = 16;

            return button;
        }
    }

}
