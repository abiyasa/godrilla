package godrilla.game.objects
{
    import flash.geom.Rectangle;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.textures.Texture;
    /**
     * Player-controlled paddle
     * @author abiyasa
     */
    public class Paddle extends BaseGameObject
    {
        // movement limit
        private var _minPosX:int;
        private var _maxPosX:int;

        [Embed(source="../../../../assets/godrilla.png")]
        public static const TEXTURE_GODRILLA:Class;

        public static var mainTexture:Texture;

        public function Paddle()
        {
            super();

            // init paddle
            _type = TYPE_PADDLE;
            _width = 96;
            _height = 32;

            initSprite();
        }

        private function initSprite():void
        {
            // init textures
            if (Paddle.mainTexture == null)
            {
                Paddle.mainTexture = Texture.fromBitmap(new TEXTURE_GODRILLA());
            }

            // create simple & random building shape
            _displayObject = new Sprite();
            var monster:Image = new Image(Paddle.mainTexture);

            // adjust width & height
            monster.width = _width;
            monster.height = _width;
            monster.y = -(_width - _height);

            _displayObject.addChild(monster);
        }

        override public function reset(gameArena:Rectangle):void
        {
            speedX = 0;
            speedY = 0;
            posX = gameArena.left + (gameArena.width / 2) - (_width / 2);
            posY = gameArena.top + (gameArena.height * 0.9);

            _minPosX = gameArena.left;
            _maxPosX = gameArena.left + gameArena.width - _width;

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
            // limit position
            if (posX < _minPosX)
            {
                posX = _minPosX;
            }
            else if (posX > _maxPosX)
            {
                posX = _maxPosX;
            }
            this.posX = posX;

            // TODO update speed, not position for better FX
        }
    }

}
