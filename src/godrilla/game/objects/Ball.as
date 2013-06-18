package godrilla.game.objects
{
    import flash.geom.Rectangle;
    /**
     * A simple bouncing ball
     * @author abiyasa
     */
    public class Ball extends BaseGameObject
    {

        public function Ball()
        {
            super();

            // init ball
            _type = TYPE_BALL;
            _width = 32;
            _height = 32;
            _displayObject = BaseGameObject.generateDummySprite(_width, _height, 0x00FF8080);
        }

        /**
         * Resets ball into starting position
         */
        override public function reset(gameArena:Rectangle):void
        {
            speedX = -10;
            speedY = -10;
            posX = gameArena.left + (gameArena.width / 2);
            posY = gameArena.top + (gameArena.height * 0.7);

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

    }

}