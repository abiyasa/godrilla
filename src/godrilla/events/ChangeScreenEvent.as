package godrilla.events
{
    import flash.events.Event;

    /**
     * Event to trigger changing active screen
     * @author abiyasa
     */
    public class ChangeScreenEvent extends Event
    {
        public static const CHANGE:String = "CHANGE";

        protected var _screenName:String;

        /** The name of target screen */
        public function get screenName():String { return _screenName; }

        public function ChangeScreenEvent(type:String, screenName:String = null)
        {
            super(type, false, false);
            _screenName = screenName;
        }

        public override function clone():Event
        {
            return new ChangeScreenEvent(type, _screenName);
        }

        public override function toString():String
        {
            return formatToString("ChangeScreenEvent", "type", "bubbles", "cancelable", "eventPhase");
        }
    }

}
