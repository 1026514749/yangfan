function _toDateStr(dateVal, dateformat) {
    var value = dateVal;
    if (typeof value == 'number') {
        value = new Date(value);
    }
    function getFormatDate(date, dateformat) {
        if (isNaN(date)) return null;
        var format = dateformat;
        var o = {
            "M+" : date.getMonth() + 1,
            "d+" : date.getDate(),
            "h+" : date.getHours(),
            "m+" : date.getMinutes(),
            "s+" : date.getSeconds(),
            "q+" : Math.floor((date.getMonth() + 3) / 3),
            "S" : date.getMilliseconds()
        };
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
        var format = dateformat || "yyyy-MM-dd";
        return getFormatDate(value, format);
    }
    else {
        return value.toString();
    }
}

(function ($) {
    $.evilGrid = function (elm, options) {
        this.options = options;
        this.grid = $("<table class='l-grid-header-table' cellpadding='0' cellspacing='1'><thead></thead><tbody></tbody><tfoot></tfoot></table>");
        this.grid.id = $(elm).attr('id') + "-tab";
        $(elm).append(this.grid);
        this.gridheader = $('thead:first', this.grid);
        this.gridbody = $('tbody:first', this.grid);
        this._setColumns(options.columns);
        this.showData(options.data);
    };
    $.evilGrid.defaults = {
        columnRender : function (row, col, bodyHtml) {
            return false;
        },
        classRender : null,
        styleRender : null,
        formatters : {}
    };

    $.evilGrid.defaults.formatters['day'] = function (value, column) {
        return _toDateStr(value, 'yyyy-MM-dd');
    };


    $.evilGrid.defaults.formatters['time'] = function (value, column) {
        return _toDateStr(value, 'yyyy-MM-dd hh:mm:ss');
    };

    $.evilGrid.prototype = {
        _setColumns : function (columns) {
            var g = this, p = this.options;
            p.columns = columns;
            g._initColumns();
            g._initBuildGridHeader();
        },
        _initBuildGridHeader : function () {
            var g = this, p = this.options;
            g.gridtablewidth = 0;

            g.gridheader.html();
            for (var level = 1; level <= g._columnMaxLevel; level++) {
                var columns = g.getColumns(level);           //获取level层次的列集合
                var islast = level == g._columnMaxLevel;     //是否最末级
                var tr = $("<tr class='l-grid-hd-row'></tr>");
                var trf = $("<tr class='l-grid-hd-row'></tr>");
                if (!islast) tr.add(trf).addClass("l-grid-hd-mul");
                g.gridheader.append(tr);
                $(columns).each(function (i, column) {
                    tr.append(g._createHeaderCell(column));
                    if (column['__leaf']) {
                        var colwidth = column['_width'];
                        g.gridtablewidth += (parseInt(colwidth) ? parseInt(colwidth) : 0) + 1;
                    }
                });
            }
        },
        _createColumnId : function (column) {
            if (column.id != null) return column.id.toString();
            return "c" + (100 + this._columnCount);
        },
        _isColumnId : function (str) {
            return (str in this._columns);
        },
        _initColumns : function () {
            var g = this, p = this.options;
            g.id = g.grid.id;
            g._columns = {};
            g._columnCount = 0;
            g._columnLeafCount = 0;
            g._columnMaxLevel = 1;
            if (!p.columns) return;
            function removeProp(column, props) {
                for (var i in props) {
                    if (props[i] in column)
                        delete column[props[i]];
                }
            }

            //设置id、pid、level、leaf，返回叶节点数,如果是叶节点，返回1
            function setColumn(column, level, pid, previd) {
                removeProp(column, ['__id', '__pid', '__previd', '__nextid', '__domid', '__leaf', '__leafindex', '__level', '__colSpan', '__rowSpan']);
                if (level > g._columnMaxLevel) g._columnMaxLevel = level;
                g._columnCount++;
                column['__id'] = g._createColumnId(column);
                column['__domid'] = g.id + "|hcell|" + column['__id'];
                g._columns[column['__id']] = column;
                if (!column.columns || !column.columns.length)
                    column['__leafindex'] = g._columnLeafCount++;
                column['__level'] = level;
                column['__pid'] = pid;
                column['__previd'] = previd;
                if (!column.columns || !column.columns.length) {
                    column['__leaf'] = true;
                    return 1;
                }
                var leafcount = 0;
                var newid = -1;
                for (var i = 0, l = column.columns.length; i < l; i++) {
                    var col = column.columns[i];
                    leafcount += setColumn(col, level + 1, column['__id'], newid);
                    newid = col['__id'];
                }
                column['__leafcount'] = leafcount;
                return leafcount;
            }

            var lastid = -1;

            for (var i = 0, l = p.columns.length; i < l; i++) {
                var col = p.columns[i];
                setColumn(col, 1, -1, lastid);
                lastid = col['__id'];
            }
            //设置colSpan和rowSpan
            for (var id in g._columns) {
                var col = g._columns[id];
                if (col['__leafcount'] > 1) {
                    col['__colSpan'] = col['__leafcount'];
                }
                if (col['__leaf'] && col['__level'] != g._columnMaxLevel) {
                    col['__rowSpan'] = g._columnMaxLevel - col['__level'] + 1;
                }
            }
            //叶级别列的信息
            g.columns = g.getColumns();
            $(g.columns).each(function (i, column) {
                column.columnname = column.name;
                column.columnindex = i;
                column.type = column.type || "string";
                column.islast = i == g.columns.length - 1;
                column.isSort = column.isSort != false;
                column.frozen = column.frozen ? true : false;
                column._width = g._getColumnWidth(column);
                column._hide = column.hide ? true : false;
            });
        },
        _getColumnWidth : function (column) {
            var g = this, p = this.options;
            return column.width;

        },
        getColumns : function (columnLevel) {
            var g = this, p = this.options;
            var columns = [];
            for (var id in g._columns) {
                var col = g._columns[id];
                if (columnLevel != undefined) {
                    if (col['__level'] == columnLevel) columns.push(col);
                }
                else {
                    if (col['__leaf']) columns.push(col);
                }
            }
            return columns;
        },
        _createHeaderCell : function (column) {
            var g = this, p = this.options;
            var jcell = $("<td class='l-grid-hd-cell'></td>");
            jcell.attr("id", column['__domid']);
            if (!column['__leaf'])
                jcell.addClass("l-grid-hd-cell-mul");
            if (column.columnindex == g.columns.length - 1) {
                jcell.addClass("l-grid-hd-cell-last");
            }
            if (column.isrownumber) {
                jcell.addClass("l-grid-hd-cell-rownumbers");
                jcell.html("<div class='l-grid-hd-cell-inner'></div>");
            }
            if (column.ischeckbox) {
                jcell.addClass("l-grid-hd-cell-checkbox");
                jcell.html("<div class='l-grid-hd-cell-inner'><div class='l-grid-hd-cell-text l-grid-hd-cell-btn-checkbox'></div></div>");
            }

            jcell.css('text-align', 'center');

            if (column['__colSpan']) jcell.attr("colSpan", column['__colSpan']);
            if (column['__rowSpan']) {
                jcell.attr("rowSpan", column['__rowSpan']);
                jcell.height(p.headerRowHeight * column['__rowSpan']);
            } else {
                jcell.height(p.headerRowHeight);
            }
            if (column['__leaf']) {
                jcell.width(column['_width']);
                jcell.attr("columnindex", column['__leafindex']);
            } else {
                jcell.width(column['width']);
            }
            if (column.name) jcell.attr({ columnname : column.name });
            var headerText = "";
            if (column.display && column.display != "")
                headerText = column.display;
            else if (column.headerRender)
                headerText = column.headerRender(column);
            else
                headerText = "&nbsp;";
            jcell.html(headerText);
            return jcell;
        },
        showData : function (jsonObj) {
            var g = this, p = this.options;
            g.gridbody.html('');
            if (!(jsonObj && jsonObj.dataList)) {
                return;
            }
            var bodyHtml = [];

            var rowSpan = g._isEnableRowSpan();
            if (rowSpan) {
                g._setRowSpan(jsonObj.dataList);
            }
            $.each(jsonObj.dataList, function (i, item) {
                bodyHtml.push('<tr>')
                $.each(g._columns, function (c, col) {
                    if (!col.__leaf) {
                        return;
                    }
                    if (p.columnRender.call(g, item, col, bodyHtml)) {
                        return;
                    }

                    var rCount = 1;
                    if (rowSpan) {
                        var rCount = item[col.columnname + "__Row"];
                        if (rCount !== undefined && rCount == 0) {
                            return;
                        }
                    }
                    g._setCellHtml(item, col, rCount, bodyHtml);


                });
                bodyHtml.push('</tr>')
            });
            g.gridbody.html(bodyHtml.join(''));
        },
        _setRowSpan : function (dataList) {
            if (dataList.length <= 1) {
                return;
            }

            var g = this, p = this.options;

            if (!g._isEnableRowSpan()) {
                return;
            }

            for (var cIndex = 0; cIndex < p.rowspan.length; cIndex++) {
                var cItem = p.rowspan[cIndex];
                var cPrev = cIndex ? p.rowspan[cIndex - 1] : null;
                var spanCount = 1;
                for (var i = dataList.length - 1; i >= 1; i--) {
                    var item = dataList[i];
                    var prev = dataList[i - 1];

                    if (cPrev) {  // 当有前一合并行时，判断前一数据内容相等才能合并
                        if (item[cPrev.name] === prev[cPrev.name]) {
                            spanCount = g._setRowSpanInfo(item, prev, cItem, spanCount);
                        } else {
                            spanCount = g._setRowSpanInfo(item, null, cItem, spanCount);
                        }
                    } else {
                        spanCount = g._setRowSpanInfo(item, prev, cItem, spanCount);
                    }


                }

                if (spanCount > 1) {
                    dataList[0][cItem.name + "__Row"] = spanCount;
                    if (cItem.theSame && cItem.theSame.length) {
                        $.each(cItem.theSame, function (s, sub) {
                            dataList[0][sub.name + "__Row"] = spanCount;
                        });
                    }
                }
            }

        },
        _isEnableRowSpan : function () {
            var g = this, p = this.options;
            if (p.rowspan && p.rowspan.length) {
                return true;
            }
            return false;
        },
        _setRowSpanInfo : function (item, prev, col, spanCount) {
            if (!prev) {
                item[col.name + "__Row"] = spanCount;
                if (col.theSame && col.theSame.length) {
                    $.each(col.theSame, function (k, subcol) {
                        item[subcol.name + "__Row"] = spanCount;
                    });
                }
                return 1;
            }
            var resetCount = 1;
            var setSpan = spanCount;
            if (item[col.name] === prev[col.name]) {  //  当前行与前一行内容相等
                setSpan = 0;
                resetCount = spanCount + 1;
            }
            item[col.name + "__Row"] = setSpan;
            if (col.theSame && col.theSame.length) {
                $.each(col.theSame, function (k, subcol) {
                    item[subcol.name + "__Row"] = setSpan;
                });
            }
            return resetCount;
        },
        _setCellHtml : function (item, col, rCount, bodyHtml) {
            var g = this, p = this.options;
            bodyHtml.push('<td');

            var cellVal = g._getCellContent(item, col);

            if (col.title) {
                bodyHtml.push(' title="' + cellVal + '"');
            }

            if (col.align) {
                bodyHtml.push(' align="' + col.align + '"');
            }
            var clazz = '';
            if (p.classRender) {
                clazz = p.classRender.call(g, item, col);
                if (!clazz) {
                    clazz = '';
                }
            }
            var myStyle = '';
            if(p.styleRender){
                myStyle = p.styleRender.call(g, item, col);
                if(!myStyle){
                    myStyle = '';
                }
            }

            if(col.editable){
                clazz += " evilui-td-input-editor-identify";
            }

            if (col.dataClass && col.dataClass != '') {
                if(clazz && col.dataClass != '')
                    bodyHtml.push(' class="' + clazz + ' ' + col.dataClass + '"');
                else
                    bodyHtml.push(' class="' + col.dataClass + '"');
            } else if (clazz && clazz != '') {
                bodyHtml.push(' class="' + clazz + '"');
            }
            if(col.editable){
//                myStyle = 'style="padding: 0 3px 0 5px" ';
            }
            bodyHtml.push( ' ' + myStyle);

            if (rCount == undefined || rCount == null) {

            } else {
                bodyHtml.push(' rowspan="' + rCount + '"');
            }
            if(!col.editable || !col.datakey || !item[col.datakey])
                bodyHtml.push(">" + cellVal + "</td>");
            else{

                bodyHtml.push(">"
                    + "<font id='d_" + item[col.datakey] + "_" + col.name + "_" + cellVal + "' class='_displayField'>" + cellVal + "</font>"
                    + "<input type='text' style='display:none; width:100%; padding: 0;border: none;' class='_editField' id='h_"
                    + item[col.datakey] + "_" + col.name + "_" + cellVal + "' name='" + item[col.datakey] + "_" + col.name + "_" + cellVal + "' value='"
                    + cellVal + "'></input>"
                    + "</td>");
            }
        },
        _getCellContent : function (item, col) {
            if (col.render) {
                return col.render.call(this, item);
            }
            if (col.type) {
                var func = $.evilGrid.defaults.formatters[col.type];
                if (func && $.isFunction(func)) {
                    return func(item[col.columnname], col);
                }
            }
            var val = item[col.columnname];
            if(val == undefined){
                val = '';
            }
            return val;
        },
        enableEdit : function(){
            $('td.evilui-td-input-editor-identify').addClass('evilui-td-input-editor');
            $('._displayField').hide();
            $('._editField').show();
        },
        displayOnly : function(isSave){
            $('td.evilui-td-input-editor-identify').removeClass('evilui-td-input-editor');
            $('._displayField').show();
            $('._editField').hide();
            if(isSave){

            }
            else{

            }
        },
        allowEdit : function(row, col){
            if(!col.editable || !col.datakey || !item[col.datakey])
                return false;
            $('#'+'d_'+row[col.datakey]+'_'+col.name).attr('class', '_displayField');
            $('#'+'h_'+row[col.datakey]+'_'+col.name).attr('class', '_editField');
            $('#'+'h_'+row[col.datakey]+'_'+col.name).attr('name', row[col.datakey]+col.name);
        },
        rejectEdit : function(row, col){
            $('#'+'d_'+row[col.datakey]+'_'+col.name).show();
            $('#'+'h_'+row[col.datakey]+'_'+col.name).hide();
            $('#'+'d_'+row[col.datakey]+'_'+col.name).attr('class', '');
            $('#'+'h_'+row[col.datakey]+'_'+col.name).attr('class', '');
            $('#'+'h_'+row[col.datakey]+'_'+col.name).attr('name', '');
        }
    };


    $.fn.evilGrid = function (options) {
        var cfg = $.extend({}, $.evilGrid.defaults, options);
        return new $.evilGrid(this, cfg);
    };
})(jQuery);