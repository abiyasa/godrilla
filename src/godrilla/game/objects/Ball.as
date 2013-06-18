package godrilla.game.objects
{
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
        public function reset():void
        {
            speedX = 10;
            speedY = 10;
        }

        override public function update(elapsedTime:Number):void
        {
            posX += speedX;
            posY += speedY;

            _displayObject.x = posX;
            _displayObject.y = posY;
        }

    }

}