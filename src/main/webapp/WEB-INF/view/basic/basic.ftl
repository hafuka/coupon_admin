<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>
    
    <body class="outline formContents">
        <section>
            基本情報
        </section>
        <section>
        	
        	<form method="post" action="${urlPath!?html}/basic/regist" name="frm">
        		<div>
	        		<input type="file" id="files" name="image" enctype="multipart/form-data" />
	            	<output id="list"></output>
            	</div>
        		<div>
        			店舗名：<input type="text" id="shopName" name="shopName" value="<#if shop!?has_content>${shop.shopName!?html}</#if>">
        		</div>
        		<div>
        			店舗説明：<input type="text" id="description" name="description" value="<#if shop!?has_content>${shop.description!?html}</#if>">
        		</div>
        		<div>
        			URL：<input type="text" id="url" name="url" value="<#if shop!?has_content>${shop.url!?html}</#if>">
        		</div>
        		<div>
        			電話番号：<input type="text" id="tell" name="tell" value="<#if shop!?has_content>${shop.tell!?html}</#if>">
        		</div>
        		<div>
        			住所：<input type="text" id="address" name="address" value="<#if shop!?has_content>${shop.address!?html}</#if>">
        		</div>
        		<div>
        			最寄駅：<input type="text" id="station" name="station" value="<#if shop!?has_content>${shop.station!?html}</#if>">
        		</div>
        		<div class="cell">
                    <div class="pv3">
                        <p class="fcWhite fs14 textShadow inlineBlock w60">地域：</p>
                        <p class="selectBox inlineBlock vMiddle">
                            <select name="area" id="js_areaChange">
                                <option value="0">地域を選択してください</option>
                                <#list areaList as area>
                                    <option value="${area.value!?html}">${area.label!?html}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                    <div class="pv3">
                        <p class="fcWhite fs14 textShadow inlineBlock w60">エリア：</p>
                        <p class="selectBox inlineBlock vMiddle">
                            <select id="js_searchAreaDetailList" name="areaDetail">
                                <option value="0">ｴﾘｱを選択してください</option>
                            </select>
                        </p>
                    </div>
                    <div class="pv3">
                        <p class="fcWhite fs14 textShadow inlineBlock w60">業種：</p>
                        <p class="selectBox inlineBlock vMiddle">
                            <select name="business">
                                <option value="0">業種を選択してください</option>
                                <#list businessList as business>
                                    <option value="${business.value!?html}">${business.label!?html}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                </div>
        	</form>
        	
        	<div class="textCenter mv10">
                <a id="js_registBtn" href="javascript:void(0)" class="btn btnNormal jsTouchActive autoMargin">ログイン</a>
            </div>
        </section>
        
        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">
        <script src="/coupon_admin/js/basic.js"></script>
        
        <#-- JS - ログイン - -->
        <script>
            (function(){
                var loginBtn = ci.qs('#js_registBtn');
                ci.bind(loginBtn, 'click', function(){
                    document.frm.submit();
                });
            })();
        </script>
        
    </body>
</html>