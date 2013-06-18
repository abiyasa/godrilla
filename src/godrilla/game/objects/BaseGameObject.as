package godrilla.game.objects
{
    import starling.display.Quad;
    import starling.display.Sprite;

    /**
     * The base of game object
     * @author abiyasa
     */
    public class BaseGameObject
    {
        public static const TYPE_GENERIC:int = 0;
        public static const TYPE_BALL:int = 10;
        public static const TYPE_PADDLE:int = 20;

        protected var _type:int;

        // visual representation of the game object
        protected var _displayObject:Sprite;
        public function get displayObject():Sprite { return _displayObject; }

        /**
         * The object type
         * @see TYPE_XXX constants
         */
        public function get type():int { return _type; }

        protected var _width:int;
        public function get width():int { return _width; }

        protected var _height:int;
        public function get height():int { return _height; }

        public var posX:int;
        public var posY:int;
        public var speedX:int;
        public var speedY:int;

        public function BaseGameObject()
        {
            super();
            _type = TYPE_GENERIC;
        }

        /**
         * Generate a dummy square/reactangular sprite
         *
         * @return
         */
        public static function generateDummySprite(width:int, height:int, color:uint):Sprite
        {
            // create box sprite
            var box:Sprite = new Sprite();

            // create quad (box shape)
            var q:Quad = new Quad(width, height, color);
            box.addChild(q);

            // pivoting
            //q.x = -width / 2;
            //q.y = -height / 2;

            return box;
        }

        public function update(elapsedTime:Number):void
        {
            // nothing to do, extend plz
        }

    }

}