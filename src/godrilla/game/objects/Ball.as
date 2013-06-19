package godrilla.game.objects
{
    import flash.geom.Rectangle;
    import starling.display.Quad;
    import starling.display.Sprite;
    /**
     * A simple bouncing ball
     * @author abiyasa
     */
    public class Ball extends BaseGameObject
    {
        public static const VELOCITY:int = 15;

        public function Ball()
        {
            super();

            // init ball
            _type = TYPE_BALL;
            _width = 32;
            _height = 32;

            initSprite();
        }

        private function initSprite():void
        {
            _displayObject = new Sprite();

            // create simple box shape
            var q:Quad = new Quad(_width, _height, 0x00FF8080);
            _displayObject.addChild(q);

            // fake shadow
            var shadow:Quad = new Quad(_width, _height / 2, 0x00CCCCCC);
            shadow.y = 50;
            _displayObject.addChild(shadow);
        }

        /**
         * Resets ball into starting position
         */
        override public function reset(gameArena:Rectangle):void
        {
            var radian:Number = Math.PI / 4;
            speedX = -VELOCITY * Math.sin(radian);
            speedY = -VELOCITY * Math.cos(radian);
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