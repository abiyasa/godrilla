package godrilla.commands
{
    import robotlegs.bender.bundles.mvcs.Command;
    import starling.core.Starling;
    import starling.display.Stage;
    import starling.display.Sprite;
    import godrilla.events.ChangeScreenEvent;
    import godrilla.views.MainScreenView;

    /**
     * Command for changing the active screen
     * @author abiyasa
     */
    public class ChangeScreenCommand extends Command
    {
        [Inject]
        public var starling:Starling;

        [Inject]
        public var event:ChangeScreenEvent;

        public function ChangeScreenCommand()
        {
            super();
        }

        public override function execute():void
        {
            trace(this + ", " + "execute()");

            // init the new screen
            var newScreen:Sprite;
            switch (event.screenName)
            {
            case 'main':
                newScreen = new MainScreenView();
                break;

            case 'play':
                // TODO init the play screen
                break;
            }

            // change screen
            if (newScreen != null)
            {
                starling.stage.removeChildren();
                starling.stage.addChild(newScreen);
            }
        }
    }

}
