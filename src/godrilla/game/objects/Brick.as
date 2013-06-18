package godrilla.game.objects
{
    import flash.geom.Rectangle;
    /**
     * Brick to destroy
     * @author abiyasa
     */
    public class Brick extends BaseGameObject
    {
        public function Brick()
        {
            super();

            // init paddle
            _type = TYPE_BRICK;
            _width = 60;
            _height = 40;
            _displayObject = BaseGameObject.generateDummySprite(_width, _height, 0x0080FF80);
        }

        /**
         * Resets brick
         */
        override public function reset(gameArena:Rectangle):void
        {
            boundRect = new Rectangle(posX, posY, _width, _height);
            updateDisplayObject();
        }

    }

}