package godrilla.mediators
{
    import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;
    import starling.display.DisplayObjectContainer;
    import starling.events.Event;
    import godrilla.events.ChangeScreenEvent;

    /**
     * Mediator for the game screen view
     * @author abiyasa
     */
    public class GameScreenViewMediator extends StarlingMediator
    {
        public function GameScreenViewMediator()
        {
            super();
        }

        override public function initialize():void
        {
            super.initialize();
            trace(this + ", " + "initialise()");

            var screen:DisplayObjectContainer = this.viewComponent as DisplayObjectContainer;
            screen.addEventListener(Event.SELECT, onViewSelect);
        }

        override public function destroy():void
        {
            var screen:DisplayObjectContainer = this.viewComponent as DisplayObjectContainer;
            screen.removeEventListeners();

            super.destroy();
            trace(this + ", " + "destroy()");
        }

        protected function onViewSelect(event:Event):void
        {
            // map to flash event
            var flashEvent:ChangeScreenEvent = new ChangeScreenEvent(ChangeScreenEvent.CHANGE, event.data as String);

            this.eventDispatcher.dispatchEvent(flashEvent);
        }
    }
}
