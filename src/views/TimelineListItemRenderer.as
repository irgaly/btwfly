/**
 * Created by irgaly on 2013/08/05.
 */
package views {

import flash.text.FontStyle;

import mx.graphics.BitmapFillMode;
import mx.graphics.BitmapScaleMode;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;

import spark.components.IconItemRenderer;
import spark.layouts.VerticalAlign;

public class TimelineListItemRenderer extends IconItemRenderer {
    /** アイコンサイズ */
    private const ICON_SIZE = 60;
    /** 四方のパディング */
    private const PADDING = 5;
    /** message スタイル名 */
    private const MESSAGE_STYLE_NAME = "TimelineListItemRendererMessageStyle";

    public function TimelineListItemRenderer() {
        super();

        // データフィールドの指定
        iconField = "icon";
        labelField = "text";
        messageField = "message";

        // 設定
        setStyle("iconDelay", 1000);  // iconロードの遅延時間
        setStyle("paddingLeft", PADDING);
        setStyle("paddingRight", PADDING);
        setStyle("paddingTop", PADDING);
        setStyle("paddingBottom", PADDING);
        // TODO : アンチエイリアス効いてない？ see: http://stackoverflow.com/a/1030322
        iconFillMode = BitmapFillMode.SCALE; // Viewに合わせて拡縮
        iconScaleMode = BitmapScaleMode.ZOOM; // アスペクト比維持                    
        iconWidth = ICON_SIZE;
        iconHeight = ICON_SIZE;
        setStyle("fontSize", 14);
        setStyle("color", 0x000000);
        setStyle("fontWeight", FontStyle.BOLD);
        setStyle("verticalAlign", VerticalAlign.TOP);
        setStyle("horizontalGap", 5);
        var style:CSSStyleDeclaration = new CSSStyleDeclaration();
        style.defaultFactory = function():void {
            //noinspection JSUnusedGlobalSymbols
            this.fontSize = 16;
            //noinspection JSUnusedGlobalSymbols
            this.color = 0x000000;
            //noinspection JSUnusedGlobalSymbols
            this.fontWeight = FontStyle.REGULAR;
        }
        StyleManager.getStyleManager(null).setStyleDeclaration("." + MESSAGE_STYLE_NAME, style, true);
        setStyle("messageStyleName", MESSAGE_STYLE_NAME);
    }

    /**
     * 独自の表示要素の追加生成
     */
    override protected function createChildren():void {
        super.createChildren();
    }

    /**
     * レイアウト指定
     * @param unscaledWidth View全体の横幅？
     * @param unscaledHeight View全体の縦幅？
     */
    override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void {
        // IconItemRenderer 標準UIの配置
        super.layoutContents(unscaledWidth, unscaledHeight);

        // ラベル表示位置
        //setElementPosition(labelDisplay, 100, 0);
        //setElementSize(labelDisplay, unscaledWidth - 20, unscaledHeight - 20);
    }

    /**
     * データの設定
     */
    override public function set data(value:Object):void {
        value.text = String(value.text).replace(/[\r\n]/g, '');
        super.data = value;
    }
}
}
