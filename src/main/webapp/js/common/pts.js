var pts = {
    version:'1.0.0',

    _submitOptions:{
        type:'post',
        dataType:'json',
        lockMask:'body',
        success:function (result, textStatus, jqXHR) {
            if (result.success) {
                this.bizYes(result);
            } else {
                this.bizNo(result);
            }
        },
        error:function (jqXHR, textStatus, errorThrown) {

            this.bizError(errorThrown);
        },
        complete:function (jqXHR, textStatus) {
        },
        bizYes:function (result) {
            var msg = result.message || '操作成功！';
            msg += '&nbsp;' + result.timeStamp;
            var that = this;
            zeroModal.success({
        		contentDetail: msg,
                okFn:that.yesClick
        	});
        },
        bizNo:function (result) {
            var that = this;

            var msg = result.message || '操作失败！';
            msg += '&nbsp;' + result.timeStamp;

            zeroModal.error({
        		contentDetail: msg,
                okFn:that.noClick
        	});
        },
        bizError:function (error) {
            pts.error("操作失败，出现异常！", function () {

            });
        },
        yesClick:function (result) {

        },
        noClick:function (result) {

        },
        errorClick:function (jqXHR, textStatus, errorThrown) {

        }
    },

    submit:function (config) {
        var cfg = $.extend({}, this._submitOptions, config);
        $.ajax(cfg);

    },
    
    /**
     * 代替原生alert，图标为成功图标
     * @param message 显示的消息
     * @param yes 点击确定或者关闭窗口后的回调函数
     * @return {*}
     */
    success:function (message, yes) {       
    	
    },
    /**
     *  代替原生error，图标为错误图标
     * @param message 显示的消息
     * @param yes 点击确定或者关闭窗口后的回调函数
     * @return {*}
     */
    error:function (message, yes) {

    },
    /**
     * 代替原生confirm
     * @param message 显示的消息
     * @param yes 点击“确定”后的回调函数
     * @param no 点击“否”后的回调函数
     * @return {*}
     */
    confirm:function (title,message, yes, no) {
    	zeroModal.confirm({
            content: title,
            contentDetail: message,
            okFn:yes,
            cancelFn:no
        });
    },
    
    /**
     * 打开对话框
     * @param opt
     */
    
    dialog:function(opt){
    	var options = $.extend({},{iframe: true},opt)
    	zeroModal.show(options);
    },
    
    /**
     * 关闭对话框
     */
    closeDailog:function(){
    	parent.zeroModal.closeAll();
    },
    
    /**
     * 打开新窗口
     */
    openMax:function(url){
    	window.open(url);
    },
    /**
     * 默认上传配置
     */
    _defaultUploadOption:{
    	url: '${path}/common/upload.do', //用于文件上传的服务器端请求地址
        secureuri: false, //是否需要安全协议，一般设置为false
        fileElementId: 'file', //文件上传域的ID
        dataType:'json',
        lockMask:'body',
        success: function (data, status)  //服务器成功响应处理函数
        {
            var result = $(data).text();
            var json = $.parseJSON(result);
            if(json.success){
            	this.uploadSuccess(json);
            }else{
            	this.uploadError(json);
            }
        },
        error: function (data, status, e)//服务器响应失败处理函数
        {
            
        },
        uploadSuccess:function(result){
        	
        },
        uploadError:function(result){
        	
        }
    },
    fileUpload:function(option){
    	var opt = $.extend({},this._defaultUploadOption,option)
    	$.ajaxFileUpload(opt);
    }
    
};
function html_encode(str) {
    var s = "";
    if (str.length == 0)
        return "";
    s = str.replace(/&/g, "&gt;");
    s = s.replace(/</g, "&lt;");
    s = s.replace(/>/g, "&gt;");
    s = s.replace(/ /g, "&nbsp;");
    s = s.replace(/\'/g, "&#39;");
    s = s.replace(/\"/g, "&quot;");
    s = s.replace(/\n/g, "<br>");
    return s;
}

function html_decode(str) {
    var s = "";
    if (str.length == 0)
        return "";
    s = str.replace(/&gt;/g, "&");
    s = s.replace(/&lt;/g, "<");
    s = s.replace(/&gt;/g, ">");
    s = s.replace(/&nbsp;/g, " ");
    s = s.replace(/&#39;/g, "\'");
    s = s.replace(/&quot;/g, "\"");
    s = s.replace(/<br>/g, "\n");
    return s;
}