part of example;

class display_01_alpha_mask extends State {
  preload() {

    game.load.image('pic', 'assets/pics/questar.png');
    game.load.image('mask', 'assets/pics/mask-test2.png');

  }

  create() {

    game.stage.backgroundColor = 0x4d4d4d;

    TextStyle ts = new TextStyle(font:'16px Arial', fill: '#ffffff');

    game.add.text(64, 10, 'Source image', ts);
    game.add.image(64, 32, 'pic');

    game.add.text(400, 10, 'Alpha mask', ts);
    game.add.image(400, 32, 'mask');

    //	Create a new bitmap data the same size as our picture
    BitmapData bmd = game.make.bitmapData(320, 256);

    //	And create an alpha mask image by combining pic and mask from the cache
    bmd.alphaMask('pic', 'mask');

    //	A BitmapData is just a texture. You need to apply it to a sprite or image
    //	to actually display it:
    game.add.image(game.world.centerX, 320, bmd).anchor.set(0.5, 0);

  }
}
