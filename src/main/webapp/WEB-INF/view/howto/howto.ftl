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

            <h2 id="ac_serviceDetail" class="p10 fs20 textCenter bgWhite">サービス詳細・サービスフローについて</h2>

            <div class="m20 bgWhite p10">
                <p>（１）クーポンアイランドへの登録は無料です。</p>
                <p>（２）クーポンの内容/詳細/期限/確率などは自由に設定可能です。</p>
                <p>（３）クーポンの内容の変更は管理ツールにて行えます。その場合、有効期限が残っている以前のクーポンについては使用できるクーポンとしてご対応お願いします。</p>
                <p>（４）ご請求金額について</p>
                <p style="padding-left: 30px;">
                    ・クーポンアイランドの一般ユーザーが店舗様の対象のクーポンの「使う」ボタンを押した数に応じて請求させていただきます。<br>
                    ・【「使う」ボタンが押された数 x ¥100 】が毎月の請求金額になります。<br>
                     （※「使う」ボタンを押しても使わなかったユーザーがいた時の対応として、店舗様の方で使われたユーザー数をカウントしていただければ、そちらに応じて請求させていただきます。）<br>
                 </p>
                 <p>（５）退会される場合（サービスを使わない、移転・閉店されるなど）は、店舗情報変更ページで「閉店フラグ」にチェックを入れてください。</p>
                 <p style="padding-left: 30px;">
                    また、ご不明点につきましても、下記までお問い合わせください。<br>
                    【問い合わせ先】<br>
                    株式会社HUBFACTORY<br>
                    メールアドレス：coupon-island@hubfactory.jp
                </p>
            </div>
            
            <nav>
                <div class="textCenter" style="margin: 20px 0 40px 0;">
                    <a href="${urlPath}/menu" class="btn btnNormal jsTouchActive autoMargin" style="width: 250px;">メニューへ戻る</a>
                </div>
            </nav>
            
            <h2 id="ac_correspondence" class="p10 fs20 textCenter bgWhite">クーポンをもっているお客さんへのご対応について</h2>

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
            
            <h2 id="ac_serviceTerms" class="p10 fs20 textCenter bgWhite">店舗会員規約</h2>

            <div class="m20 bgWhite p10">
                <p class="p5">
                    「利用規約」に付随し、店舗会員限定の規約になります。<br>
                    店舗会員が本サービスに店舗会員として登録することで、店舗会員規約の内容を承諾したものとみなします。<br>
                    従いまして、本サービスを使用される前に必ず内容についてご確認くださいますよう、お願いいたします。
                </p>
                <h3 style="padding:5px; background:#ccc; font-size: 18px;">第1条：掲載情報</h3>
                <p class="p5">
                    1. 店舗会員は、会員登録中、当社所定の方法に従って自らの責任において店舗会員掲載情報等を掲載もしくは変更できるものとします。<br>
                    2. 原則として、文字情報及び画像等掲載情報の掲載場所及び順序は当社が決定するものとします。<br>
                    3. 店舗会員は、理由の如何を問わず会員登録解除後においては、店舗会員掲載情報を任意で削除することはできず、当該情報の掲載・削除に関しては当社の任意の判断に従うことに同意します。<br>
                    4. 店舗会員は、当社が自らの判断により何ら事前の通知なく店舗会員掲載情報の編集・変更・削除を行うことに同意します。また、当社はその理由の如何を問わず店舗会員掲載情報の削除義務を負うものではありません。<br>
                    5. 当社は、店舗会員が掲載しようとした情報についてその掲載を拒絶したこと、当該掲載の承諾の判断に時間を要したこと、店舗会員掲載情報を編集・変更・削除したこと、または当該情報を削除しなかったことにより、店舗会員もしくは第三者に発生した損害について、その法的根拠如何を問わず、一切の責任を負いません。
                </p>
                <h3 style="padding:5px; background:#ccc; font-size: 18px;">第2条：守秘義務</h3>
                <p class="p5">
                    店舗会員は、会員登録中または会員登録解除後にかかわらず、本規約及び利用規約に関連して知り得た情報、その他当社の機密に属すべき一切の事項を第三者に漏洩してはならないものとします。
                </p>
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
        
    </body>
</html>