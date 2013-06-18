package godrilla.game.objects
{
    import flash.geom.Rectangle;
    import starling.display.DisplayObjectContainer;
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
        public static const TYPE_BRICK:int = 30;

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

        // boundary rectangle for collision detection
        public var boundRect:Rectangle;

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

        /**
         * Resets the game object.
         * Init position, speed, and other properties
         *
         * @param gameArena The valid game arena
         */
        public function reset(gameArena:Rectangle):void
        {
            // nothing to do, extend plz
        }

        public function update(elapsedTime:Number):void
        {
            // nothing to do, extend plz
        }

        /**
         * Adds the display object into the screen container
         * @param screenContainer
         */
        public function addToStage(screenContainer:DisplayObjectContainer):void
        {
            if (_displayObject != null)
            {
                screenContainer.addChild(_displayObject);
            }
        }

        /**
         * Removes the display object into the screen container
         * @param screenContainer
         */
        public function removeFromStage(screenContainer:DisplayObjectContainer):void
        {
            if (_displayObject != null)
            {
                screenContainer.removeChild(_displayObject);
            }
        }

        /**
         * Update the display object position based on object posX & posY
         */
        protected function updateDisplayObject():void
        {
            _displayObject.x = posX;
            _displayObject.y = posY;
        }

    }

}