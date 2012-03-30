package com.wang.util {
    import flash.utils.ByteArray;
    
    import mx.utils.StringUtil;

    /**
     * 字符串工具类.
     */
    public class StrUtil {

        /** 回车换行. */
        public static const LINE_SPLIT:String = "\r\n";

        /**
         * 构造方法.
         */
        public function StrUtil() {
        }

        /**
         * 判断空字符串.
         * @param _s 被判断字符串
         * @return 如果_s为空，则返回true；否则返回false
         */
        public static function isNullStr(_s:String):Boolean {
            if (null == _s || 0 == _s.length) {
                return true;
            }
            return false;
        }

        /**
         * 如果字符串为空，返回默认字符串.
         * @param _s 被判断字符串
         * @param _def 默认值
         * @return _s不为空返回其本身，如果_s为空且_def为空，返回null，否则返回_def
         */
        public static function nvl(_s:String, _def:String):String {
            if (isNullStr(_s)) {
                if (isNullStr(_def)) {
                    return null;
                } else {
                    return _def;
                }
            }
            return StringUtil.trim(_s);
        }

        /**
         * 判断字符串Byte长度.
         * @param _s 被判断字符串
         * @return 字符串的Byte长度
         */
        public static function bitLen(_s:String):int {
            if (isNullStr(_s)) {
                return 0;
            }
            var ba:ByteArray = new ByteArray();
            ba.writeUTFBytes(_s);
            return ba.length;
        }

        /**
         * 判断是否是URL字符串.
         * @param _s 被判断字符串
         * @return 以http://或https://开头的字符串认为是URL字符串
         */
        public static function isURLStr(_s:String):Boolean {
            if (isNullStr(_s)) {
                return false;
            }
            var urlRegexp:RegExp = /^((http:\/\/)|(https:\/\/))(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$/g;
            return urlRegexp.test(_s);
        }

        /**
         * trim操作.
         * @param _s 被trim字符串
         * @return trim后字符串
         */
        public static function trim(_s:String):String {
            if (isNullStr(_s)) {
                return "";
            }
            return StringUtil.trim(_s);
        }

        /**
         * 判断是否是电话号码或手机号码字符串.
         * @param _s 被判断字符串
         * @return true:是;false:不是
         */
        public static function isTelStr(_s:String):Boolean {
            if (isNullStr(_s)) {
                return false;
            }
            var telRegexp:RegExp = /^\+?\d{7,}(-\d+)?$/g;
            return telRegexp.test(_s);
        }

        /**
         * 判断是否是Email字符串.
         * @param _s 被判断字符串
         * @return true:是;false:不是
         */
        public static function isEmailStr(_s:String):Boolean {
            if (isNullStr(_s)) {
                return false;
            }
            var telRegexp:RegExp = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/g;
            return telRegexp.test(_s);
        }

        /**
         * 判断是否是Zip字符串.
         * @param _s 被判断字符串
         * @return true:是;false:不是
         */
        public static function isZipStr(_s:String):Boolean {
            if (isNullStr(_s)) {
                return false;
            }
            var telRegexp:RegExp = /^\d+$/g;
            return telRegexp.test(_s);
        }
    }
}