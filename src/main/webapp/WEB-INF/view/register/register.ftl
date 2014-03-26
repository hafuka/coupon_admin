<!DOCTYPE html>
<html lang="ja">
    <head>
        <#-- 共通headのインクルード -->
        <#include "/common/htmlHead.ftl">
    </head>

    <body class="outline formContents">

        <#if errorMsg!?has_content>
            <div>
                ${errorMsg!?html}
            </div>
        </#if>

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
            
            <div class="formArea autoMargin" style="margin: 30px auto; width: 500px;">
                <h1 class="mb10 fs20 p5">新規店舗登録</h1>
                <div class="fs18" style="line-height: 25px;">
                    <form method="post" action="${urlPath!?html}/register/regist" name="frm">
                        ①メールアドレスを入力し、送信ボタンを押してください。<br>
                        ②しばらくすると、入力したメールアドレス宛てにログイン用のパスワードが送信されます。<br>
                        ※メール拒否設定をしている場合は、@xxxxx.xxxのドメインからのメールを受信できるように設定してください。
                        <div class="mv10">
                            <input type="email" name="email" id="email" placeholder="メールアドレスを入力して下さい" value="${email!?html}">
                        </div>
                    </form>
                </div>
                <div class="textCenter mb10 mt20">
                    <a id="js_registBtn" href="javascript:void(0)" class="btn btnPrimary jsTouchActive autoMargin" style="width: 250px; height: 60px; line-height: 45px;">送信する</a>
                </div>
            </div>
        </section>

        <nav>
            <div class="textCenter" style="margin: 20px 0 40px 0;">
                <a href="${urlPath}/" class="btn btnNormal jsTouchActive autoMargin" style="width: 250px;">TOPへ戻る</a>
            </div>
        </nav>
        
        <div class="textCenter" style="padding: 20px 0; background-color: #fbe796;">
            Copyright &copy; hubfactory
        </div>

        <#-- 共通JavaScriptのインクルード -->
        <#include "/common/htmlFoot.ftl">

        <#-- JS - 新規登録 - -->
        <script>
            (function(){

                var registBtn = ci.qs('#js_registBtn');

                ci.bind(registBtn, 'click', function(){
                    document.frm.submit();
                });
            })();
        </script>

    </body>
</html>