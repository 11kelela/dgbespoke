<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <?php include_http_metas() ?>
    <?php include_metas() ?>
    <meta property="og:title" content="<?php echo VtSEO::getContenSeoByKey('fb_title'); ?>">
    <meta property="og:description" content="<?php echo VtSEO::getContenSeoByKey('fb_description'); ?>">
    <meta property="og:image" content="<?php echo VtSEO::getContenSeoByKey('fb_imgage'); ?>">
    <meta property="og:url" content="<?php echo VtSEO::getContenSeoByKey('fb_url'); ?>">
    <meta property="fb:app_id" content="994884514006407">
    <?php include_title() ?>
    <link rel="shortcut icon" href="/favicon.ico"/>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=yes">
    <meta charset="utf-8">
    <meta name="theme-color" content="#000000">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="/AppIconSmall.png">


<!--    <title>--><?php //include_slot('title') ?><!--</title>-->
<!--    <title>--><?php //include_slot('seo') ?><!--</title>-->

    <!--    <link rel="stylesheet" href="/massage/style/css/semantic.min.css">-->
    <!--    <link rel="stylesheet" media="screen" href="/massage/style/css/vendor.min.css">-->
    <!--    <link id="mainStyles" rel="stylesheet" media="screen" href="/massage/style/css/styles.min.css">-->
    <!--    <link rel="stylesheet" media="screen" href="/massage/style/css/customizer.min.css">-->
    <!--    <link rel="stylesheet" href="/massage/style/css/iziToast.min.css">-->

    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>
    <style type="text/css">
        a,abbr{text-decoration: unset !important;}
    </style>
</head>
<body class="hasScrollbar" style="padding-top: 0px;">

<?php include_component('temp', 'header'); ?>


<?php echo $sf_content; ?>

<?php include_component('temp', 'footer'); ?>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-121642318-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-121642318-1');
</script>

</body>
</html>