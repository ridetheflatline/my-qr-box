package com.wang.qr.model {
    /**
     * 页面项目模型.
     */
    public class PageModel {

        /** 选择的输入内容的种类. */
        public static var selectedInput:int;

        /**
         * 初始化页面各配置值.
         */
        public static function init():void {
            selectedInput = 0;
        }
    }
}