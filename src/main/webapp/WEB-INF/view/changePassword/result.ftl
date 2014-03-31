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

            <h2 class="p10 fs20 textCenter bgWhite">パスワード変更完了</h2>

            <div class="m20" data-ng-controller="mainCtrl">
                <div>
                    <h3 class="registMenu inlineBlock">${loginAdminDto.password!?html}に変更しました</h3>
                </div>
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
    </body>
</html>