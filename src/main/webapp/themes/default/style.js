$(function () {
    // 处理select边框
    $('.auto-wrap-select select,.search select,.applyform select,.applyform input,.applyform textarea,.ie6-auto-wrap').each(function () {
        var jObj = $(this);
        var tagName = jObj.attr('tagName');
        var tagType = jObj.attr('type');

        if(tagName === 'SELECT'){
            if (!jObj.hasClass('ie6notwrap')) {
                jObj.css("margin", "-2px");
                jObj.wrap('<div style="border: #999 1px solid; float:left; overflow:hidden;" class="ie6selectwrap"></div>');
            }
        }else if(tagName === 'INPUT'){
            if(tagType === 'text'){
                jObj.addClass('applyform-table-td-input-text');
            }
        }else if(tagName === 'TEXTAREA'){
            jObj.addClass('applyform-table-td-textarea');
        }

        if(tagName === 'INPUT' || tagName === 'TEXTAREA'){
            if(tagName === 'INPUT' && tagType === 'file'){
                jObj.addClass('applyform-table-td-input-file');
            }else{
                jObj.focus(function(){
                    $(this).css('border-color','#FF0000');
                });
                jObj.blur(function(){
                    $(this).css('border-color','#999');
                });
            }
        }
    });

    $('.search input,.search textarea').each(function(){
        var jObj = $(this);
        var tagName = jObj.attr('tagName');
        var tagType = jObj.attr('type');

        if(tagName === 'INPUT' || tagName === 'TEXTAREA'){
            jObj.focus(function(){
                $(this).css('border-color','#FF0000');
            });
            jObj.blur(function(){
                $(this).css('border-color','#999');
            });
        }
    });
});