/**
 * Created by irgaly on 2013/08/05.
 */
package views {

import spark.components.IconItemRenderer;

public class TimelineListItemRenderer extends IconItemRenderer {
    public function TimelineListItemRenderer() {
        super();

        // データフィールドの指定
        iconField = "icon";
        labelField = "text";
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
        super.layoutContents(unscaledWidth, unscaledHeight);
        // ラベル表示位置
        setElementPosition(labelDisplay, 100, 0);
        setElementSize(labelDisplay, unscaledWidth - 20, unscaledHeight - 20);
    }

    /**
     * データの設定
     */
    override public function set data(value:Object):void {
        super.data = value;
    }
}
}
