package com.wang.qr {
    import com.google.zxing.BarcodeFormat;
    import com.google.zxing.BinaryBitmap;
    import com.google.zxing.BufferedImageLuminanceSource;
    import com.google.zxing.DecodeHintType;
    import com.google.zxing.EncodeHintType;
    import com.google.zxing.MultiFormatReader;
    import com.google.zxing.Result;
    import com.google.zxing.common.GlobalHistogramBinarizer;
    import com.google.zxing.common.flexdatatypes.HashTable;
    import com.google.zxing.qrcode.QRCodeWriter;
    import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
    import com.google.zxing.qrcode.encoder.QRCode;
    import com.wang.util.StrUtil;
    
    import flash.display.BitmapData;

    /**
     * QR Code 创建者及验证者.
     */
    public class QRCodeMaker {

        /** QR Code 创建器。 */
        private static var qrWriter:QRCodeWriter = new QRCodeWriter();

        /** QR Code 解析器. */
        private static var qrReader:MultiFormatReader = new MultiFormatReader();

        /**
         * 构造方法。
         */
        public function QRCodeMaker() {
        }

        /**
         * 创建QR Code.
         * @return QR创建处理结果ID
         */ 
        public static function buildQRCode():int {
            // 没有内容 
            if (StrUtil.isNullStr(QRCodeModel.getInstance().getCodeContent())) {
                return QRResult.RESULT_ID_CONTENT_IS_NULL;
            }
            try {
                var eclTable:HashTable = new HashTable();
                eclTable.setValue(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.Q);
                var qrData:QRCode = qrWriter.encodeQRCode(
                    QRCodeModel.getInstance().getCodeContent(), BarcodeFormat.QR_CODE, eclTable);
                // 创建失败，返回null
                if (null == qrData) {
                    return QRResult.RESULT_ID_MAKE_QR_NULL;
                } else {
                    QRCodeModel.getInstance().setCodeData(qrData);
                }
            } catch (e:Error) {
                // 创建过程中发生异常
                return QRResult.RESULT_ID_MAKE_QR_EXCEPTION;
            }
            // 创建成功
            return QRResult.RESULT_ID_MAKE_QR_SUCCESS;
        }

        /**
         * 判断QR码图像是否能被识别.
         * @param _img QR图像
         * @return 测试结果ID
         */
        public static function isCurrectCode(_img:BitmapData):int {
            // 无被检测图像
            if (null == _img) {
                return QRResult.RESULT_ID_READ_QR_NO_IMG;
            }
            try {
                var lsource:BufferedImageLuminanceSource = new BufferedImageLuminanceSource(_img);
                var bitmap:BinaryBitmap = new BinaryBitmap(new GlobalHistogramBinarizer(lsource));
                var codeFormat:HashTable = new HashTable();
                codeFormat.Add(DecodeHintType.POSSIBLE_FORMATS, BarcodeFormat.QR_CODE);
                var result:Result = qrReader.decode(bitmap, codeFormat);
                if (null == result) {
                    // Code解析失败
                    return QRResult.RESULT_ID_READ_QR_NULL;
                }
            } catch (e:Error) {
                // Code解析异常
                return QRResult.RESULT_ID_READ_QR_EXCEPTION;
            }
            // Code解析成功
            return QRResult.RESULT_ID_READ_QR_IS_OK;
        }
    }
}