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

        // store half width, for optimization
        private var _halfWidth:int;

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
            _halfWidth = _width / 2;

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
            monster.x = -_halfWidth;

            _displayObject.addChild(monster);
        }

        override public function reset(gameArena:Rectangle):void
        {
            speedX = 0;
            speedY = 0;
            posX = gameArena.left + (gameArena.width / 2) - _halfWidth;
            posY = gameArena.top + (gameArena.height * 0.9);

            _minPosX = gameArena.left + _halfWidth;
            _maxPosX = gameArena.left + gameArena.width - _halfWidth;

            boundRect = new Rectangle(posX - _halfWidth, posY, _width, _height);

            updateDisplayObject();
        }

        override public function update(elapsedTime:Number):void
        {
            posX += speedX;
            posY += speedY;

            boundRect.x = posX - _halfWidth;
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
            var originalPosX:int = this.posX;
            this.posX = posX;

            // update sprite DIRECTION
            if (originalPosX < posX)
            {
                // facing right
                _displayObject.scaleX = 1;
            }
            else if (originalPosX > posX)
            {
                // facing left
                _displayObject.scaleX = -1;
            }
            // else if both positions are the same, don't change the scaleX for smoother transition

            // TODO use speed instead of changing posX directly for better moving transition FX
        }
    }

}
