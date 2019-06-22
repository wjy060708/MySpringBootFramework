
function kym_list_show(pid, type, src){
    if(kym_list_youke == '1' && discuz_uid == '0'){
        showWindow('login', 'member.php?mod=logging&action=login');
        return ;
    }
    
    $('kym_list_ul_' + pid).style.display = 'none';
    $('kym_list_show_' + pid).style.display = 'block';
    $('kym_list_bar_' + pid + '_' + type).style.display = 'block';
    
    if(type == 'img'){
        $('kym_list_content_'+pid).innerHTML = '<img class="kym_list_content_img" id="kym_list_content_img_' + pid + '" src="' + src + '" onload="kym_list_show_size(this)" onclick="kym_list_hide(' + pid + ')" />';
    }else{
        $('kym_list_content_'+pid).innerHTML = AC_FL_RunContent('width', kym_list_kuan, 'height', kym_list_kuan * 0.75, 'allowNetworking', 'internal', 'allowScriptAccess', 'never', 'src', src, 'quality', 'high', 'bgcolor', '#ffffff', 'wmode', 'transparent', 'allowfullscreen', 'true');
        
    }
}

function kym_list_hide(pid){
    $('kym_list_content_'+pid).innerHTML = ''
    $('kym_list_bar_' + pid + '_swf').style.display = 'none';
    $('kym_list_bar_' + pid + '_img').style.display = 'none';
    $('kym_list_show_' + pid).style.display = 'none';
    $('kym_list_ul_' + pid).style.display = 'block';
}


function kym_list_show_size(img){
    if(img){
        setTimeout(function(){
                   if(img.offsetWidth && img.offsetHeight){
                   if(img.offsetWidth > kym_list_kuan){
                   img.style.width = kym_list_kuan + 'px';
                   }
                   }
                   }, 20);
    }
}

function kym_list_add_call(pid, k, img){
    if(img){
        setTimeout(function(){
                   $('kym_list_'+pid).style.display = 'block';
                   var w = img.width;
                   var h = img.height;
                   //if(h > kym_list_gao){
                   w = parseInt((img.width * kym_list_gao / img.height), 10);
                   h = kym_list_gao;
                   //}
                   var a = 0;
                   try{
                   a = parseInt($('kym_list_ul_' + pid).allw, 10);
                   if(isNaN(a)){
                   a = 0;
                   }
                   }catch(e){}
                   
                   if(a + w + 10 > kym_list_maxkuan){
                   return ;
                   }
                   
                   a = a + w + 10;
                   try{
                   $('kym_list_ul_' + pid).allw = a;
                   }catch(e){}
                   
                   $('kym_list_li_'+pid+'_'+k).style.display = 'block';
                   $('kym_list_li_d_'+pid+'_'+k).style.display = 'block';
                   $('kym_list_li_d_'+pid+'_'+k).style.width = w;
                   $('kym_list_li_d2_'+pid+'_'+k).style.width = w;
                   $('kym_list_li_d_'+pid+'_'+k).innerHTML = '<img src="'+img.src+'" width="'+w+'" height="'+h+'" />';
                   }, 20);
    }
}

function kym_list_add(pid, k, src){
    var img = new Image();
    img.src = src;
    if(img.complete){
        kym_list_add_call(pid, k, img)
    }
    img.onload = function(){
        kym_list_add_call(pid, k, img);
        img.onload = null;
    }
}


function kym_list_mouseover(e, t){
    e.className = 'kym_list_btn kym_list_btn_'+t+'_hover';
}


function kym_list_mouseout(e, t){
    e.className = 'kym_list_btn kym_list_btn_'+t;
}


function kym_list_img_blank(pid){
    var img = $('kym_list_content_img_'+pid);
    if(img){
        window.open(img.src);
    }
}

function kym_list_img_rotate_init(img, fx){
    var rotate = img.rotate ? (img.rotate) * 1 : 0;
    rotate = rotate + fx * 90;
    img.rotate = rotate;
    var wBh = 1;
    if(Math.abs(rotate) % 180 != 0 && img.offsetHeight > img.offsetWidth){
        wBh = img.offsetWidth / img.offsetHeight;
    }
    kym_list_img_rotate_rotation(img, rotate, wBh);
}

function kym_list_img_rotate_rotation(img, rotate, wBh){
    if(kym_list_img_rotate_checkCSS3("transform")){
        kym_list_img_rotate_rotationForCSS3(img, rotate, wBh);
    }else{
        kym_list_img_rotate_rotationForIE(img, rotate, wBh);
    }
}

function kym_list_img_rotate_rotationForCSS3(img, rotate, wBh){
    var c = ( rotate % 180 == 0) ? 0 : (-(img.offsetHeight - img.offsetWidth * wBh) / 2);
    var b = img.parentNode;
    kym_list_img_rotate_css3(img, "transform", "translate(0px, " + c + "px) rotate(" + rotate + "deg) scale(" + wBh + ", " + wBh + ")");
    if(rotate % 180 != 0){
        b.style.height = (img.offsetWidth * wBh) + "px"
    }else{
        b.style.height = (img.offsetHeight * wBh) + "px"
    }
}

function kym_list_img_rotate_css3(d, a, c){
    if(!d || !a || a == ""){
        return false;
    }
    var b = kym_list_img_rotate_checkCSS3(a);
    if(!b){
        return false;
    }
    if(c){
        d.style[b] = c;
    }else{
        return d.style[b];
    }
}

function kym_list_img_rotate_rotationForIE(img, rotate, wBh){
    if(BROWSER.ie && BROWSER.ie < 8){
        var a = kym_list_img_rotate_getMatrix(rotate * Math.PI / 180, wBh);
        img.style.filter = "progid:DXImageTransform.Microsoft.Matrix(SizingMethod='auto expand')";
        kym_list_img_rotate_filters_extend(img.filters.item("DXImageTransform.Microsoft.Matrix"), a);
    }
    if(BROWSER.ie && BROWSER.ie >= 8){
        var d = img.parentNode,
        a = kym_list_img_rotate_getMatrix(rotate * Math.PI / 180, wBh);
        img.style.filter = "progid:DXImageTransform.Microsoft.Matrix(SizingMethod='auto expand')";
        if(rotate % 180 != 0){
            var e = img.offsetWidth * wBh, c = img.offsetHeight * wBh;
            img.style.visibility = "hidden";
            kym_list_img_rotate_filters_extend(img.filters.item("DXImageTransform.Microsoft.Matrix"), a);
            d.style.height = e + "px";
            d.style.position = "relative";
            img.style.visibility = "";
            img.style.display = "block";
            img.style.position = "absolute";
            img.style.left = ((d.offsetWidth - img.offsetHeight*wBh) / 2) + "px";
        }else{
            kym_list_img_rotate_filters_extend(img.filters.item("DXImageTransform.Microsoft.Matrix"), a);
            d.style.height = (img.offsetHeight * wBh)  + "px";
            d.style.position = "";
            img.style.display = "";
            img.style.position = "";
            img.style.left = "0px";
        }
    }
}

function kym_list_img_rotate_filters_extend(a, b){
    for(var i in b){
        a[i] = b[i];
    }
    return a;
}

function kym_list_img_rotate_getMatrix(d, c){
    var a = Math.cos(d), b = Math.sin(d);
    return {M11 : a * c, M12 : -b * c, M21 : b * c, M22 : a * c};
}

function kym_list_img_rotate_checkCSS3(c){
    var g = document.body.style;
    var d = c.replace(/^\w/, function(h){
                      return h.toUpperCase();
                      });
    var f, b=[c,"Moz" + d, "webkit" + d, "O" + d, "ms" + d];
    for(var e = 0, a = b.length; e < a; e++){
        if(b[e] in g){
            f = b[e];
            break;
        }
    }
    if(!f){
        return false;
    }
    return f;
}


function kym_list_img_rotate(pid, fx){
    var img = $('kym_list_content_img_'+pid);
    if(img && img.offsetWidth && img.offsetHeight){
        kym_list_img_rotate_init(img, fx);
    }
}

