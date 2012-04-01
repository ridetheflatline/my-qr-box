package com.wang.qr {

    /**
     * QR相关处理结果.
     */
    public class QRResult {

        /* 系统信息 */
        /** 系统异常ID. */
        public static const SYS_ID_EXCEPTION:int = -1;
        public static const SYS_MSG_EXCEPTION:String = "系统异常！";

        /* QR码创建消息. */
        /** QR创建处理结果ID 创建成功. */
        public static const RESULT_ID_MAKE_QR_SUCCESS:int = 1;
        /** QR创建处理结果内容 创建成功. */
        public static const RESULT_MSG_MAKE_QR_SUCCESS:String = "QR码创建成功！";
        
        /** QR创建处理结果ID 异常 创建过程中异常. */
        public static const RESULT_ID_MAKE_QR_EXCEPTION:int = 2;
        /** QR创建处理结果内容 异常 创建过程中异常. */
        public static const RESULT_MSG_MAKE_QR_EXCEPTION:String = "QR码创建异常，请重试！";

        /** QR创建处理结果ID 异常 未能生成QR. */
        public static const RESULT_ID_MAKE_QR_NULL:int = 3;
        /** QR创建处理结果内容 异常 未能生成QR. */
        public static const RESULT_MSG_MAKE_QR_NULL:String = "QR码创建未成功，请重试！";

        /* QR码解析消息. */
        /** QR解析结果ID 能够正常识别. */
        public static const RESULT_ID_READ_QR_IS_OK:int = 101;
        /** QR解析结果内容 能够正常识别. */
        public static const RESULT_MSG_READ_QR_IS_OK:String = "QR码识别正常！";

        /** QR解析结果ID 异常 无法正常识别. */
        public static const RESULT_ID_READ_QR_EXCEPTION:int = 102;
        /** QR解析结果内容 异常 无法正常识别. */
        public static const RESULT_MSG_READ_QR_EXCEPTION:String = "QR码无法识别！";

        /** QR解析结果ID 异常 无被识别图像. */
        public static const RESULT_ID_READ_QR_NO_IMG:int = 103;
        /** QR解析结果内容 异常 无被识别图像. */
        public static const RESULT_MSG_READ_QR_NO_IMG:String = "QR码图像读取失败！";

        /** QR解析结果ID 异常 空结果. */
        public static const RESULT_ID_READ_QR_NULL:int = 104;
        /** QR解析结果内容 异常 空结果. */
        public static const RESULT_MSG_READ_QR_NULL:String = "QR码图像解析结果为空！";

        /* QR码内容检查消息. */
        /** QR码内容检查检查结果ID 正常. */
        public static const RESULT_ID_CONTENT_IS_OK:int = 201;

        /** QR码内容检查结果ID 异常 内容为空. */
        public static const RESULT_ID_CONTENT_IS_NULL:int = 202;
        /** QR码内容检查结果ID 异常 内容为空. */
        public static const RESULT_MSG_CONTENT_IS_NULL:String = "QR码内容不能为空！";

        /** QR码内容检查结果ID 异常 URL内容格式不正确. */
        public static const RESULT_ID_CONTENT_IS_NOT_URL:int = 203;
        /** QR码内容检查结果ID 异常 URL内容格式不正确. */
        public static const RESULT_MSG_CONTENT_IS_NOT_URL:String = "网址必须以http://或https://开始并确认网址格式！";

        /** QR码内容检查结果ID 异常 名片姓、名为空. */
        public static const RESULT_ID_CONTENT_IS_NO_FN_N:int = 204;
        /** QR码内容检查结果ID 异常 名片姓、名为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_FN_N:String = "姓、名至少填写一项！";

        /** QR码内容检查结果ID 异常 手机内容为空. */
        public static const RESULT_ID_CONTENT_IS_NO_MOBILE:int = 205;
        /** QR码内容检查结果ID 异常 手机内容为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_MOBILE:String = "手机号码不能为空！";

        /** QR码内容检查结果ID 异常 手机号码内容不正确. */
        public static const RESULT_ID_CONTENT_IS_NOT_MOBILE:int = 206;
        /** QR码内容检查结果ID 异常 手机号码内容不正确. */
        public static const RESULT_MSG_CONTENT_IS_NOT_MOBILE:String = "手机号码格式不正确！";

        /** QR码内容检查结果ID 异常 电话号码内容不正确. */
        public static const RESULT_ID_CONTENT_IS_NOT_TEL:int = 207;
        /** QR码内容检查结果ID 异常 电话号码内容不正确. */
        public static const RESULT_MSG_CONTENT_IS_NOT_TEL:String = "电话号码格式不正确！";

        /** QR码内容检查结果ID 异常 电话号码内容不正确. */
        public static const RESULT_ID_CONTENT_IS_NOT_EMAIL:int = 208;
        /** QR码内容检查结果ID 异常 电话号码内容不正确. */
        public static const RESULT_MSG_CONTENT_IS_NOT_EMAIL:String = "Email格式不正确！";

        /** QR码内容检查结果ID 异常 传真号码内容不正确. */
        public static const RESULT_ID_CONTENT_IS_NOT_FAX:int = 209;
        /** QR码内容检查结果ID 异常 传真号码内容不正确. */
        public static const RESULT_MSG_CONTENT_IS_NOT_FAX:String = "传真格式不正确！";

        /** QR码内容检查结果ID 异常 邮编号码内容不正确. */
        public static const RESULT_ID_CONTENT_IS_NOT_ZIP:int = 210;
        /** QR码内容检查结果ID 异常 邮编号码内容不正确. */
        public static const RESULT_MSG_CONTENT_IS_NOT_ZIP:String = "邮编格式不正确！";

        /** QR码内容检查结果ID 异常 日历标题为空. */
        public static const RESULT_ID_CONTENT_IS_NO_CAL_TITLE:int = 211;
        /** QR码内容检查结果ID 异常 日历标题为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_CAL_TITLE:String = "标题不能为空！";

        /** QR码内容检查结果ID 异常 日历内容为空. */
        public static const RESULT_ID_CONTENT_IS_NO_CAL_CONTENT:int = 212;
        /** QR码内容检查结果ID 异常 日历内容为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_CAL_CONTENT:String = "内容不能为空！";

        /** QR码内容检查结果ID 异常 日历开始日期为空. */
        public static const RESULT_ID_CONTENT_IS_NO_CAL_FROMDATE:int = 213;
        /** QR码内容检查结果ID 异常 日历开始日期为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_CAL_FROMDATE:String = "开始日期不能为空！";

        /** QR码内容检查结果ID 异常 短信彩信消息内容为空. */
        public static const RESULT_ID_CONTENT_IS_NO_SMS_MMS_TEXT:int = 214;
        /** QR码内容检查结果ID 异常 短信彩信消息内容为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_SMS_MMS_TEXT:String = "消息内容不能为空！";

        
        /** QR码内容检查结果ID 异常 邮件内容为空. */
        public static const RESULT_ID_CONTENT_IS_NO_EMAIL_TEXT:int = 215;
        /** QR码内容检查结果ID 异常 邮件内容为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_EMAIL_TEXT:String = "邮件内容不能为空！";

        /** QR码内容检查结果ID 异常 电话号码为空. */
        public static const RESULT_ID_CONTENT_IS_NO_TELNO:int = 216;
        /** QR码内容检查结果ID 异常 电话号码为空. */
        public static const RESULT_MSG_CONTENT_IS_NO_TELNO:String = "电话号码不能为空！";

        /** 消息ID. */
        private var msgId:int;

        /** 消息内容. */
        private var msgStr:String;

        /**
         * 构造方法.
         * @param _id 消息ID
         * @param _msg 消息内容
         */
        public function QRResult(_id:int=0, _msg:String=null) {
            this.msgId = _id;
            this.msgStr = _msg;
        }

        /**
         * 返回消息ID.
         * @return 消息ID
         */
        public function getMsgId():int {
            return msgId;
        }

        /**
         * 设置消息ID.
         * @param _val 消息ID
         */
        public function setMsgId(_val:int):void {
            this.msgId = _val;
        }

        /**
         * 获得消息内容.
         * @return 消息内容
         */
        public function getMsgStr():String {
            return msgStr;
        }

        /**
         * 设置消息内容.
         * @param _val 消息内容
         */
        public function setMsgStr(_val:String):void {
            this.msgStr = _val;
        }
    }
}