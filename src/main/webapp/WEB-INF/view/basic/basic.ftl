<!DOCTYPE html>
<html lang="ja" data-ng-app>
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

            <div class="m20" data-ng-controller="mainCtrl">
                <form method="post" action="${urlPath!?html}/basic/regist" name="frm" novalidate>
                    <h3 class="registMenu">１.イメージ画像</h3>
                    <input type="hidden" id="hdn_imamge" name="hdn_imamge">
                    <#if dispImagePath!?has_content>
                        <img id="js_targetImage" src="${dispImagePath!?html}" width="150">
                    <#else>
                        <img id="js_targetImage" src="${imagePath}/images/common/no_image.png" width="150">
                    </#if>
                    <div>
                        <input type="file" id="fileSelector" accept="image/*" />
                    </div>
                    <p class="pv5">
                        ※正方形画像で登録をおねがいします。<br>
                        ※[300px] × [300px]程度の画像ですと高解像度のスマートフォンでもきれいに表示されます。<br>
                        ※画像の登録に推奨するブラウザは下記になります。<br>
                        ・Internet Explorer バージョン：10以上<br>
                        ・Safari バージョン：6以上<br>
                        ・Google Chrome バージョン：6以上<br>
                        画像が登録されない場合は、上記のブラウザの最新版をダウンロードしてお試してください。
                    </p>
                    <div>
                        <h3 class="registMenu inlineBlock">２.店舗名</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.shopName.$error.required">★店舗名を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageShopName}}</p>
                        <input type="text" id="shopName" name="shopName" value="<#if shop!?has_content>${shop.shopName!?html}</#if>" data-ng-model="shopName" required>
                    </div>
                    <div>
                        <h3 class="registMenu inlineBlock">３.店舗説明</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.description.$error.required">★店舗の説明を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageDescription}}</p>
                        <input type="text" id="description" name="description" value="<#if shop!?has_content>${shop.description!?html}</#if>" data-ng-model="description" required>
                    </div>
                    <div>
                        <h3 class="registMenu">４.URL</h3>
                        <input type="text" id="url" name="url" value="<#if shop!?has_content>${shop.url!?html}</#if>">
                    </div>
                    <div>
                        <h3 class="registMenu inlineBlock">５.電話番号</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.tel.$error.required">★電話番号を入力してください★</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.tel.$error.minlength">★電話番号を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageTel}}</p>
                        <input type="text" id="tel" name="tel" value="<#if shop!?has_content>${shop.tell!?html}</#if>" data-ng-model="tel" required data-ng-minlength="12">
                        <p class="pt5">（例）01-2345-6789</p>
                    </div>
                    <div>
                        <h3 class="registMenu inlineBlock">６.住所</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.address.$error.required">★住所を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageAddress}}</p>
                        <input type="text" id="address" name="address" value="<#if shop!?has_content>${shop.address!?html}</#if>" data-ng-model="address" required>
                    </div>
                    <div>
                        <h3 class="registMenu inlineBlock">７.最寄駅</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.station.$error.required">★最寄駅を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageStation}}</p>
                        <input type="text" id="station" name="station" value="<#if shop!?has_content>${shop.station!?html}</#if>" data-ng-model="station" required>
                    </div>
                    <div>
                        <h3 class="registMenu inlineBlock">８.地域</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p id="js_areaMessage" class="bgOrange fcWhite p5 mb5 fs14 inlineBlock">★地域を選択してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageAreaId}}</p>
                        <p>
                            <select id="js_areaChange" name="areaId" data-ng-model="areaId">
                                <option value="0">地域を選択してください</option>
                                <#list areaList as area>
                                    <option value="${area.value!?html}" <#if (area.value == '${dispAreaId!?html}')>selected</#if> >${area.label!?html}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                    <div>
                        <h3 class="registMenu inlineBlock">９.エリア</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p id="js_areaDetailMessage" class="bgOrange fcWhite p5 mb5 fs14 inlineBlock">★エリアを選択してください★</p>
                        <p id="js_areaDetailOkMessage" class="pl10 fcGreen inlineBlock">{{okMessageAreaDetailId}}</p>
                        <p>
                            <select id="js_searchAreaDetailList" name="areaDetailId" data-ng-model="areaDetailId">
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
                        <h3 class="registMenu inlineBlock">１０.業種</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p id="js_businessMessage" class="bgOrange fcWhite p5 mb5 fs14 inlineBlock">★業種を選択してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageBusinessId}}</p>
                        <p>
                            <select name="businessId" data-ng-model="businessId">
                                <option value="0">業種を選択してください</option>
                                <#list businessList as business>
                                    <option value="${business.value!?html}" <#if (business.value == '${dispBusinessId!?html}')>selected</#if> >${business.label!?html}</option>
                                </#list>
                            </select>
                        </p>
                    </div>

                    <div>
                        <h3 class="registMenu inlineBlock">１１.クーポン情報</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p id="js_couponInfo" class="bgOrange fcWhite p5 mb5 fs14 inlineBlock">★クーポン情報を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageCouponInfo}}</p>
                        <ul class="mb10">
                            <li class="couponDetailList srCouponBg">
                                <div class="table" style="width: 100%;">
                                    <div class="cell pl5 pr10" style="width: 60px;">
                                        <img src="${imagePath}/images/coupon/medal_sr.png" width="50" height="50" class="vMiddle">
                                    </div>
                                    <div class="cell vMiddle pr10" style="min-width:350px;">
                                        <input type="text" id="srCouponText" name="srCouponText" placeholder="SRクーポン情報を入力してください" value="<#if srCoupon!?has_content>${srCoupon.couponName!?html}</#if>" data-ng-model="srCouponText">
                                    </div>
                                    <div class="cell vMiddle" style="min-width:100px;">
                                        <input type="number" id="srScore" name="srScore" placeholder="パーセンテージを入力してください" min="1" max="99" value="<#if srCoupon!?has_content>${srCoupon.probability!?html}<#else>0</#if>" data-ng-model="srScore">
                                    </div>
                                    <div class="cell vMiddle">
                                        ％
                                    </div>
                                </div>
                                <div class="pl10">
                                    <p class="inlineBlock">※備考欄：</p>
                                    <input class="inlineBlock" style="width:70%;" type="text" id="srCouponDescription" name="srCouponDescription" placeholder="SRクーポンの説明・条件を入力してください" value="<#if srCoupon!?has_content>${srCoupon.description!?html}</#if>">
                                </div>
                            </li>
                            <li class="couponDetailList rCouponBg">
                                <div class="table" style="width: 100%;">
                                    <div class="cell pl5 pr10" style="width: 60px;">
                                        <img src="${imagePath}/images/coupon/medal_r.png" width="50" height="50" class="vMiddle">
                                    </div>
                                    <div class="cell vMiddle pr10" style="min-width:350px;">
                                        <input type="text" id="rCouponText" name="rCouponText" placeholder="Rクーポン情報を入力してください" value="<#if rCoupon!?has_content>${rCoupon.couponName!?html}</#if>" data-ng-model="rCouponText">
                                    </div>
                                    <div class="cell vMiddle" style="min-width:100px;">
                                        <input type="number" id="rScore" name="rScore" placeholder="パーセンテージを入力してください" min="1" max="99" value="<#if rCoupon!?has_content>${rCoupon.probability!?html}<#else>0</#if>" data-ng-model="rScore">
                                    </div>
                                    <div class="cell vMiddle">
                                        ％
                                    </div>
                                </div>
                                <div class="pl10">
                                    <p class="inlineBlock">※備考欄：</p>
                                    <input class="inlineBlock" style="width:70%;" type="text" id="rCouponDescription" name="rCouponDescription" placeholder="Rクーポンの説明・条件を入力してください" value="<#if rCoupon!?has_content>${rCoupon.description!?html}</#if>">
                                </div>
                            </li>
                            <li class="couponDetailList nCouponBg">
                                <div class="table" style="width: 100%;">
                                    <div class="cell pl5 pr10" style="width: 60px;">
                                        <img src="${imagePath}/images/coupon/medal_n.png" width="50" height="50" class="vMiddle">
                                    </div>
                                    <div class="cell vMiddle pr10" style="min-width:350px;">
                                        <input type="text" id="nCouponText" name="nCouponText" placeholder="Nクーポン情報を入力してください" value="<#if nCoupon!?has_content>${nCoupon.couponName!?html}</#if>" data-ng-model="nCouponText">
                                    </div>
                                    <div class="cell vMiddle" style="min-width:100px;">
                                        <input type="number" id="nScore" name="nScore" placeholder="パーセンテージを入力してください" min="1" max="99" value="<#if nCoupon!?has_content>${nCoupon.probability!?html}<#else>0</#if>" data-ng-model="nScore">
                                    </div>
                                    <div class="cell vMiddle">
                                        ％
                                    </div>
                                </div>
                                <div class="pl10">
                                    <p class="inlineBlock">※備考欄：</p>
                                    <input class="inlineBlock" style="width:70%;" type="text" id="nCouponDescription" name="nCouponDescription" placeholder="Nクーポンの説明・条件を入力してください" value="<#if nCoupon!?has_content>${nCoupon.description!?html}</#if>">
                                </div>
                            </li>
                        </ul>
                        <div class="textCenter pv10 mb10 bgWhite">
                            <p class="fcRed fs20">現在の合計パーセンテージ：{{getAmount() | number}}%</p>
                            <p class="fcOrange pt5 fs16">{{getMessage}}</p>
                        </div>
                        <div>
                            ※<span class="fcRed">パーセンテージは合計で100%</span>になるように入力してください。<br>
                            ※SR(スーパーレア):一番良いクーポン、R(レア)：次に良いクーポン、N(ノーマル)：通常のクーポン　です。<br>
                            （クーポン登録例）<br>
                            　　「お会計から5%OFF!」「生ビール1杯無料!」など。<br>
                            ※備考欄にはもし必要でありましたら個別に詳細などを記載ください。<br>
                            　(例)「お1人様に1枚有効」「グループで1枚有効」など。
                        </div>
                    </div>

                    <div>
                        <h3 class="registMenu inlineBlock">１２.クーポン有効期限</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.shopName.$error.required">★有効期限(日)を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageShopName}}</p>
                        <input type="text" id="limitDays" name="limitDays" value="<#if shop!?has_content>${shop.couponLimitDays!?html}</#if>" data-ng-model="limitDays" required>
                    </div>

                    <div>
                        <h3 class="registMenu inlineBlock">１３.閉店フラグ</h3>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" data-ng-show="frm.shopName.$error.required">★有効期限(日)を入力してください★</p>
                        <p class="pl10 fcGreen inlineBlock">{{okMessageShopName}}</p>
                        <input type="checkbox" id="closeFlg" name="closeFlg" <#if shop!?has_content && shop.closeFlg == 1>checked</#if>
                    </div>
                </form>
            </div>

            <div id="js_registArea" class="textCenter" style="margin: 20px 0 40px 0;">
                <a id="js_registBtn" href="javascript:void(0)" class="btn btnPrimary jsTouchActive autoMargin" style="width: 250px; height: 60px; line-height: 45px;">登録・変更する</a>
            </div>

            <div id="js_noRegistArea" class="textCenter" style="margin: 20px 0 40px 0;">
                <a id="js_noRegistBtn" href="javascript:void(0)" class="btn btnNoActive autoMargin" style="width: 250px; height: 60px; line-height: 20px;">入力が全てOKになると<br>登録できます</a>
            </div>


            <nav>
                <div class="textCenter" style="margin: 20px 0 40px 0;">
                    <a href="${urlPath}/menu" class="btn btnNormal jsTouchActive autoMargin" style="width: 250px;">メニューへ戻る</a>
                </div>
            </nav>

            <div class="textCenter" style="padding: 20px 0; background-color: #fbe796;">
                Copyright &copy; HUBFACTORY INC.
            </div>
        </section>

        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">
        <script src="/coupon_admin/js/angular.min.js"></script>
        <script src="/coupon_admin/js/ang_basic.js"></script>
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