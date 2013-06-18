package godrilla.game
{
    import flash.geom.Rectangle;
    import godrilla.game.objects.Ball;
    import godrilla.game.objects.Paddle;
    import starling.display.DisplayObjectContainer;
    import starling.events.Touch;
    import starling.events.TouchEvent;

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

        // last touch/mouse position
        private var _touchX:Number;

        // last touch/mouse position
        private var _touchY:Number;

        // for more Touch interaction
        private var _touch:Touch;

        /**
         * The game status
         * @see Constants STATUS_XXX
         */
        public function get status():int { return _status; }

        // game arena
        private var _gameArea:Rectangle;

        public function Engine(stage:DisplayObjectContainer, width:int, height:int)
        {
            super();
            _stage = stage;

            // init game arena with padding
            var padding:int = 0;
            _gameArea = new Rectangle(padding, padding, width - (2 * padding), height - (2 * padding));

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
            _touchX = _gameArea.left + (_gameArea.width / 2);
            _touchY = _gameArea.top + (_gameArea.height * 0.7);

            resetObjects();

            _stage.stage.addEventListener(TouchEvent.TOUCH, onTouch);
        }

        /**
         * Resets the game objects
         */
        protected function resetObjects():void
        {
            // reset ball
            for each (var ball:Ball in _balls)
            {
                ball.reset(_gameArea);
            }

            // reset paddle
            _paddle.reset(_gameArea);
        }

        /**
         * Stops and destroy the game engine
         */
        public function stop():void
        {
            _status = STATUS_STOP;

            _stage.stage.removeEventListener(TouchEvent.TOUCH, onTouch);
        }

        /**
         * Update tick
         * @param time elapsed time
         */
        public function update(elapsedTime:Number):void
        {
            // update paddle
            _paddle.moveTo(_touchX, _touchY);
            _paddle.update(elapsedTime);
            var paddleBoundRect:Rectangle = _paddle.boundRect;

            // update balls
            var ballBoundRect:Rectangle;
            for each (var ball:Ball in _balls)
            {
                ballBoundRect = ball.boundRect;

                // check collision between ball & paddle
                if (paddleBoundRect.intersects(ballBoundRect) && (ball.speedY > 0))
                {
                    // advanced calculation to define bounce angle
                    var ballMidX:int = ballBoundRect.left + (ballBoundRect.width / 2);
                    var paddleMidX:int = paddleBoundRect.left + (paddleBoundRect.width / 2);
                    var distance:Number = (ballMidX - paddleMidX) / (paddleBoundRect.width / 2);
                    var bounceX:Number;
                    var bounceY:Number;
                    if ((distance < -0.7) || (distance > 0.7))
                    {
                        bounceX = -1;
                        bounceY = -1;
                    }
                    else if (((distance > -0.7) && (distance < -0.5)) ||
                        ((distance > 0.5) && (distance < 0.7)))
                    {
                        bounceX = -0.5;
                        bounceY = -1.5;
                    }
                    else
                    {
                        bounceX = 1.0;
                        bounceY = -1.0;
                    }

                    // bounce
                    ball.speedX *= bounceX;
                    ball.speedY *= bounceY;

                    // TODO update ball posY to prevent ball sticking on the paddle

                    _score += 200;
                }

                // check collision between ball & wall
                if ((ballBoundRect.left < _gameArea.left) || ((ballBoundRect.right) > _gameArea.right))
                {
                    // bounce
                    ball.speedX *= -1;

                    _score += 100;
                }
                if (ballBoundRect.top < _gameArea.top)
                {
                    // bounce
                    ball.speedY *= -1;

                    _score += 100;
                }
                else if (ballBoundRect.top > _gameArea.bottom)
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

        /**
         * Handles touch or mouse move event
         * @param event
         */
        private function onTouch(event:TouchEvent):void
        {
            _touch = event.getTouch(_stage.stage);
            if (_touch != null)
            {
                _touchX = _touch.globalX;
                _touchY = _touch.globalY;
            }
        }
    }

}
