package com.wang.qr.common {

    /**
     * QR相关处理结果.
     */
    public class QRResult {

        /** QR创建处理结果ID 创建成功. */
        public static const MSG_ID_MAKE_SUCCESS:int = 0;
        /** QR创建处理结果内容 创建成功. */
        public static const MSG_STR_MAKE_SUCCESS:String = "QR码创建成功！";
        
        /** QR创建处理结果ID 异常 无内容. */
        public static const MSG_ID_MAKE_NO_CONTENT:int = 1;
        /** QR创建处理结果内容 异常 无内容. */
        public static const MSG_STR_MAKE_NO_CONTENT:String = "请先输入QR码的内容！";
        
        /** QR创建处理结果ID 异常 创建过程中异常. */
        public static const MSG_ID_MAKE_EXCEPTION:int = 2;
        /** QR创建处理结果内容 异常 创建过程中异常. */
        public static const MSG_STR_MAKE_EXCEPTION:String = "QR码创建异常，请重试！";

        /** QR创建处理结果ID 异常 未能生成QR. */
        public static const MSG_ID_MAKE_NULL:int = 3;
        /** QR创建处理结果内容 异常 未能生成QR. */
        public static const MSG_STR_MAKE_NULL:String = "QR码创建未成功，请重试！";

        /** QR测试结果ID 能够正常识别. */
        public static const MSG_ID_CODE_IS_CURRECT:int = 101;
        /** QR测试结果内容 能够正常识别. */
        public static const MSG_STR_CODE_IS_CURRECT:String = "QR码识别正常！";

        /** QR测试结果ID 异常 无法正常识别. */
        public static const MSG_ID_CODE_CHECK_EXCEPTION:int = 102;
        /** QR测试结果内容 异常 无法正常识别. */
        public static const MSG_STR_CODE_CHECK_EXCEPTION:String = "QR码无法识别！";

        /** QR测试结果ID 异常 无被识别图像. */
        public static const MSG_ID_CODE_NO_CHECK_IMG:int = 103;
        /** QR测试结果内容 异常 无被识别图像. */
        public static const MSG_STR_CODE_NO_CHECK_IMG:String = "QR码图像读取失败！";

        /** QR测试结果ID 异常 无结果. */
        public static const MSG_ID_CODE_NO_RESULT:int = 104;
        /** QR测试结果内容 异常 无结果. */
        public static const MSG_STR_CODE_NO_RESULT:String = "QR码图像解析无内容！";

        /** 消息ID. */
        private var msgId:int;

        /** 消息内容. */
        private var msgStr:String;

        /**
         * 构造方法.
         */
        public function QRResult() {
        }

        /**
         * 构造方法.
         * @param _id 消息ID
         * @param _msg 消息内容
         */
        public function QRResult(_id:int, _msg:String) {
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