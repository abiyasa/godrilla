package godrilla.mediators
{
    import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;
    import starling.display.DisplayObjectContainer;
    import starling.events.Event;
    import godrilla.events.ChangeScreenEvent;

    /**
     * Mediator for the main view
     * @author abiyasa
     */
    public class MainViewMediator extends StarlingMediator
    {
        public function MainViewMediator()
        {
            super();
        }

        override public function initialize():void
        {
            super.initialize();
            trace(this + ", " + "initialise()");

            // start the first screen
            this.eventDispatcher.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE, 'main'));
        }

        override public function destroy():void
        {
            super.destroy();
            trace(this + ", " + "destroy()");
        }

    }
}
