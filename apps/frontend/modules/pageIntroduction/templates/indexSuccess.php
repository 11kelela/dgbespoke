<?php include_component('pageNews', 'bannerItem') ?>
<!--<header><h1>--><?php //echo isset($html) ? $html['name'] : ''; ?><!--</h1>-->
<!--</header>-->

<section id="latest-posts pageVideo" class="post-18 page type-page status-publish hentry">
    <div class="container">
        <?php
        if (isset($html)) {
            echo $html['content'];
        }
        ?>
    </div>
</section>