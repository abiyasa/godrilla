package godrilla
{
    import org.swiftsuspenders.Injector;
    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
    import robotlegs.bender.framework.api.IConfig;
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.api.IInjector;
    import godrilla.events.ChangeScreenEvent;
    import godrilla.commands.ChangeScreenCommand;
    import godrilla.views.MainView;
    import godrilla.views.MainScreenView;
    import godrilla.mediators.MainViewMediator;
    import godrilla.mediators.MainScreenViewMediator;

    /**
     * The configuration for the app
     * @author abiyasa
     */
    public class MainConfig implements IConfig
    {
        [Inject]
        public var context:IContext;

        [Inject]
        public var injector:IInjector;

        [Inject]
        public var mediatorMap:IMediatorMap;

        [Inject]
        public var commandMap:IEventCommandMap;

        public function configure() : void
        {
            // map views
            this.mediatorMap.map(MainView).toMediator(MainViewMediator);
            this.mediatorMap.map(MainScreenView).toMediator(MainScreenViewMediator);

            // map commands
            commandMap.map(ChangeScreenEvent.CHANGE).toCommand(ChangeScreenCommand);
        }
    }
}
