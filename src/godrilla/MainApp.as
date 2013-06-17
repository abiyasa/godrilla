package godrilla
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    import starling.core.Starling;
    import godrilla.views.ContextView;

    /**
     * The main application file
     *
     * @author abiyasa
     */
    public class MainApp extends Sprite
    {
        public function MainApp()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            init();
        }

        private function init():void
        {
            const starling:Starling = new Starling(ContextView, stage);
            //starling.showStats = true;
            starling.start();
        }
    }
}
