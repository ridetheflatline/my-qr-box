package com.wang.qr {

    import com.google.zxing.qrcode.encoder.QRCode;

	/**
	 * QR Code 模型.
	 */
    public class QRCodeModel {

        /** 默认前景色. */
        public static const DEF_FRONT_COLOR:int = 0x000000;

        /** 默认背景色. */
        public static const DEF_BG_COLOR:int = 0xffffff;

        /** 默认每个点的大小. */
        public static const DEF_DOT_SCALE:int = 6;

        /** 默认每个点的圆角. */
        public static const DEF_RADIUS:int = 0;

        /** QR描述模型. */
        private static var ins:QRCodeModel = null;

        /**
         * 构造方法.
         */
        public function QRCodeModel() {
        }

        /**
         * 获得QR描述模型对象.
         */
        public static function getInstance():QRCodeModel {
            if (null == ins) {
                ins = new QRCodeModel();
            }
            return ins;
        }

        /**
         * QR Code内容。
         */
        private var codeContent:String;

        /**
         * 获取QR内容.
         */
        public function getCodeContent():String {
            return codeContent;
        }

        /**
         * 设置QR内容。
         */
        public function setCodeContent(val:String):void {
            this.codeContent = val;
        }

        /**
         * QR Code 矩阵描述。
         */
        private var codeData:QRCode;

        /**
         * 获取QRCode矩阵描述。
         */
        public function getCodeData():QRCode {
            return codeData;
        }

        /**
         * 设置QRCode矩阵描述。
         */
        public function setCodeData(val:QRCode):void {
            this.codeData = val;
        }

    }
}