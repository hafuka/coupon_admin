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
            
            <h2 class="p10 fs20 textCenter bgWhite">クーポンをもっているお客さんへのご対応について</h2>

            <div class="m20 bgWhite p10">
                <div class="table">
                    <div class="cell pr10">
                        <img src="${imagePath}/images/howto/howto_2.png" width="250">
                    </div>
                    <div class="cell vTop fs20" style="line-height: 30px;">
                        ・左のクーポン画像を<span class="fcOrange">お客さんが見せてきたらクーポンの割引をしてあげてください。</span><br>
                        <br>
                        ・画像右上の<span class="fcOrange">「使えるよ♪」マークがでてるクーポンが実際に使えるクーポンになります</span>ので、これが出ているかどうかを確認してください。<br>
                        <br>
                        ・使用期限に書かれている日時が<span class="fcOrange">期限内かどうか</span>を確認してください。
                    </div>
                </div>
            </div>
            
            <nav>
                <div class="textCenter" style="margin: 20px 0 40px 0;">
                    <a href="${urlPath}/menu" class="btn btnNormal jsTouchActive autoMargin" style="width: 250px;">メニューへ戻る</a>
                </div>
            </nav>
            
            <h2 id="ac_storeDetail" class="p10 fs20 textCenter bgWhite">店舗詳細ページイメージ図</h2>

            <div class="m20 bgWhite p10">
                <div class="textCenter">
                    <img src="${imagePath}/images/howto/howto_1.png" width="250">
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