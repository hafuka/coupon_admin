<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>

    <body class="outline">

        <section>

            <h1 class="textCenter" style="padding: 50px 0; background-color: #fbe796;">
                <div class="table autoMargin">
                    <div class="cell">
                        <img src="${imagePath}/images/top/top_main.png" width="120" height="120">
                    </div>
                    <div class="cell fs25 vMiddle pl10" style="line-height: 35px;">
                        COUPON ISLAND<br>管理ツール
                    </div>
                </div>
            </h1>

            <nav>
                <div class="textCenter" style="padding: 50px 0;">
                    <div class="table autoMargin">
                        <div class="cell ph10">
                            <a href="${urlPath}/login" class="btn btnNormal jsTouchActive fs20" style="width: 180px; height: 60px; line-height: 45px;">ログイン</a>
                        </div>
                        <div class="cell ph10">
                            <a href="${urlPath}/register" class="btn btnPrimary jsTouchActive fs20" style="width: 180px; height: 60px; line-height: 45px;">新規店舗登録</a>
                        </div>
                    </div>
                    
                    <div class="textCenter" style="margin-top: 30px;">
                        ※こちらの管理ツールでクーポンやお店紹介情報の<br>登録・更新ができます。<br>
                        ※PCで操作をお願いします。スマートフォンには対応しておりません。
                    </div>
                </div>
            </nav>
            
            <div class="m10 fs16 textCenter">
                <a href="http://coupon-island.com/coupon/static/?page=terms" class="link2" target="_blank">ご利用規約</a>
            </div>
            
            <div class="textCenter" style="padding: 20px 0; background-color: #fbe796;">
                Copyright &copy; hubfactory
            </div>
        
        </section>

        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">

    </body>
</html>