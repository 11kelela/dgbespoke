<section id="gallery" class="post-14 page type-page status-publish hentry">
    <div class="container">
        <hgroup class="page-title">
            <h2 style="text-transform: uppercase;">Cảm nhận học viên</h2>
<!--            <h5>HAVE A LOOK</h5>-->
        </hgroup>
        <ul id="gallery-1" class="gallery gallery-columns-4 gallery-size-gallery">
            <?php if(isset($students) && count($students)){
                foreach ($students as $student){
                    $path = '/uploads/' . sfConfig::get('app_article_images') . $student['image'];
                    ?>
                    <li class="gallery-item col-sm-3"><a
                                href="<?php echo url_for2('listStudent'); ?>"
                                title="<?php echo $student['name'] ?>" class="fancybox" data-fancybox-group="gallery-1" rel="gallery"><img
                                    src="<?php echo VtHelper::getThumbUrl($path, 380, 240, 'default') ?>"><span><i
                                        class="fa fa-search fa-3x"></i></span></a></li>
                    <?php
                }
            } ?>
        </ul>
    </div>
</section>