<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>

    <body class="outline mypageContents">

        <#-- ふきだしナビ -->
        <section>
            <div class="autoMargin mv20 table">
                <div class="cell">
                    <img src="${imagePath}/images/common/saboten_normal.png" width="37" height="37" class="vBottom">
                </div>

                <div class="cell vMiddle relative pl10">
                    <div class="balloon">
                        <p>
                            申し訳ございません。<br>
                            現在アクセスしづらい状況になっております。<br>
                            再度時間をおいてアクセスして下さい。
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <#-- リンクナビ -->
        <nav>
            <div class="textCenter mv20">
                <a href="${urlPath}/" class="btn btnNormal jsTouchActive autoMargin">TOPへ</a>
            </div>
        </nav>

        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">

    </body>

</html>