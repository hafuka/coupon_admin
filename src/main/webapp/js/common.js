
/**
 * COUPON ISLAND 独自クラス
 */
var ci = ci || {};

var nativeSlice = Array.prototype.slice;
var
    reIdSelector = /^#([\w\-]+)$/,
    reClassSelector = /^\.([\w\-]+)$/,
    reTagSelector = /^[\w\-]+$/,
    reNameSelector = /^\[name=["']?([\w\-]+)["']?\]$/,
    reReady = /complete|loaded|interactive/;

/**
 * querySelectorのエイリアス
 * @param {String} selector
 * @param {HTMLElement} context
 * @returns {HTMLElement}
 */
ci.qs = function(selector, context) {
    var m;
    if(!context || !context.querySelector) {
        context = document;
    }
    if((m = reIdSelector.exec(selector))) {
        return document.getElementById(m[1]);
    } else {
        return context.querySelector(selector);
    }
};

/**
 * querySelectorAllのフック
 * @param {String} selector
 * @param {HTMLElement} context
 * @returns {Array of HTMLElement}
 */
ci.qsa = function(selector, context) {
    var result, m;
    if(!context || !context.querySelectorAll) {
        context = document;
    }
    if((m = reIdSelector.exec(selector))) {
        var elem = document.getElementById(m[1]);
        if(elem) {
            result = [elem];
        } else {
            return [];
        }
    } else if((m = reClassSelector.exec(selector))) {
        result = context.getElementsByClassName(m[1]);
    } else if((m = reTagSelector.exec(selector))) {
        result = context.getElementsByTagName(m[0]);
    } else if((m = reNameSelector.exec(selector))) {
        result = context.getElementsByName(m[1]);
    } else {
        result = context.querySelectorAll(selector);
    }
    return nativeSlice.call(result);
};

/**
 * 指定の要素にイベントをバインドする
 * @param {Array} targetElements
 * @param {String} type
 * @param {Function} callback
 */
ci.bind = function(targetElements, type, callback) {
    var _addEvent = function(_el){
        var _callbacks = 'eventCallbacks';
        if( _el[_callbacks] ){
            if( _el[_callbacks][type] ){
                _el[_callbacks][type].push(callback);
            } else {
                _el[_callbacks][type] = [callback];
            }
        } else {
            _el[_callbacks] = {};
            _el[_callbacks][type] = [callback];
        }
    };
    if(targetElements) {
        if(targetElements.nodeType) {
            _addEvent(targetElements);
            targetElements.addEventListener(type, callback);
        } else {
            for(var i = 0, len = targetElements.length;i < len;i++) {
                _addEvent(targetElements[i]);
                targetElements[i].addEventListener(type, callback);
            }
        }
    }
};

/**
 * add class to element
 * @param {HTMLElement} targetNode
 * @param {String} value
 */
function _addClass(targetNode, value) {
    var classList = (value + "").split(" ");
    var newClass = "", oldClass = targetNode.className + "";
    var arrayBuffer = oldClass.split(" ");
    var valueIndex = -1;
    for(var i = 0, len = classList.length;i < len;i++) {
        valueIndex = arrayBuffer.indexOf(classList[i]);
        if(valueIndex === -1) {
            arrayBuffer.push(classList[i]);
        }
    }
    newClass = arrayBuffer.join(" ");
    if(newClass != oldClass) {
        targetNode.className = newClass;
    }
}

/**
 * remove class from element
 * @param {HTMLElement} targetNode
 * @param {String} value
 */
function _removeClass(targetNode, value) {
    var classList = (value + "").split(" ");
    var newClass = "", oldClass = targetNode.className + "";
    var arrayBuffer = oldClass.split(" ");
    var valueIndex = -1;
    for(var i = 0, len = classList.length;i < len;i++) {
        valueIndex = arrayBuffer.indexOf(classList[i]);
        if(valueIndex !== -1) {
            arrayBuffer.splice(valueIndex, 1);
        }
    }
    newClass = arrayBuffer.join(" ");
    if(newClass != oldClass) {
        targetNode.className = newClass;
    }
}

/**
 * 指定の要素にクラスを追加する
 * @param {Array} targetElements
 * @param {String} className
 */
ci.addClass = function(targetElements, className) {
    if(targetElements) {
        if(targetElements.nodeType) {
            _addClass(targetElements, className);
        } else {
            for(var i = 0, len = targetElements.length;i < len;i++) {
                _addClass(targetElements[i], className);
            }
        }
    }
};

/**
 * 指定の要素からクラスを削除する
 * @param {Array} targetElements
 * @param {String} className
 */
ci.removeClass = function(targetElements, className) {
    if(targetElements) {
        if(targetElements.nodeType) {
            _removeClass(targetElements, className);
        } else {
            for(var i = 0, len = targetElements.length;i < len;i++) {
                _removeClass(targetElements[i], className);
            }
        }
    }
};

/**
 * 指定のクラスが存在するかをチェックする
 * @param {HTMLElement} targetElement
 * @param {String} className
 */
ci.hasClass = function(targetElement, className) {
    if(targetElement && targetElement.nodeType === 1){
        var arrayBuffer = (targetElement.className + "").split(" ");
        return (arrayBuffer.indexOf(className+ "") !== -1);
    }else{
         return false;
    }
};

/**
 * DOMContentLoadedのイベント
 * @param {Function} callback
 */
ci.ready = function(callback) {
    var args = nativeSlice.call(arguments, 1);
    if (reReady.test(document.readyState)) {
        if(!args) {
            callback.call(document);
        } else {
            callback.apply(document, args);
        }
    } else {
        var domContentLoadedCallback = function() {
            if(!args) {
                callback.call(document);
            } else {
                callback.apply(document, args);
            }
            document.removeEventListener("DOMContentLoaded", domContentLoadedCallback);
        };
        document.addEventListener("DOMContentLoaded", domContentLoadedCallback, false);
    }
};

/**
 * 指定エレメントまでスクロールする関数
 * @param element 対象のエレメント
 */
ci.scrollTo = function(element) {
    var pos = ci.cumulativeOffset(element);
    window.scroll(pos[0], pos[1]);
    return element;
};

/**
 * 指定エレメントのオフセット返す関数
 * @param element 対象のエレメント
 */
ci.cumulativeOffset = function(element) {
    var valueT = 0, valueL = 0;
    do {
        valueT += element.offsetTop  || 0;
        valueL += element.offsetLeft || 0;
        element = element.offsetParent;
    } while (element);
    var result = new Array(valueL, valueT);
    return result;
};

/**
 * ajax通信
 */
function ajaxJsonGlobal(url, data, onSuccess){
    $.ajax({
        type: "POST",
        url: url,
        cache: false,
        data: data,
        dataType: 'json',
        success: function (data, status, xhr) {
            onSuccess(data);
            console.log(data);
        },
        error: function(msg){
            console.log('通信にエラーが発生しました。しばらくしてから再度お試しください。');
        }
    });
};

/**
 * 画像のスライド表示
 * @param elm 対象のエレメント名
 * @param options delay:待機時間, speed:フェードアウト速度
 */
var sliderImages = function (elm, options) {
    var timer;
    var index = 1;
    var speed = 25;
    var sliderObj = document.getElementById(elm);
    var sliderList = [];
    var sliderNodeList = sliderObj.getElementsByTagName('li');
    var df_options = {
        delay: 4000,
        speed: 50
    };

    for(var i in df_options){
        if(options[i] === undefined) options[i] = df_options[i];
    }

    for (var i = 0; i < sliderNodeList.length; i++) {
        sliderNodeList[i].style.zIndex = i + 1;
        sliderNodeList[i].style.opacity = (i === 0) ? 1 : 0;
        sliderList.push(sliderNodeList[i]);
    }

    var changeImage = function () {
        var timerId = setInterval(function () {
            var current, next, len;
            len = sliderList.length;
            current = sliderList[index].style.opacity;
            next = (Math.floor(current * 10) + 1) / 10;

            sliderList[index].style.display = 'block';

            if (sliderList[index].style.opacity <= 1) {
                sliderList[index].style.opacity = next;
            } else {
                clearInterval(timerId);

                sliderList.push(sliderList.shift());
                for (var i = len - 1; i >= 0; i--) {
                    sliderList[i].style.zIndex = i;
                }
                sliderList[len - 1].style.opacity = 0;
                sliderList[len - 1].style.display = 'none';
            }
        }, options.speed);
    };

    if(sliderList.length > 1) {
        sliderObj.addEventListener('click', function (e) {
            clearTimeout(timer);
            changeImage();
            timer = setInterval(changeImage, options.delay + (options.speed * 10));
        });

        timer = setInterval(changeImage, options.delay + (options.speed * 10));
    }
};

(function(){
    $(function(){
        var currentUrl = location.href;
        var splitUrlList = currentUrl.split('/', 6);
        var menuList = ci.qsa('.menuList');
        
        //ページによって、メニューにactiveをつける
        if( splitUrlList[4] == 'mypage' ){
            ci.addClass(menuList[0], 'active');
        }else if( splitUrlList[4] == 'favorite' ){
            ci.addClass(menuList[1], 'active');
        }else if( splitUrlList[4] == 'search' ){
            ci.addClass(menuList[2], 'active');
        }else if( splitUrlList[4] == 'shopSearch' ){
            ci.addClass(menuList[3], 'active');
        }else if( splitUrlList[4] == 'box' ){
            ci.addClass(menuList[4], 'active');
        }
        
        //ボタン押下時の挙動
        var touchActiveList = ci.qsa('.jsTouchActive');
        ci.bind(touchActiveList, 'touchstart', function() {
            ci.addClass(this, 'touchActive');
        });
        ci.bind(touchActiveList, 'touchend', function() {
            ci.removeClass(this, 'touchActive');
        });

    });
})();
