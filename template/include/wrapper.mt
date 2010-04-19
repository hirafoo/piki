<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <meta http-equiv="Content-style-Type" content="text/css" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="stylesheet" href="/css/base.css" type="text/css" />
        <title><?= p->{page_title} || 'piki' ?></title>
    </head>
    <body>
        <div id="top">
            <div id="header">
                <h1><a href="/">plack wiki</a></h1>
                <p><?= session->get('account') ? utf->decode(session->get('account')->{name}) . " でログイン中" : 'ログインしていません' ?></p>
            </div><!-- /header -->
            <div id="contents">
<?= $_[0] ?>
<?= mtf->render_file("include/sidebar.mt") ?>
            </div><!-- /contents -->
            <div id="totop">
                <p><a href="#top">ページのトップへ戻る</a></p>
            </div><!-- /totop -->
            <div id="footer">
                <address>by hirafoo</address>
            </div><!-- /footer -->
        </div><!-- /top -->
    </body>
</html>
