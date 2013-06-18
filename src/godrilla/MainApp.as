package godrilla
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.bundles.mvcs.MVCSBundle;
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.impl.Context;
    import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

    import starling.core.Starling;
    import godrilla.views.MainView;

    /**
     * The main application file
     *
     * @author abiyasa
     */
    public class MainApp extends Sprite
    {
        private var _context:IContext;

        public function MainApp()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            init();
        }

        private function init():void
        {
            // init starling
            const starling:Starling = new Starling(MainView, stage);
            starling.showStats = true;
            starling.start();

            // init aplication context
            _context = new Context()
                .install(MVCSBundle, StarlingViewMapExtension)
                .configure(MainConfig, new ContextView(this), starling);
        }
    }
}
