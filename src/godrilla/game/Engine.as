package godrilla.game
{
    import flash.geom.Rectangle;
    import godrilla.game.objects.Ball;
    import godrilla.game.objects.Paddle;
    import starling.display.DisplayObjectContainer;

    /**
     * Main game engine
     * @author abiyasa
     */
    public class Engine
    {
        private var _stage:DisplayObjectContainer;

        private var _score:int;
        public function get score():int { return _score; }

        public static const STATUS_INIT:int = 0;
        public static const STATUS_PLAY:int = 10;
        public static const STATUS_PAUSED:int = 20;
        public static const STATUS_STOP:int = 30;

        private var _status:int;

        // List of balls
        private var _balls:Vector.<Ball>;

        // player's paddle
        private var _paddle:Paddle;

        /**
         * The game status
         * @see Constants STATUS_XXX
         */
        public function get status():int { return _status; }

        private var _areaWidth:int;
        private var _areaHeight:int;

        public function Engine(stage:DisplayObjectContainer, width:int, height:int)
        {
            super();
            _stage = stage;
            _areaWidth = width;
            _areaHeight = height;

            _status = STATUS_INIT;
            _balls = new Vector.<Ball>();
        }

        public function init():void
        {
            _status = STATUS_INIT;

            // init ball
            var ball:Ball = new Ball();
            _balls.push(ball);
            ball.addToStage(_stage);

            // init paddle
            _paddle = new Paddle();
            _paddle.addToStage(_stage);
        }

        /**
         * Starts the game engine
         */
        public function start():void
        {
            _score = 0;
            _status = STATUS_PLAY;

            resetObjects();
        }

        /**
         * Resets the game objects
         */
        protected function resetObjects():void
        {
            // reset ball
            for each (var ball:Ball in _balls)
            {
                ball.reset(_areaWidth, _areaHeight);
            }

            // reset paddle
            _paddle.reset(_areaWidth, _areaHeight);
        }

        /**
         * Stops and destroy the game engine
         */
        public function stop():void
        {
            _status = STATUS_STOP;
        }

        /**
         * Update tick
         * @param time elapsed time
         */
        public function update(elapsedTime:Number):void
        {
            // TODO update paddle
            _paddle.update(elapsedTime);

            // TODO update ball
            var ballBoundRect:Rectangle;
            for each (var ball:Ball in _balls)
            {
                // TODO check collision between ball & paddle
                ballBoundRect = ball.boundRect;

                // check collision between ball & wall
                if ((ballBoundRect.left < 0) || ((ballBoundRect.right) > _areaWidth))
                {
                    // bounce
                    ball.speedX *= -1;

                    _score += 100;
                }
                if (ballBoundRect.top < 0)
                {
                    // bounce
                    ball.speedY *= -1;

                    _score += 100;
                }
                else if (ballBoundRect.top > _areaHeight)
                {
                    // lost a ball
                    _score -= 100;

                    // TODO notify reset game
                    resetObjects();
                    return;
                }

                // TODO check collision between ball & bricks

                ball.update(elapsedTime);
            }
        }

    }

}
