package com.wang.qr.util {
    import mx.utils.StringUtil;

    /**
     * 字符串工具类.
     */
    public class StrUtil {

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
    }
}