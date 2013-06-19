package godrilla.game.objects
{
    import flash.geom.Rectangle;
    import starling.display.Image;
    import starling.display.Quad;
    import starling.display.Sprite;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    /**
     * Brick to destroy
     * @author abiyasa
     */
    public class Brick extends BaseGameObject
    {
        [Embed(source="../../../../assets/buildings.png")]
        public static const TEXTURE_BUILDINGS:Class;

        [Embed(source="../../../../assets/buildings.xml", mimeType="application/octet-stream")]
        public static const TEXTURE_ATLAS_BUILDINGS:Class;

        public static var textureAtlas:TextureAtlas;

        private static var BUILDING_NAMES:Array = [ "building01", "building02", "building03", "building04" ];

        public function Brick()
        {
            super();

            // init paddle
            _type = TYPE_BRICK;
            _width = 60;
            _height = 40;

            initSprite();
        }

        private function initSprite():void
        {
            // init texture atlas
            if (Brick.textureAtlas == null)
            {
                var texture:Texture = Texture.fromBitmap(new TEXTURE_BUILDINGS());
                var textureAtlasXml:XML = XML(new TEXTURE_ATLAS_BUILDINGS());

                Brick.textureAtlas = new TextureAtlas(texture, textureAtlasXml);
            }

            // pick a random building texture
            var idx:int = Math.random() * BUILDING_NAMES.length;
            var buildingTexture:Texture = Brick.textureAtlas.getTexture(BUILDING_NAMES[idx]);

            // create simple & random building shape
            _displayObject = new Sprite();
            var building:Image = new Image(buildingTexture);

            // random tall & wide
            var tallnessFactor:Number = 1 + (Math.random() * 1.5);
            var widenessFactor:Number = 0.9 + (Math.random() * 0.1);
            building.width = _width * widenessFactor;
            building.height = _height * tallnessFactor;
            building.y = -(_height * (tallnessFactor - 1));
            building.x = -(_width - building.width) / 2;

            _displayObject.addChild(building);
        }

        /**
         * Resets brick
         */
        override public function reset(gameArena:Rectangle):void
        {
            boundRect = new Rectangle(posX, posY, _width, _height);
            updateDisplayObject();
        }

    }

}