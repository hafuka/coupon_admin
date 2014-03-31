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

            <h2 class="p10 fs20 textCenter bgWhite">パスワード変更</h2>

            <div class="m20" data-ng-controller="mainCtrl">
                <form method="post" action="${urlPath!?html}/changePassword/update" name="frm" novalidate>
                    <div>
                        <h3 class="registMenu inlineBlock">新パスワード</h3>
                        <p class="pl10 fcOrange inlineBlock">※必須</p>
                        <p class="bgOrange fcWhite p5 mb5 fs14 inlineBlock" ng-show="frm.shopName.$error.required">★新しいメールアドレスを入力してください★</p>
                        <input type="text" id="newPassword" name="newPassword" value="" ng-model="newPassword" required>
                    </div>
                </form>
            </div>

            <div id="js_registArea" class="textCenter" style="margin: 20px 0 40px 0;">
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