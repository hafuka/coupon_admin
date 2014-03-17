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
        		<input type="hidden" id="hdn_imamge" name="hdn_imamge">
        		<#if dispImagePath!?has_content>
        			<img src="${dispImagePath!?html}">
        		</#if>
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
        		<div>
                    <div>
                        <p>地域：</p>
                        <p>
                            <select name="areaId" id="js_areaChange">
                                <option value="0">地域を選択してください</option>
                                <#list areaList as area>
                                	<option value="${area.value!?html}" <#if (area.value == '${dispAreaId!?html}')>selected</#if> >${area.label!?html}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                    <div>
                        <p>エリア：</p>
                        <p>
                            <select id="js_searchAreaDetailList" name="areaDetailId">
                                <option value="0">ｴﾘｱを選択してください</option>
                                <#if areaDetailList!?has_content>
                                <#list areaDetailList as areaDetail>
                                    <option value="${areaDetail.value!?html}" <#if (areaDetail.value == '${dispAreaDetailId!?html}')>selected</#if> >${areaDetail.label!?html}</option>
                                </#list>
                                </#if>
                            </select>
                        </p>
                    </div>
                    <div>
                        <p>業種：</p>
                        <p>
                            <select name="businessId">
                                <option value="0">業種を選択してください</option>
                                <#list businessList as business>
                                    <option value="${business.value!?html}" <#if (business.value == '${dispBusinessId!?html}')>selected</#if> >${business.label!?html}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                </div>
        	</form>

        	<div class="textCenter mv10">
                <a id="js_registBtn" href="javascript:void(0)" class="btn btnNormal jsTouchActive autoMargin">登録</a>
            </div>
        </section>

        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">
        <script src="/coupon_admin/js/basic.js"></script>
        <script>
            //グローバルで使う変数を定義
            var urlPath = '${urlPath}';
            var imagePath = '${imagePath}';
            var token = '${token!?html}';
        </script>
        <#-- JS - ログイン - -->
        <script>
            (function(){
                var loginBtn = ci.qs('#js_registBtn');
                ci.bind(loginBtn, 'click', function(){
                    document.frm.submit();
                });
            })();
        </script>
        <#-- JsRenderテンプレート：エリア検索リスト用 -->
        <script id="searchAreaDetailList_template" type="text/x-jsrender">
            <option value="{{:areaValue}}">{{:areaName}}</option>
        </script>

    </body>
</html>