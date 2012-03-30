import com.wang.online.PageModel;
import com.wang.qr.QRResult;
import com.wang.util.StrUtil;

import flash.events.MouseEvent;

import mx.controls.Alert;

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

/**
 * 创建QR码.
 * @param _evt 鼠标点击事件
 */
protected function createQRCode(event:MouseEvent):void {
    // 根据内容不同，组合内容参数
    // QR内容
    var qrContent:String = null;
    // 获取内容结果代码
    var r:int = -999;
    // 根据不同的输入组织不同的内容
    // 网址
    if (0 == this.itemInputContent.selectedIndex) {
        r = makeURLContent(qrContent);
        // 文本
    } else if (1 == this.itemInputContent.selectedIndex) {
        r = makeTextContent(qrContent);
        // 名片
    } else if (2 == this.itemInputContent.selectedIndex) {
        r = makeBusinessCardContent(qrContent);
        // 日程
    } else if (3 == this.itemInputContent.selectedIndex) {
        
        // 短信
    } else if (4 == this.itemInputContent.selectedIndex) {
        
        // 彩信
    } else if (5 == this.itemInputContent.selectedIndex) {
        
        // 邮件
    } else if (6 == this.itemInputContent.selectedIndex) {
        
        // 电话
    } else if (7 == this.itemInputContent.selectedIndex) {
        
    } else {
        r = QRResult.SYS_ID_EXCEPTION;
    }
    // 内容检查错误提示
    if (QRResult.SYS_ID_EXCEPTION == r) {
        Alert.show(QRResult.SYS_MSG_EXCEPTION, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NULL == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NULL, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NOT_URL == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NOT_URL, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NO_FN_N == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NO_FN_N, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NO_MOBILE == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NO_MOBILE, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NOT_MOBILE == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NOT_MOBILE, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NOT_EMAIL == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NOT_EMAIL, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NOT_TEL == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NOT_TEL, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NOT_FAX == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NOT_FAX, "错误");
        return;
    } else if (QRResult.RESULT_ID_CONTENT_IS_NOT_ZIP == r) {
        Alert.show(QRResult.RESULT_MSG_CONTENT_IS_NOT_ZIP, "错误");
        return;
    }
}

/**
 * 获取URL内容.
 * @param _txt 内容
 * @return 获取结果ID
 */
private function makeURLContent(_txt:String):int {
    _txt = null;
    if (null == this.inputURL || StrUtil.isNullStr(this.inputURL.text)) {
        return QRResult.RESULT_ID_CONTENT_IS_NULL;
    } else if (StrUtil.isURLStr(this.inputURL.text)) {
        _txt = StrUtil.trim(this.inputURL.text);
    } else {
        return QRResult.RESULT_ID_CONTENT_IS_NOT_URL;
    }
    return QRResult.RESULT_ID_CONTENT_IS_OK;
}

/**
 * 获取文本内容.
 * @param _txt 内容
 * @return 获取结果ID
 */
private function makeTextContent(_txt:String):int {
    _txt = null;
    if (null == this.inputText || StrUtil.isNullStr(this.inputText.text)) {
        return QRResult.RESULT_ID_CONTENT_IS_NULL;
    } else {
        _txt = StrUtil.trim(this.inputText.text);
    }
    return QRResult.RESULT_ID_CONTENT_IS_OK;
}

/**
 * 获取名片内容.
 * @param _txt 内容
 * @return 获取结果ID
 */
private function makeBusinessCardContent(_txt:String):int {
    _txt = null;
    // 姓、名必填一项
    if ((null == this.inputFamilyName || StrUtil.isNullStr(this.inputFamilyName.text))
        && (null == this.inputName || StrUtil.isNullStr(this.inputName.text))) {
        return QRResult.RESULT_ID_CONTENT_IS_NO_FN_N;
        // 手机号码必填
    } else if (null == this.inputMobile || StrUtil.isNullStr(this.inputMobile.text)) {
        return QRResult.RESULT_ID_CONTENT_IS_NO_MOBILE;
        // 当输入电话号码时，检查电话号码格式
    } else if (!StrUtil.isTelStr(StrUtil.trim(this.inputMobile.text))) {
        return QRResult.RESULT_ID_CONTENT_IS_NOT_MOBILE;
        // 当输入电话号码时，检查电话号码格式
    } else if (null != this.inputTel
                && !StrUtil.isNullStr(this.inputTel.text)
                && !StrUtil.isTelStr(StrUtil.trim(this.inputTel.text))) {
        return QRResult.RESULT_ID_CONTENT_IS_NOT_TEL;
        // 当输入邮箱时，检查邮箱格式
    } else if (null != this.inputEmail
        && !StrUtil.isNullStr(this.inputEmail.text)
        && !StrUtil.isEmailStr(StrUtil.trim(this.inputEmail.text))) {
        return QRResult.RESULT_ID_CONTENT_IS_NOT_EMAIL;
        // 当输入链接地址时，检查链接格式
    } else if (null != this.inputLink
        && !StrUtil.isNullStr(this.inputLink.text)
        && !StrUtil.isURLStr(StrUtil.trim(this.inputLink.text))) {
        return QRResult.RESULT_ID_CONTENT_IS_NOT_URL;
        // 当输入传真时，检查传真格式
    } else if (null != this.inputFax
        && !StrUtil.isNullStr(this.inputFax.text)
        && !StrUtil.isTelStr(StrUtil.trim(this.inputFax.text))) {
        return QRResult.RESULT_ID_CONTENT_IS_NOT_FAX;
        // 当输入邮编时，检查邮编格式
    } else if (null != this.inputZip
        && !StrUtil.isNullStr(this.inputZip.text)
        && !StrUtil.isZipStr(StrUtil.trim(this.inputZip.text))) {
        return QRResult.RESULT_ID_CONTENT_IS_NOT_ZIP;
    } else {
        var cardItems:Array = new Array();
        if (this.inputVCard.selected) {
            
        } else if (this.inputMeCard.selected) {
            
        } else {
            
        }
        //_txt = this.inputText.text;
    }
    return QRResult.RESULT_ID_CONTENT_IS_OK;
}