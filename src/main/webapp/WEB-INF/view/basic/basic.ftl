<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>

    <body class="outline formContents">

        <section>
        
            <h1 style="padding: 10px; background-color: #fbe796;">
                <div class="table autoMargin">
                    <div class="cell">
                        <img src="${imagePath}/images/top/top_main.png" width="70" height="70">
                    </div>
                    <div class="cell fs20 vMiddle pl10" style="line-height: 30px;">
                        COUPON ISLAND管理ツール
                    </div>
                </div>
            </h1>
            
            <h2 class="p10 fs20 textCenter bgWhite">店舗基本情報登録・変更</h2>
            
            <div class="m20">
                <form method="post" action="${urlPath!?html}/basic/regist" name="frm">
                    <h3 class="registMenu">１.イメージ画像</h3>
                    <input type="hidden" id="hdn_imamge" name="hdn_imamge">
                    <#if dispImagePath!?has_content>
                        <img src="${dispImagePath!?html}">
                    </#if>
                    <div>
                        <input type="file" id="files" name="image" enctype="multipart/form-data" />
                        <output id="list"></output>
                    </div>
                    <p class="pv5">※[300px] x [300px] の正方形画像で登録をおねがいします。</p>
                    <div>
                        <h3 class="registMenu">２.店舗名</h3>
                        <input type="text" id="shopName" name="shopName" value="<#if shop!?has_content>${shop.shopName!?html}</#if>">
                    </div>
                    <div>
                        <h3 class="registMenu">３.店舗説明</h3>
                        <input type="text" id="description" name="description" value="<#if shop!?has_content>${shop.description!?html}</#if>">
                    </div>
                    <div>
                        <h3 class="registMenu">４.URL</h3>
                        <input type="text" id="url" name="url" value="<#if shop!?has_content>${shop.url!?html}</#if>">
                    </div>
                    <div>
                        <h3 class="registMenu">５.電話番号</h3>
                        <input type="text" id="tell" name="tell" value="<#if shop!?has_content>${shop.tell!?html}</#if>">
                    </div>
                    <div>
                        <h3 class="registMenu">６.住所</h3>
                        <input type="text" id="address" name="address" value="<#if shop!?has_content>${shop.address!?html}</#if>">
                    </div>
                    <div>
                        <h3 class="registMenu">７.最寄駅</h3>
                        <input type="text" id="station" name="station" value="<#if shop!?has_content>${shop.station!?html}</#if>">
                    </div>
                    <div>
                        <h3 class="registMenu">８.地域</h3>
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
                        <h3 class="registMenu">９.エリア</h3>
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
                        <h3 class="registMenu">１０.業種</h3>
                        <p>
                            <select name="businessId">
                                <option value="0">業種を選択してください</option>
                                <#list businessList as business>
                                    <option value="${business.value!?html}" <#if (business.value == '${dispBusinessId!?html}')>selected</#if> >${business.label!?html}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                    
                    <div>
                        <h3 class="registMenu">１１.クーポン情報</h3>
                        <ul class="mb10">
                            <li class="couponDetailList srCouponBg">
                                <div class="table" style="width: 100%;">
                                    <div class="cell pl5 pr10" style="width: 60px;">
                                        <img src="${imagePath}/images/coupon/medal_sr.png" width="50" height="50" class="vMiddle">
                                    </div>
                                    <div class="cell vMiddle pr10" style="min-width:350px;">
                                        <input type="text" id="station" name="station" placeholder="SRクーポン情報を入力してください" value="<#if shop!?has_content>${shop.station!?html}</#if>">
                                    </div>
                                    <div class="cell vMiddle" style="min-width:100px;">
                                        <input type="text" id="station" name="station" placeholder="パーセンテージを入力してください" value="<#if shop!?has_content>${shop.station!?html}</#if>">
                                    </div>
                                    <div class="cell vMiddle">
                                        ％
                                    </div>
                                </div>
                            </li>
                            <li class="couponDetailList rCouponBg">
                                <div class="table" style="width: 100%;">
                                    <div class="cell pl5 pr10" style="width: 60px;">
                                        <img src="${imagePath}/images/coupon/medal_r.png" width="50" height="50" class="vMiddle">
                                    </div>
                                    <div class="cell vMiddle pr10" style="min-width:350px;">
                                        <input type="text" id="station" name="station" placeholder="SRクーポン情報を入力してください" value="<#if shop!?has_content>${shop.station!?html}</#if>">
                                    </div>
                                    <div class="cell vMiddle" style="min-width:100px;">
                                        <input type="text" id="station" name="station" placeholder="パーセンテージを入力してください" value="<#if shop!?has_content>${shop.station!?html}</#if>">
                                    </div>
                                    <div class="cell vMiddle">
                                        ％
                                    </div>
                                </div>
                            </li>
                            <li class="couponDetailList nCouponBg">
                                <div class="table" style="width: 100%;">
                                    <div class="cell pl5 pr10" style="width: 60px;">
                                        <img src="${imagePath}/images/coupon/medal_n.png" width="50" height="50" class="vMiddle">
                                    </div>
                                    <div class="cell vMiddle pr10" style="min-width:350px;">
                                        <input type="text" id="station" name="station" placeholder="SRクーポン情報を入力してください" value="<#if shop!?has_content>${shop.station!?html}</#if>">
                                    </div>
                                    <div class="cell vMiddle" style="min-width:100px;">
                                        <input type="text" id="station" name="station" placeholder="パーセンテージを入力してください" value="<#if shop!?has_content>${shop.station!?html}</#if>">
                                    </div>
                                    <div class="cell vMiddle">
                                        ％
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div>
                            ※<span class="fcRed">パーセンテージは合計で100%</span>になるように入力してください。<br>
                            ※SR(スーパーレア):一番良いクーポン、R(レア)：次に良いクーポン、N(ノーマル)：通常のクーポン　です。<br>
                            ※クーポン情報を<span class="fcRed">汎用的なもの（条件のないもの）</span>にしてください。<br>
                            （登録できる例）<br>
                            　　「お会計から5%OFF!」「生ビール1杯無料!」など。<br>
                            （登録できない例）<br>
                            　　「コース注文で5%OFF!」「3000円以上の購入でビール1杯無料!」など、<span class="fcRed">限定的な（条件のある）ものは登録できません。</span>
                        </div>
                    </div>
                </form>
            </div>

            <div class="textCenter" style="margin: 20px 0 40px 0;">
                <a id="js_registBtn" href="javascript:void(0)" class="btn btnPrimary jsTouchActive autoMargin" style="width: 250px; height: 60px; line-height: 45px;">登録する</a>
            </div>
            
            <nav>
                <div class="textCenter" style="margin: 20px 0 40px 0;">
                    <a href="${urlPath}/menu" class="btn btnNormal jsTouchActive autoMargin" style="width: 250px;">メニューへ戻る</a>
                </div>
            </nav>
            
            <div class="textCenter" style="padding: 20px 0; background-color: #fbe796;">
                Copyright &copy; hubfactory
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