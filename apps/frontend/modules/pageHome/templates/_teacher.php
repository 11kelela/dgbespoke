<style>
    .owl-carousel .owl-item{
        display: inline-block !important;
    }
</style>
<section id="meet-our-stuff" class="post-11 page type-page status-publish hentry">
    <div class="container">
        <hgroup class="page-title">
            <h2 style="text-transform: uppercase;">Huấn luyện viên</h2>
<!--            <h5>Tất cả chúng tôi ở đây để giúp bạn</h5>-->
        </hgroup>
        <p style="text-align: center;">

        <div class="gap" style="height:34px"></div>
        </p>
        <p style="text-align: center;">

            <div class="owl-carousel staff-carousel" data-visible="2">
            <?php
                if(isset($teachers) && count($teachers)){
                    foreach ($teachers as $teacher){
                        $path = '/uploads/' . sfConfig::get('app_article_images') . $teacher['image'];
                        ?>
                        <div>
                            <div class="item staff-item">
                                <img width="175" height="175" style="border-radius: 50%;"
                                      src="<?php echo VtHelper::getThumbUrl($path, 175, 175, 'default') ?>"
                                      class="attachment-staff size-staff wp-post-image" alt=""
                                      sizes="(max-width: 150px) 100vw, 150px">

                                <h4><?php echo $teacher['name'] ?></h4>

                            <p style="padding: 0px 20px;"><?php echo $teacher['description']; ?></p>
                            </div>
                        </div>
                        <?php
                    }
                }
            ?>


    </div>
    </div>
</section>