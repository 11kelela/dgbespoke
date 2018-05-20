<style>
    .owl-carousel .owl-item{
        display: inline-block !important;
    }
</style>
<section id="meet-our-stuff2" class="post-11 page type-page status-publish hentry">
    <div class="container">
        <hgroup class="page-title">
            <h2 style="text-transform: uppercase;">Hoạt động</h2>
            <!--            <h5>Tất cả chúng tôi ở đây để giúp bạn</h5>-->
        </hgroup>
        <p style="text-align: center;">

        <div class="gap" style="height:34px"></div>
        </p>
        <p style="text-align: center;">

            <div id="activity-xnk" class="owl-carousel staff-carousel" data-visible="3">
                <?php
                if(isset($values) && count($values)){
                foreach ($values as $value){
                $path = '/uploads/' . sfConfig::get('app_article_images') . $value['image'];
                ?>
                <div>
                    <div class="item staff-item">
                        <img width="360" height="230" style=""
                             src="<?php echo VtHelper::getThumbUrl($path, 360, 230, 'default') ?>"
                             class="attachment-staff size-staff wp-post-image" alt=""
                             sizes="(max-width: 150px) 100vw, 150px">

                        <h4><?php echo $value['name'] ?></h4>

        <p style="padding: 0px 5px;"><?php echo $value['description']; ?></p>
    </div>
    </div>
    <?php
    }
    }
    ?>


    </div>
    </div>
</section>
