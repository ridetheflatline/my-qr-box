

import com.wang.online.PageModel;
import com.wang.util.StrUtil;

import flash.events.MouseEvent;

import spark.components.Label;
import spark.components.TextArea;
import spark.components.supportClasses.SkinnableTextBase;

/**
 * 初始化页面.
 */
private function initPage():void {
    // 初始化各参数
    PageModel.init();
    /* QR Code 输入部分 */
    // 默认选择输入URL
    this.itemInputType.selectedIndex = PageModel.selectedInput;
    selectInputType();
    // 名片默认使用vCard
    //this.inputVCard.selected = true;
}

/**
 * 选择输入内容的种类.
 */
private function selectInputType():void {
    if (-1 < this.itemInputType.selectedIndex) {
        this.itemInputContent.selectedIndex = this.itemInputType.selectedIndex;
        PageModel.selectedInput = this.itemInputType.selectedIndex;
    }
}

/**
 * 当输入类别变换后，针对各输入类别进行个性化设定.
 * 主要用于设定输入框还能输入多少字的检查
 */
private function afterInputChanged():void {
    // 当输入普通文本时
    if (1 == this.itemInputContent.selectedIndex) {
        checkInputLeftByByte(this.inputText, this.inputTextLeft, 600);
        // 当输入名片时
    } else if (2 == this.itemInputContent.selectedIndex) {
        if (!this.inputVCard.selected && !this.inputMeCard.selected) {
            this.inputVCard.selected = true;
        }
        // 当输入短信时
    } else if (4 == this.itemInputContent.selectedIndex) {
        checkInputLeftByChar(this.inputSMSMsg, this.inputSMSLeft, 70);
    }
}

/**
 * 对于有字数限制的输入框，判断还能够输入多少字，按照Byte计算.
 * @param _input 输入框
 * @param _display 显示信息的标签
 * @param _limit 限制的字数
 */
private function checkInputLeftByByte(_input:SkinnableTextBase, _display:Label, _limit:int):void {
    var strLeft:int = _limit;
    if (null != _input) {
        strLeft = _limit - StrUtil.bitLen(_input.text);
    }
    if (0 > strLeft) {
        _display.setStyle("color", 0xff0000);
    } else {
        _display.setStyle("color", 0x000000);
    }
    _display.text = "还能输入" + StrUtil.LINE_SPLIT
        + " 英文字符:" + strLeft.toString() + StrUtil.LINE_SPLIT
        + " 中文字符:" + Math.floor(strLeft / 3).toString();
}

/**
 * 对于有字数限制的输入框，判断还能够输入多少字，按照字符计算.
 * @param _input 输入框
 * @param _display 显示信息的标签
 * @param _limit 限制的字数
 */
private function checkInputLeftByChar(_input:SkinnableTextBase, _display:Label, _limit:int):void {
    var strLeft:int = _limit;
    if (null != _input) {
        strLeft = _limit - _input.text.length;
    }
    if (0 > strLeft) {
        _display.setStyle("color", 0xff0000);
    } else {
        _display.setStyle("color", 0x000000);
    }
    _display.text = "还能输入 " + strLeft.toString() + " 个字符";
}