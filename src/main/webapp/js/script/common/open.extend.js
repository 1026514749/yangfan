/**
 * 第三方开源组件扩展或BUG恢复
 * @return {String}
 * @private
 */

function _pts_getContextPath() {
    var contextPath = document.location.pathname;
    var index = contextPath.substr(1).indexOf("/");
    contextPath = contextPath.substr(0, index + 1);
    delete index;
    return contextPath;
}

// 当前上下文变量
var path = _pts_getContextPath();

/**
 * 显示列表操作列右键菜单
 * @param target
 * @param event
 * @private
 */
function _showOprcolMenu(target,event) {
    var rowTr = $(target).closest('tr');
    var ids = rowTr.attr('id').split('|');
    var gridId = ids[0];
    var g = $('#' + gridId).ligerGetGridManager();
    var p = g.options;

    if(!p.oprcolMenu){
        return;
    }

    if(rowTr.data('_menuShowed')){
        return;
    }else{
        rowTr.data('_menuShowed',true);
    }
    if(rowTr.hasClass('l-grid-row-alt')){
        rowTr.removeClass('l-grid-row-alt');
        rowTr.data('_removeClassName','l-grid-row-alt');
    }else{
        rowTr.removeData('_removeClassName');
    }
    rowTr.addClass('l-grid-row-active');

    p.oprcolMenu.dataObject._oprRowTr = rowTr;
    p.oprcolMenu.dataObject._oprRowTr = rowTr;
    p.oprcolMenu.dataObject.rowData = g.getRow(rowTr[0]);

    var pos = $(target).offset();
    p.oprcolMenu.show({top: pos.top + 5, left: pos.left + 5 + $(target).width() / 2});
}

/**
 * 隐藏列表操作列右键菜单
 * @param target
 * @param event
 * @private
 */
function _hideOprcolMenu(target, event) {
    var rowTr = $(target).closest('tr');
    var ids = rowTr.attr('id').split('|');
    var gridId = ids[0];
    var g = $('#' + gridId).ligerGetGridManager();
    var p = g.options;

    if(!p.oprcolMenu){
        return;
    }

    if(target.contains(event.toElement || event.fromElement) || $(event.toElement).closest('.l-menu').length){
        // 没有移出操作列或者没有移出右键菜单
        return;
    }

    // 恢复原属性
    if(rowTr.data('_removeClassName')){
        rowTr.addClass(rowTr.data('_removeClassName'));
    }

    // 删除临时属性
    rowTr.removeClass('l-grid-row-active');;
    rowTr.removeData('_menuShowed');
    rowTr.removeData('_removeClassName')

    var toTd = $(event.toElement).closest('td');

    if(toTd.length && toTd.find('.l-grid-row-cell-oprcol').length){
        return;
    }

    p.oprcolMenu.hide();
}

/**
 * 扩展ligerGrid列表组件
 */
(function (grid) {
    if (!grid) {
        return;
    }

    $.extend($.ligerDefaults.Grid,{
        root: 'dataList',
        record: 'totalCount',
        pageParmName: 'pageIndex',
        pagesizeParmName: 'pageSize',
        dateFormat: 'yyyy-MM-dd hh:mm:ss',
        loadDataAfter : true,                   //扩展，初始化时，是否加载数据
        hasGotoServer : false,                  //扩展，是否有到后台执行过查询
        primaryKey: null                        //扩展，列表数据的主键
    });

    /**
     * 代理loadData函数，在执行之前添加上查询条件
     * @type {Function}
     */
    var target_loadData = grid.loadData;
    grid.loadData = function () {
        var g = this, p = this.options;
        if(p.hasGotoServer){
            //参数保存不变，如果之前没有执行过查询，则执行查询
        }else{
            if($.isEmptyObject(p.parms)){
                if (!p.searchForm) {
                    p.searchForm = 'searchForm';
                }
                var f = $('#' + p.searchForm);
                if (f.length) {
                    p.parms = f.serializeArray();
                }
            }
        }

        if(p.loadDataAfter){
            return target_loadData.apply(g, arguments);
        }else{
            return target_loadData.call(g, {});
        }
    };

    /**
     * 代理_getCellContent函数，添加操作列代码
     * @type {Function}
     */
    var target__getCellContent = grid._getCellContent;
    grid._getCellContent = function(rowdata, column){
        if(column.oprcol === true){
            return '<div class="l-grid-row-cell-oprcol" onmouseout="_hideOprcolMenu(this,event)" onmouseover="_showOprcolMenu(this,event)"><img src="' + path +'/images/ico_opr.gif" /></div>';
        }else{
            return target__getCellContent.apply(this,arguments);
        }
    };

    /**
     * 代理loadServerData函数，添加hasGotoServer标志
     * @type {Function}
     */
    var target_loadServerData = grid.loadServerData;
    grid.loadServerData = function(){
        var g = this, p = this.options;
        p.hasGotoServer = true;
        return target_loadServerData.apply(g,arguments);
    };

    /**
     * 代理_init，操作列默认冻结
     * @type {Function}
     */
    var target__init = grid._init;
    grid._init = function(){
        var g = this, p = this.options;
        $.each(p.columns,function(i,item){
            if(item.oprcol){
                if(item.frozen !== false){
                    item.frozen = true;
                }
            }
        });
        target__init.apply(g,arguments);
    };

    /**
     * 代理日期处理类
     * @type {*}
     */
    var target_render_date = $.ligerDefaults.Grid.formatters['date'];
    $.ligerDefaults.Grid.formatters['date'] = function(value, column){
        if(typeof value == 'number'){
            value = new Date(value);
        }
        return target_render_date.apply(this,arguments);
    };

    $.extend(grid, {
        /**
         *  使用查询表单的值进行查询
         */
        doSearch : function () {
            var g = this, p = this.options;
            p.newPage = 1;

            if (!p.searchForm) {
                p.searchForm = 'searchForm';
            }
            var f = $('#' + p.searchForm);
            if (f.length) {
                p.parms = f.serializeArray();
            }
            g.loadData(true);
        },

        /**
         * 使用最近一次查询参数来刷新列表，即与当前查询表单的值无关
         */
        refresh : function () {
            var g = this, p = this.options;
            p.refreshAction = true;
            g.loadData(true);
        },

        /**
         * 获取选中行数据的IDS字符串
         */
        getSelectedIds : function(){
            var g = this, p = this.options;
            if(!p.primaryKey){
                return '';
            }
            var obj = g.getSelectedRows();
            var key = [];

            $.each(obj,function(k,v){
                key.push(v[p.primaryKey]);
            });

            return key.join(',');
        }
    });

    // 请不要使用左边的函数名称，用于兼容旧版本
    grid.getAllSelectedDataString = grid.getSelectedIds;

})($.ligerui.controls.Grid.prototype);


/**
 * 扩展ligerMenu右键菜单组件
 */
(function(menu){
    if(!menu){
        return;
    }

    $.extend($.ligerDefaults.Menu,{
        beforeShow: null        // 扩展，显示菜单之前
    });

    /**
     *  代理show，添加扩展属性
     * @type {Function}
     */
    var target_show = menu.show;
    menu.show = function(options, menu){
        var g = this, p = this.options;
        if(p.beforeShow){
            p.beforeShow.call(g,g.dataObject);
        }
        target_show.call(g,options,menu);
    };

    /**
     * 代理createMenu，如果是操作列右键菜单，添加自动隐藏功能
     * @type {Function}
     */
    var target_createMenu = menu.createMenu;
    menu.createMenu = function(parentMenuItemID){
        var g = this, p = this.options;
        g.dataObject = {};

        var tMenu = target_createMenu.apply(g,arguments);
        tMenu.hover(function(event){

        },function(event){
            if(!(g.dataObject && g.dataObject._oprRowTr)){
                return;
            }
            var rowTr = g.dataObject._oprRowTr;
            var toTd = $(event.toElement).closest('td');

            if(false){
                // 没有离开当前操作列
            }else{

                // 恢复原属性
                if(rowTr.data('_removeClassName')){
                    rowTr.addClass(rowTr.data('_removeClassName'));
                }

                // 删除临时属性
                rowTr.removeClass('l-grid-row-active');;
                rowTr.removeData('_menuShowed');
                rowTr.removeData('_removeClassName')

                g.dataObject = {};

                // 如果下一步还要显示另一行的菜单，则不隐藏菜单
                if(toTd.find('l-grid-row-cell-oprcol').length){

                }else{
                    $(".l-menu,.l-menu-shadow").hide();
                }
            }
        });

        return tMenu;
    };

    $.extend(menu,{
        /**
         * 根据ID隐藏菜单项
         * @param itemid
         */
        hideItem : function(itemid){
            var g = this;
            $("> .l-menu-item[menuitemid=" + itemid + "]", g.menu.items).hide();
        },
        /**
         * 根据ID显示菜单项
         * @param itemid
         */
        showItem : function(itemid){
            var g= this;
            $("> .l-menu-item[menuitemid=" + itemid + "]", g.menu.items).show();
        },
        /**
         * 设置菜单图标
         * @param itemid 菜单ID
         * @param icon 图标样式
         */
        setIcon : function(itemid, icon){
            var g= this;
            if(!icon) return;
            $("> .l-menu-item[menuitemid=" + itemid + "] > .l-menu-item-icon", g.menu.items).removeClass().addClass('l-menu-item-icon l-icon-' +  icon);

        },
        /**
         * 更新菜单文本
         * @param itemid
         * @param text
         */
        updateText : function(itemid,text){
            var g= this;
            $("> .l-menu-item[menuitemid=" + itemid + "] >.l-menu-item-text:first", g.menu.items).html(text);
        }
    });

})($.ligerui.controls.Menu.prototype);

/**
 * 扩展zTree或者修复BUG
 */
(function (zTree) {
    if (!zTree) {
        return;
    }

    /**
     * id,pid,name等配置名称无效和存在BUG，后台统一用大写
     * @time 2012-07-31
     * @type {Function}
     */
    var target_init = zTree.init;
    zTree.init = function (obj, zSetting, zNodes) {
        $.each(zNodes, function (i, k) {
            k.open = k.OPEN;
            k.id = k.ID;
            k.pId = k.PID;
            k.name = k.NAME;
        });
        target_init.apply(this, arguments);
    };

})($.fn.zTree);

// libf,2012-11-17, lhgdialog 3.5.2版本有bug，第一次加载页面时，该属性值为false，导致offset出错。
// jQuery.support.boxModel = true;
// jQuery.boxModel = true;
