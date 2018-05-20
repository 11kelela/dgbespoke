<section id="meet-our-stuff" class="post-11 page type-page status-publish hentry">
    <div class="container">
        <hgroup class="page-title">
            <h2 style="text-transform: uppercase;">Hoạt động</h2>
        </hgroup>
        <p style="text-align: center;">
        <div class="gap" style="height:34px"></div>
        </p>
        <p style="text-align: center;">

            <div class="owl-carousel staff-carousel" data-visible="4">
                <?php
                if(isset($values) && count($values)){
                foreach ($values as $value){
                $path = '/uploads/' . sfConfig::get('app_article_images') . $value['image'];
                ?>
                <div>
                    <div class="item staff-item">
                        <img width="150" height="150" style=""
                             src="<?php echo VtHelper::getThumbUrl($path, 150, 250, 'default') ?>"
                             class="attachment-staff size-staff wp-post-image" alt=""
                             sizes="(max-width: 150px) 100vw, 150px">

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