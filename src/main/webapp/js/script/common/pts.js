var _ie6 = window.ActiveXObject && !window.XMLHttpRequest;

if ($.ligerDefaults && $.ligerDefaults.Grid) {
    $.ligerDefaults.Grid.switchPageSizeApplyComboBox = false;
}

/**
 * 获取当前上下文
 * @return {String}
 */
function _pts_getContextPath() {
    var contextPath = document.location.pathname;
    var index = contextPath.substr(1).indexOf("/");
    contextPath = contextPath.substr(0, index + 1);
    delete index;
    return contextPath;
}

// 扩展Jquery
$.fn.extend({
    paramJson:function (prefix) {
        var arrayStr = $(this).serializeArray();
        var keyVal = {};
        $.each(arrayStr, function (i, item) {
            if (prefix) {
                keyVal[prefix + "_" + item.name] = item.value;
            } else {
                keyVal[item.name] = item.value;
            }

        });
        return keyVal;
    }
});

// 当前上下文变量
var path = _pts_getContextPath();

if ($.validator) {
    $.validator.setDefaults({
        errorPlacement:function (label, element) {
            if (label.text() === '') {
                return;
            }
            element.attr('title', label.text());
            element.addClass('l-text-invalid');
            element.poshytip({
                className:'tip-violet',
                alignTo:'target',
                alignX:'inner-left',
                offsetX:0,
                offsetY:5,
                showTimeout:100
            });
        },
        success:function (label, element) {
            element.removeClass('l-text-invalid');
            element.removeAttr('title');
            element.poshytip('destroy');
        }
    });
}

_closeWindow = function () {
    window.close();
}


function advanceSearch(tid) {
    $('#' + tid).toggle();
    if ($('#' + tid).is(':visible')) {
        $('#img_floder').attr('src', path + '/images/ico_nohave2.gif');
    } else {
        $('#img_floder').attr('src', path + '/images/ico_have2.gif');
    }
}

String.prototype.format = function () {
    var ary = [];
    for (var i = 0; i < arguments.length; i++) {
        ary.push(arguments[i]);
    }
    return this.replace(/\{(\d+)\}/g, function (m, i) {
        return ary[i];

    });
};

var pts = {
    version:'0.9.0',

    submitFlow:function(option){
        pts.showTips();
        $.post(path+"/workflow/submit.do", option, function(result){
            pts.hideTips();
            if(!result.success){
                if(result.status == "noUser"){
                    //无下一步处理人，弹出选人操作给用户选择
                    var data = option.bussObj;
                    option.bussObj = "";
                    var dlg = pts.dialog({
                        url:path+'/workflow/selectUser.do?' + $.param(option),
                        title:'选择下一处理人',
                        width: 680,
                        height: 400,
                        callback:function (result) {
                            //获取到下一步处理人后，继续提交流程
                            option.dealUsers = result.nextInfo;
                            option.bussObj = data;
                            pts.submitFlow(option);
                        }
                    });
                    dlg.show();
                }else{
                    pts.alert(result.message);
                }
            }else{
                window.opener.dataGrid.doSearch();
                window.close();
            }
        });
    },

    showTips:function (content) {
        var msg = content || '正在操作中，请稍后......';
        this.tipDlg = artDialog({
            id:'_submit_tips',
            title:false,
            cancel:false,
            fixed:true,
            lock:true,
            content:'正在操作中，请稍后......'
        });

    },

    hideTips:function () {
        if (this.tipDlg) {
            this.tipDlg.close();
            this.tipDlg = null;
        }
    },

    setTips:function (content) {
        if (this.tipDlg) {
            this.tipDlg.content(content);
        }
    },

    _submitOptions:{
        type:'post',
        dataType:'json',
        lockMask:'body',
        success:function (result, textStatus, jqXHR) {
            pts.hideTips();
            if (result.success) {
                this.bizYes(result);
            } else {
                this.bizNo(result);
            }
        },
        error:function (jqXHR, textStatus, errorThrown) {
            pts.hideTips();
            this.bizError(errorThrown);
        },
        complete:function (jqXHR, textStatus) {
            pts.hideTips();
        },
        bizYes:function (result) {
            var msg = result.message || '操作成功！';
            msg += '&nbsp;' + result.timeStamp;
            var that = this;
            pts.success(msg, function () {
                that.yesClick(result);
            });
        },
        bizNo:function (result) {
            var that = this;

            var msg = result.message || '操作失败！';
            msg += '&nbsp;' + result.timeStamp;

            pts.error(msg, function () {
                that.noClick(result);
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
        this.showTips(cfg.tips);
        $.ajax(cfg);

    },
    /**
     * 将对象转换为json字符串并显示，用于调试时查看对象
     * @param jsonObj json对象
     * @param textarea 显示在哪个元素，如果没有传值则alert
     */
    alertJson:function (jsonObj, textarea) {
        if (textarea) {
            $('#' + textarea).val(JSON.stringify(jsonObj));
        } else {
            alert(JSON.stringify(jsonObj));
        }
    },
    toJson:function (jsonStr) {
        return JSON.parse(jsonStr);
    },

    textArea:function (content, yes, value) {
        var api = null;
        if (frameElement) {
            api = frameElement.api;
        }
        return $.dialog.textArea(content, yes, value, api);
    },
    openMax:function (url, options) {
        window.open(url);
    },
    /**
     * 代替原生alert
     * @param message 显示的消息
     * @param yes 点击确定或者关闭窗口后的回调函数
     * @return {*}
     */
    alert:function (message, yes) {
        var dlg = artDialog;
        if (frameElement && frameElement.api) {
            dlg = frameElement.api.opener.artDialog;
        }
        if (dlg) {
            return artDialog.alert(message, yes);
        } else {
            alert(message);
            yes && $.isFunction(yes) && yes();
        }

    },
    /**
     * 代替原生alert，图标为成功图标
     * @param message 显示的消息
     * @param yes 点击确定或者关闭窗口后的回调函数
     * @return {*}
     */
    success:function (message, yes) {
        var dlg = artDialog;
        if (frameElement && frameElement.api) {
            dlg = frameElement.api.opener.artDialog;
        }
        if (dlg) {
            return dlg.successAlert(message, yes);
        } else {
            alert(message);
            yes && $.isFunction(yes) && yes();
        }

    },
    /**
     *  代替原生error，图标为错误图标
     * @param message 显示的消息
     * @param yes 点击确定或者关闭窗口后的回调函数
     * @return {*}
     */
    error:function (message, yes) {
        var dlg = artDialog;
        if (frameElement && frameElement.api) {
            dlg = frameElement.api.opener.artDialog;
        }
        if (dlg) {
            return dlg.errorAlert(message, yes);
        } else {
            alert(message);
            yes && $.isFunction(yes) && yes();
        }

    },
    /**
     * 代替原生confirm
     * @param message 显示的消息
     * @param yes 点击“确定”后的回调函数
     * @param no 点击“否”后的回调函数
     * @return {*}
     */
    confirm:function (message, yes, no) {
        var dlg = artDialog;
        if (frameElement && frameElement.api) {
            dlg = frameElement.api.opener.artDialog;
        }
        if (dlg) {
            return dlg.confirm(message, yes, no);
        } else {
            if (confirm(message)) {
                yes && $.isFunction(yes) && yes();
            } else {
                no && $.isFunction(no) && no();
            }
        }
    },
    /**
     * 代替原生prompt
     * @param message 输入标签名称
     * @param yes 值改变后的回调函数
     * @param value 输入框默认值
     * @return {*}
     */
    prompt:function (message, yes, value) {
        var dlg = artDialog;
        if (frameElement && frameElement.api) {
            dlg = frameElement.api.opener.artDialog;
        }
        if (dlg) {
            return dlg.prompt(message, yes, value);
        } else {
            var newVal = prompt(message, value);
            if (newVal !== value) {
                yes && $.isFunction(yes) && yes();
            }
        }
    },
    /**
     * 解发前一radio元素的click事件
     * @param that
     */
    prevRadio:function (that) {
        var rd = $(that).prev();
        if (rd.length) {
            rd.trigger('click');
        }
    },
    /**
     * 简单radio标签加载后触发点击事件进行选中
     * @param hId 隐藏表单，跟radio平级，用于辅助查找radio
     * @param name radio的名称
     * @param value 选中的radio值
     */
    simpleRadioTrigger:function (hId, name, value) {
        $('#' + hId).parent().find('input[name=' + name + ']').each(function (item) {
            if ($(this).val() === value) {
                $(this).trigger('click');
            }
        });
    },
    /**
     * 简单select标签加载后触发值改变事件
     * @param hId 隐藏表单，跟select平级，用于辅助查找select
     */
    simpleSelectTrigger:function (hId) {
        $('#' + hId).prev().trigger('change');
    },
    /**
     * 触发前一元素的click事件
     * @param that
     */
    prevCheck:function (that) {
        var rd = $(that).prev();
        if (rd.length) {
            rd.trigger('click');
        }
    },
    /**
     * zTree默认配置
     */
    _zTreeOptions:{
        data:{
            simpleData:{
                enable:true
            }
        }
    },
    /**
     * 创建zTree
     * @param htmlId 显示树的html元素选择标识
     * @param param 传递给后台的请求参数
     * @param options zTree的配置
     * @param callback 初始化树后的回调函数
     */
    easyZTree:function (htmlId, param, options, callback) {
        var treeConfig = $.extend({}, this._zTreeOptions, options);
        param.url = param.url || (path + '/datacenter/allQuery.do');
        this.submit({
            data:param,
            url:param.url,
            bizYes:function (result) {
                $.fn.zTree.init($(htmlId), treeConfig, result.dataList);
                var tree = $.fn.zTree.getZTreeObj($(htmlId).attr('id'));
                if (callback) {
                    callback(tree, result);
                }
            }
        });
    },
    /**
     * 将可遍历对象的key组装成字符串，以逗号分割
     * @param map 可遍历对象
     * @return {String} 字符串，以逗号分割
     */
    getMapKeyStr:function (map) {
        var key = [];

        $.each(map, function (k, v) {
            key.push(k);
        });

        return key.join(',');
    },
    /**
     * 获取select所选中的文本
     * @param that ID或者html对象
     */
    getSelectLabel:function (that) {
        if (!that) {
            return null;
        }
        return $(that).find("option:selected").text();
    },

    _uploadOptions:{
        url:path + '/datacenter/upload.do',
        secureuri:false,
        fileElementId:'fileToUpload',
        dataType:'json',
        tips:'文件正在上传并处理中......',
        data:{},
        success:function (result, status) {

        },
        error:function (result, status, e) {
            pts.hideTips();
            alert(e);
        },
        complete:function () {
            pts.hideTips();
        }
    },
    upload:function (options) {
        if (options && options.fileId) {
            options.fileElementId = options.fileId;
        }
        var cfg = $.extend({}, this._uploadOptions, options);
        this.showTips(cfg.tips);
        $.ajaxFileUpload(cfg);
    },
    clickUpload:function (options) {
        var timestamp = (new Date()).valueOf();
        var htmlId = options.fileId + '_' + timestamp;

        htmlId = 'fileToUpload';
        options.fileElementId = 'fileToUpload';

        $('body').append('<input id="{0}" type="file" name="{1}"  style="display: none;" onchange="pts._uploadChanged(this)" />'.format(htmlId, 'fileToUpload'));
        $('#' + htmlId).data("_options_", options);
        $('#' + htmlId).click();
    },
    _uploadChanged:function (that) {
        var cfg = $(that).data('_options_');
        if (cfg.changed) {
            return;
        } else {
            cfg.changed = true;
        }
        cfg.fileElementId = 'fileToUpload';
        pts.upload(cfg);
    },
    decode:function () {
        var leftVal = arguments[0];
        var length = ((arguments.length - 1) / 2) * 2;
        for (var i = 1; i < length; i++) {
            if (leftVal === arguments[i]) {
                return arguments[i + 1];
            }
        }
        if (arguments.length > length) {
            return arguments[arguments.length - 1];
        }
        return '';
    },
    fixTable:function (TableID, FixColumnNumber, width, height) {
        if ($("#" + TableID + "_tableLayout").length != 0) {
            $("#" + TableID + "_tableLayout").before($("#" + TableID));
            $("#" + TableID + "_tableLayout").empty();
        }
        else {
            $("#" + TableID).after("<div id='" + TableID + "_tableLayout' style='overflow:hidden;height:" + height + "px; width:" + width + "px;'></div>");
        }

        $('<div id="' + TableID + '_tableFix"></div>'
            + '<div id="' + TableID + '_tableHead"></div>'
            + '<div id="' + TableID + '_tableColumn"></div>'
            + '<div id="' + TableID + '_tableData"></div>').appendTo("#" + TableID + "_tableLayout");


        var oldtable = $("#" + TableID);

        var tableFixClone = oldtable.clone(true);
        tableFixClone.attr("id", TableID + "_tableFixClone");
        $("#" + TableID + "_tableFix").append(tableFixClone);
        var tableHeadClone = oldtable.clone(true);
        tableHeadClone.attr("id", TableID + "_tableHeadClone");
        $("#" + TableID + "_tableHead").append(tableHeadClone);
        var tableColumnClone = oldtable.clone(true);
        tableColumnClone.attr("id", TableID + "_tableColumnClone");
        $("#" + TableID + "_tableColumn").append(tableColumnClone);
        $("#" + TableID + "_tableData").append(oldtable);

        $("#" + TableID + "_tableLayout table").each(function () {
            $(this).css("margin", "0");
        });


        var HeadHeight = $("#" + TableID + "_tableHead thead").height();
        HeadHeight += 2;
        $("#" + TableID + "_tableHead").css("height", HeadHeight);
        $("#" + TableID + "_tableFix").css("height", HeadHeight);


        var ColumnsWidth = 0;
        var ColumnsNumber = 0;
        $("#" + TableID + "_tableColumn tr:last td:lt(" + FixColumnNumber + ")").each(function () {
            ColumnsWidth += $(this).outerWidth(true);
            ColumnsNumber++;
        });
        ColumnsWidth += 2;
        if ($.browser.msie) {
            switch ($.browser.version) {
                case "7.0":
                    if (ColumnsNumber >= 3) ColumnsWidth--;
                    break;
                case "8.0":
                    if (ColumnsNumber >= 2) ColumnsWidth--;
                    break;
            }
        }
        $("#" + TableID + "_tableColumn").css("width", ColumnsWidth);
        $("#" + TableID + "_tableFix").css("width", ColumnsWidth);


        $("#" + TableID + "_tableData").scroll(function () {
            $("#" + TableID + "_tableHead").scrollLeft($("#" + TableID + "_tableData").scrollLeft());
            $("#" + TableID + "_tableColumn").scrollTop($("#" + TableID + "_tableData").scrollTop());
        });

        $("#" + TableID + "_tableFix").css({ "overflow":"hidden", "position":"relative", "z-index":"50", "background-color":"Silver" });
        $("#" + TableID + "_tableHead").css({ "overflow":"hidden", "width":width - 17, "position":"relative", "z-index":"45", "background-color":"Silver" });
        $("#" + TableID + "_tableColumn").css({ "overflow":"hidden", "height":height - 17, "position":"relative", "z-index":"40", "background-color":"white" });
        $("#" + TableID + "_tableData").css({ "overflow":"auto", "width":width, "height":height, "position":"relative", "z-index":"35" });

        if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableFix table").width()) {
            $("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableFix table").width());
            $("#" + TableID + "_tableData").css("width", $("#" + TableID + "_tableFix table").width() + 17);
        }
        if ($("#" + TableID + "_tableColumn").height() > $("#" + TableID + "_tableColumn table").height()) {
            $("#" + TableID + "_tableColumn").css("height", $("#" + TableID + "_tableColumn table").height());
            $("#" + TableID + "_tableData").css("height", $("#" + TableID + "_tableColumn table").height() + 17);
        }

        $("#" + TableID + "_tableFix").offset($("#" + TableID + "_tableLayout").offset());
        $("#" + TableID + "_tableHead").offset($("#" + TableID + "_tableLayout").offset());
        $("#" + TableID + "_tableColumn").offset($("#" + TableID + "_tableLayout").offset());
        $("#" + TableID + "_tableData").offset($("#" + TableID + "_tableLayout").offset());
    },

    /**
     * 格式化日期
     * @param dateVal
     * @param formatStr 格式化字符串
     */
    toDateStr:function (dateVal, formatStr) {
        var value = dateVal;
        if (typeof value == 'number') {
            value = new Date(value);
        }
        function getFormatDate(date, dateformat) {
            if (isNaN(date)) return null;
            var format = dateformat;
            var o = {
                "M+":date.getMonth() + 1,
                "d+":date.getDate(),
                "h+":date.getHours(),
                "m+":date.getMinutes(),
                "s+":date.getSeconds(),
                "q+":Math.floor((date.getMonth() + 3) / 3),
                "S":date.getMilliseconds()
            }
            if (/(y+)/.test(format)) {
                format = format.replace(RegExp.$1, (date.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
            }
            for (var k in o) {
                if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                        : ("00" + o[k]).substr(("" + o[k]).length));
                }
            }
            return format;
        }

        if (!value) return "";
        if (typeof (value) == "string" && /^\/Date/.test(value)) {
            value = value.replace(/^\//, "new ").replace(/\/$/, "");
            eval("value = " + value);
        }
        if (value instanceof Date) {
            var format = formatStr || "yyyy-MM-dd";
            return getFormatDate(value, format);
        }
        else {
            return value.toString();
        }
    },
    _flowSubmitOptions:{
        url:path + '/component/workflow/submit.do'
    },
    flowUser:function (options) {
        var cfg = $.extend({}, this._flowSubmitOptions, options);
        var dlg = pts.dialog({
            url:path + '/flow/selectView.do?' + $.param(cfg.data),
            title:'选择下一处理人',
            width:660,
            height:cfg.height || 500,
            callback:function (result) {
                if (result.multi) {
                    cfg.data.nextInfo = result.nextInfo;
                } else {
                    cfg.data.nextAct = result.ACTPATH;
                    cfg.data.nextUser = result.USER_ID;
                }

                cfg.data.submitMode = 'last';
                pts.submit({
                    url:cfg.url,
                    data:cfg.data,
                    yesClick:function (result) {
                        cfg.yesClick(result);
                    }
                });
            }
        });
        dlg.show();
    },
    flowSubmit:function (options) {
        var cfg = $.extend({}, this._flowSubmitOptions, options);
        cfg.success = function (result) {
            if (result.success) {
                var msg = result.message || '操作成功！';
                msg += '&nbsp;' + result.timeStamp;
                var that = this;
                pts.success(msg, function () {
                    cfg.yesClick(result);
                });
            } else {
                if (result.bizCode === '_user_') {
                    if (result.actionAlias) {
                        cfg.data.fActionAlias = result.actionAlias;
                    }
                    result.height = result.height || 550;
                    result.width = result.width || 660;
                    if(_ie6){
                        result.width += 28;
                    }

                    var sCfg = {};
                    $.each(cfg.data,function(i,item){
                        if(i && i.length > 1 && i.charAt(0) === 'f' && i.length <= 30 ){
                            sCfg[i] = item;
                        }
                    });

                    var dlg = pts.dialog({
                        url:path + '/component/workflow/selectView.do?' + $.param(sCfg),
                        title:'选择下一处理人',
                        width: result.width,
                        height: result.height,
                        callback:function (result) {
                            if (result.multi) {
                                cfg.data.nextInfo = result.nextInfo;
                            } else {
                                cfg.data.nextAct = result.ACTPATH;
                                cfg.data.nextUser = result.USER_ID;
                            }

                            cfg.data.fSubmitMode = 'last';
                            pts.submit({
                                url:path + '/component/workflow/submit.do',
                                data:cfg.data,
                                yesClick:function (result) {
                                    cfg.yesClick(result);
                                }
                            });
                        }
                    });
                    dlg.show();
                } else {
                    var msg = result.message || '操作失败！';
                    msg += '&nbsp;' + result.timeStamp;
                    pts.error(msg);
                }
            }
        };
        this.submit(cfg);
    }
};


var vts = {
    Regex:{
        Double:/^\d+(?=\.\d+$|$)/
    },
    isDouble:function (sDouble) {
        if (sDouble) {
            return this.Regex.Double.test(sDouble);
        }
        return false;
    },
    getDoubleN:function (domObj) {
        var jObj = $(domObj);
        if (!$.trim(jObj.val())) {
            return 0;
        }
        return parseFloat(jObj.val());
    },
    /**
     * 格式化浮点数，默认为4位小数，会自动删除多余的0
     * @param obj
     * @return {*}
     */
    formatN:function (obj) {
        if (typeof(obj) === 'string') {
            obj = parseFloat(obj);
        }
        if (isNaN(obj)) {
            return obj;
        }
        // TODO 格式化浮点数删除多余的零
        return Math.round(obj * 100) / 100
    }
};

function isCurrentSeason(targetMonth, currentMonth) {
    return parseInt((parseInt(targetMonth) - 1) / 3) == parseInt((currentMonth - 1) / 3);
}

function isCurrentMonth(targetMonth, currentMonth) {
    if (parseInt(targetMonth) == parseInt(currentMonth))
        return true;
    else
        return false;
}

// Excel导出工具类
$.extend(pts, {
    _downFileUrl:null,
    _artDlg:null,

    _closeDialog:function () {
        if (this._artDlg) {
            this._artDlg.close();
            this._artDlg = null;
        }
    },

    _downFileClick:function () {
        this._closeDialog();
        if (!$('#_downFrame')[0]) {
            $('body').append('<iframe style="display: none;" id="_downFrame"></iframe>');
        }
        $('#_downFrame')[0].src = this._downFileUrl;
    },

    exportExcel:function (options) {
        pts.showTips();

        $.ajax({
            type:'post',
            url:path + '/datacenter/export.do',
            data:options,
            dataType:'json',
            success:function (result) {
                if (result.success) {
                    var ts = (new Date()).valueOf();
                    var fileName = options.fileName || result.fileName || '';
                    var processClass = result.processClass || '';

                    pts._downFileUrl = encodeURI(encodeURI(path + '/datacenter/excelExportFile.do?fileName=' + fileName + '&filePath=' + result.filePath + '&fileGuid=' + result.fileGuid + "&processClass=" + processClass + "&ts=" + ts));

                    if (!$('#_downFileDiv')[0]) {
                        $('body').append('<div style="display: none; width: 350px; height: 100px; padding-top: 20px;" id="_downFileDiv"><span style="font-size: large;">数据文件已经生成！</span><a href="javascript:" class="combtn" onclick="pts._downFileClick()"><span>保存文件</span></a><a href="javascript:" class="combtn" onclick="pts._closeDialog()"><span>关闭窗口</span></a></div>');
                    }
                    pts._artDlg = art.artDialog({ content:$("#_downFileDiv")[0], lock:true, fixed:true, background:'#EEEEEE', noText:'关闭', noFn:true});

                } else {
                    pts.alert(result.message);
                }
            },
            error:function () {
                pts.alert("操作失败，请联系维护人员处理！");
            },
            complete:function () {
                pts.hideTips();
            }
        });
    }
});

// div模拟窗口工具类（lhgdialog）
$.extend(pts, {
    _dialogOptions:{
        parent:null,
        show:false,
        lock:true,
        fixed: true,
        callback:function (result) {

        },
        close:function () {
            if (typeof(this.content.returnValue) !== 'undefined') {
                if (this.config.callback) {
                    this.config.callback(this.content.returnValue);
                }
            }
            return true;
        }
    },
    dialog:function (options) {
        var cfg = $.extend({}, this._dialogOptions, options);
        var dlg = $.dialog;
        var timestamp = Date.parse(new Date());
        cfg.id = cfg.id || timestamp;

        if (frameElement && frameElement.api && frameElement.api.opener) {
            var api = frameElement.api, W = api.opener;
            dlg = W.$.dialog;
            cfg.parent = api;
        }

        if (cfg.url) {
            cfg.content = 'url:' + cfg.url;
        }

        return dlg(cfg);
    },
    /**
     * 关闭当前窗口，并返回值给父窗口
     * @param result 返回给父窗口的值，通过window.returnValue传递
     */
    closeback:function (result) {
        if (frameElement && frameElement.api) {
            var dg = frameElement.api;
            dg.content.returnValue = result;
            dg.close();
        } else {
            window.returnValue = result;
            _closeWindow();
        }
    },
    closeDialog:function (result) {
        if (frameElement && frameElement.api) {
            var dg = frameElement.api;
            dg.close();
        } else {
            _closeWindow();
        }
    },
    parent: function () {
        if (frameElement && frameElement.lhgDG) {
            return frameElement.lhgDG.curWin;
        } else {
            return window.opener;
        }
    }
});