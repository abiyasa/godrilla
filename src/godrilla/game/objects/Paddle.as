package godrilla.game.objects
{
    import flash.geom.Rectangle;
    /**
     * Player-controlled paddle
     * @author abiyasa
     */
    public class Paddle extends BaseGameObject
    {

        public function Paddle()
        {
            super();

            // init paddle
            _type = TYPE_PADDLE;
            _width = 96;
            _height = 32;
            _displayObject = BaseGameObject.generateDummySprite(_width, _height, 0x008080FF);
        }

        override public function reset(arenaWidth:int, arenaHeight:int):void
        {
            speedX = 0;
            speedY = 0;
            posX = (arenaWidth / 2) - (_width / 2);
            posY = arenaHeight * 0.9;

            boundRect = new Rectangle(posX, posY, _width, _height);

            updateDisplayObject();
        }

        override public function update(elapsedTime:Number):void
        {
            posX += speedX;
            posY += speedY;

            boundRect.x = posX;
            boundRect.y = posY;

            updateDisplayObject();
        }

        /**
         * Moves the paddle to a specific position
         *
         * @param posX
         * @param posY
         */
        public function moveTo(posX:int, posY:int):void
        {
            this.posX = posX;

            // TODO update speed, not position for better FX
        }
    }

}
