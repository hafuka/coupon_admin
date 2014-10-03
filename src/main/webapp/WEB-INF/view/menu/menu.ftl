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

            <h2 class="p10 fs20 textCenter bgWhite">メニュー一覧</h2>

            <div class="m20">
                <div class="m10 fs22">
                    <a href="${urlPath!?html}/basic" class="link2">１.店舗情報登録・変更</a>
                </div>
                <div class="m10 fs22">
                    <a href="${urlPath!?html}/changeMail" class="link2">２.メールアドレス変更</a>
                </div>
                <div class="m10 fs22">
                    <a href="${urlPath!?html}/changePassword" class="link2">３.パスワード変更</a>
                </div>
                <div class="m10 fs22">
                    <a href="${urlPath!?html}/howto#ac_serviceDetail" class="link2">４.サービス詳細・サービスフローについて<span class="fcOrange">（重要）</span></a>
                </div>
                <div class="m10 fs22">
                    <a href="${urlPath!?html}/howto#ac_correspondence" class="link2">5.クーポンをもっているお客さんへのご対応について</a>
                </div>
                <div class="m10 fs22">
                    <a href="${urlPath!?html}/howto#ac_storeDetail" class="link2">6.店舗詳細ページイメージ図</a>
                </div>
                <div class="m10 fs22">
                    <a href="https://coupon-island.com/coupon/static/?page=terms" class="link2" target="_blank">7.ご利用規約（サービス内）</a>
                </div>
                <div class="m10 fs22">
                    <a href="${urlPath!?html}/howto#ac_serviceTerms" class="link2">8.7のご利用規約に準ずる店舗会員規約</a>
                </div>
            </div>

            <div class="textCenter" style="padding: 20px 0; background-color: #fbe796;">
                Copyright &copy; HUBFACTORY INC.
            </div>
        </section>

        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">

    </body>
</html>