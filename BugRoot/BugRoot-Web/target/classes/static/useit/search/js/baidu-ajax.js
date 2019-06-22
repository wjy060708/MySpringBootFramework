
(function( window, undefined ) {

var baiduAjax = {};

baiduAjax.extend = function (dest) {
     sources = Array.prototype.slice.call(arguments, 1);
     for (var j = 0, len = sources.length, src; j < len; j++) {
         src = sources[j] || {};
         for (var i in src) {
              if (src.hasOwnProperty(i)) {
                   dest[i] = src[i];
               }
          }
     }
     return dest;
}

baiduAjax.format = function(tpl,obj){
		for (var key in obj) {
			var reg = new RegExp("#{"+key+"}","g");
				tpl = tpl.replace(reg,obj[key]);
		};

		return tpl;
}

baiduAjax.post = function(url, data, onsuccess){
    $.ajax({
           url:url,
           data:data,
           type:'POST',
           success: onsuccess
    });

}

baiduAjax.get = function(url, onsuccess) {
    $.ajax({
           type:'GET',
           url:url,
           success: onsuccess
    });

}
/**
* 骞垮憡璺宠浆url
*/
baiduAjax.jumpURL = "http://rp.baidu.com/rpadroute/router";
/**
* 瑙ｆ瀽涓€涓潪鐨偆绫诲箍鍛�(涓婃柟锛歴earch_ad_ppim)
* @function
* @grammar baiduAjax.parseRUAd(dataJson)
* @param {object}   dataJson  杩斿洖鐨勬暟鎹�
* 
*/
baiduAjax.parseRUTopAd = function(dataJson,position,jumpData){
  var adTpl = ["<div style='' id='#{position}'>",
               "<a href='#{aLink}' target='_blank' style='display: inline-block;width: 100%;'>#{aLinkText}</a><br/>",
               "<div>",
                   "<a href='#{aLink}' target='_blank' style='display:inline-block;vertical-align:top;margin-top:4px;'><img src='#{imgSrc}' alt='#{imgAlt}' width='75px' height='56px' style='vertical-align:bottom;border:none'/></a>",
                   "<p style='display:inline-block;width:447px;margin-left:8px;font-size:12px;'>",
                      "<a href='#{aLink}' target='_blank' style='display:inline-block;vertical-align:top;word-break:break-all;width:100%;text-decoration:none;'><span title='#{imgTitleAll}' style='color:#333;'>#{imgTitle}</span></a>",
                      "<font style='white-space:nowrap;'>#{aList}<a href='#{aLink}' target='_blank' style='display:inline-block;width:100%;vertical-align:bottom;height:15px;'></a></font>",
                      "<a href='#{aLink}' target='_blank' style='display:inline-block;vertical-align:top;width:100%;'><span style='vertical-align:top;display:inline-block;color: #080;font-size:small;'>http://www.vip.com</span></a>",
                   "</p>",
               "</div>",
              "</div>"].join("");

  var aLink,aLinkText="",imgSrc="",imgTitle="",imgTitleAll = "",imgAlt="",aList = "",aLinkT="";
  if(dataJson.status == 0){ //鎴愬姛
        var adInfos;
        if(typeof(dataJson.adInfo) == "string"){
            adInfos = eval("(" + dataJson.adInfo + ")");
        }else{
            adInfos = dataJson.adInfo;
        }
    //鏆傛椂鍏堝彇骞垮憡鐨勭涓€鏉℃暟鎹�
    jumpData.ad_url = adInfos[position].ads[0].target_url;
    if(jumpData.ad_url.indexOf("http://") < 0){
        jumpData.ad_url = "http://" + jumpData.ad_url;
    }
    aLinkT = adInfos[position].ads[0].target_url;
    jumpData.ad_id = adInfos[position].ads[0].ad_id;
    aLink = baiduAjax.jumpURL + "?" + $.param(jumpData);

    if(adInfos[position].ads[0].extend_info && adInfos[position].ads[0].extend_info.title){
        aLinkText = adInfos[position].ads[0].extend_info.title;
    }else{
       aLinkText = "";
    }

    if(adInfos[position].ads[0].extend_info.channelLink){
        var channels = adInfos[position].ads[0].extend_info.channelLink;
        for (var i = channels.length - 1; i >= 0; i--) {
          var link_url = channels[i].link;
          if(link_url.indexOf("http://") < 0){
              link_url = "http://" + link_url;
          }
           aList = aList + "<a href='" + link_url + "' target='_blank'>"+ channels[i].word + "</a>&nbsp;&nbsp;";
        };
    }
    
    //鍙杋mg鐨勭涓€涓�
    if(adInfos[position].ads[0].img_list && adInfos[position].ads[0].extend_info && adInfos[position].ads[0].img_list.length > 0){
      if(adInfos[position].ads[0].extend_info.description){
        imgTitleAll = adInfos[position].ads[0].extend_info.description;
        imgTitle = imgTitleAll;
        if(imgTitle.length > 35){
           imgTitle = imgTitle.substring(0,35) + "...";
        }
      }else{
        imgTitle = "";
      }

      imgAlt = aLinkText;
      imgSrc = adInfos[position].ads[0].img_list[0].img_url;

    }else{
      imgAlt = "";
      imgSrc = "";
    }


    return baiduAjax.format(adTpl,{
      aLink : aLink,
      aLinkText : aLinkText,
      imgTitle : imgTitle,
      imgAlt : imgAlt,
      aList: aList,
      imgTitleAll:imgTitleAll,
      imgSrc : imgSrc,
      aLinkT:aLinkT,
      position : position
    });
  }else{
      return "";
  }

  return "";
}
/**
* 瑙ｆ瀽涓€涓潪鐨偆绫诲箍鍛�(鍙虫柟锛歴earch_ad_im_1 )
* @function
* @grammar baiduAjax.parseRUAd(dataJson)
* @param {object} 	dataJson 	杩斿洖鐨勬暟鎹�
* 
*/
baiduAjax.parseRUAd = function(dataJson,position,jumpData){
	var adTpl = ["<div style='' id='#{position}'>",
				 	"<a href='#{aLink}' target='_blank' style='display:block;'>",
				 		"<img src='#{imgSrc}' title='#{imgTitle}' alt='#{imgAlt}' width='300px' height='250px'/>",
				 	"</a>",
				 "</div>"].join("");

	var aLink,aLinkText,imgSrc="",imgTitle,imgAlt="";
	if(dataJson.status == 0){ //鎴愬姛
        var adInfos;
        if(typeof(dataJson.adInfo) == "string"){
            adInfos = eval("(" + dataJson.adInfo + ")");
        }else{
            adInfos = dataJson.adInfo;
        }
		//鏆傛椂鍏堝彇骞垮憡鐨勭涓€鏉℃暟鎹�
		jumpData.ad_url = adInfos[position].ads[0].target_url;
    if(jumpData.ad_url.indexOf("http://") < 0){
             jumpData.ad_url = "http://" + jumpData.ad_url;
    }
    jumpData.ad_id = adInfos[position].ads[0].ad_id;
    aLink = baiduAjax.jumpURL + "?" + $.param(jumpData);
    // if(adInfos[position].ads[0].extend_info && adInfos[position].ads[0].extend_info.title){
    //     aLinkText = adInfos[position].ads[0].extend_info.title;
    // }else{
    //    aLinkText = "";
    // }
		
		//鍙杋mg鐨勭涓€涓�
		if(adInfos[position].ads[0].img_list && adInfos[position].ads[0].extend_info && adInfos[position].ads[0].img_list.length > 0){
			imgTitle = adInfos[position].ads[0].extend_info.title;
			imgAlt = adInfos[position].ads[0].extend_info.title;
			imgSrc = adInfos[position].ads[0].img_list[0].img_url;
		}


		return baiduAjax.format(adTpl,{
			aLink : aLink,
			imgTitle : imgTitle,
			imgAlt : imgAlt,
			imgSrc : imgSrc,
      position : position
		});
	}else{
      return "";
  }

	return "";
}

/**
* 瑙ｆ瀽涓€涓毊鑲ょ被骞垮憡(宸︿晶锛歴earch_ad_show_1锛屽彸渚э細search_ad_show_2)
* @function
* @grammar baiduAjax.parseSkinAd(dataJson)
* @param {object}   dataJson    杩斿洖鐨勬暟鎹�
* 
*/
baiduAjax.parseSkinAd = function(dataJson,position,jumpData){
    var adTpl = ["<div style='background:url(#{imgSrc}) no-repeat;width:100%;height:100%;'>",
                  "<a href='#{aLink}' target='_blank' style='display:block;width:100%;height:100%;'>",
                  "</a>",
                 "</div>"].join("");
    var tplStr;

    var aLink,imgSrc="",imgTitle;
    if(dataJson.status == 0){ //鎴愬姛
        var adInfos;
        if(typeof(dataJson.adInfo) == "string"){
            adInfos = eval("(" + dataJson.adInfo + ")");
        }else{
            adInfos = dataJson.adInfo;
        }
        
        //鏆傛椂鍏堝彇骞垮憡鐨勭涓€鏉℃暟鎹�
        jumpData.ad_url = adInfos[position].ads[0].target_url;
        if(jumpData.ad_url.indexOf("http://") < 0){
             jumpData.ad_url = "http://" + jumpData.ad_url;
        }
        jumpData.ad_id = adInfos[position].ads[0].ad_id;
        aLink = baiduAjax.jumpURL + "?" + $.param(jumpData);
            //鍙杋mg鐨勭涓€涓�
        if(adInfos[position].ads[0].img_list && adInfos[position].ads[0].img_list.length > 0){
            //imgTitle = adInfos[position].ads[0].img_list[0].anchor;
            imgSrc = adInfos[position].ads[0].img_list[0].img_url;
        }

        tplStr = baiduAjax.format(adTpl,{
                aLink : aLink,
                imgSrc : imgSrc
        });

        return {
            url : aLink,
            tpl : tplStr
        };
    }else{
      return {
        url:"",
        tpl:""
      };
    }

    return "";
}
/**
* 瀵瑰乏渚х毊鑲ゅ仛鐗瑰埆澶勭悊锛坥nclick锛�
* @function
* @grammar baiduAjax.clickSkinLeft()
* @param {object}   dataJson    杩斿洖鐨勬暟鎹�
* 
*/
baiduAjax.clickSkinLeft = function(e,url){
     var evt = e || window.event,
         elem;
     if(evt.target){
        elem = evt.target;
     }else{
        elem = evt.srcElement;
     }
     //鍒ゆ柇浜嬩欢鐨勭洰鏍�
     if(elem && elem.tagName.toUpperCase() != 'A'){
         window.open(url, "_blank");
     }

     return false;
}

/**
* 骞垮憡鐐瑰嚮缁熻
* @function
* @grammar baiduAjax.clickStatistics()
* @param {object}   data   post鏁版嵁
* 
*/
baiduAjax.clickStatistics = function(data){
    
    baiduAjax.post("/cse/adclick",data,function(){
        
    });

     return false;
}
//鏆撮湶鎺ュ彛
window.baiduAdUtil = baiduAjax;

})( window );