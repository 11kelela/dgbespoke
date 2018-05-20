<section id="start" class="post-25 page type-page status-publish hentry scheme-alternative no-arrows fullscreen"
         style="min-height:600px">
    <div class="superslides" data-width="#start" data-height="#start" data-pause="5000" data-animation="slow"
         data-effect="fade" style="height:220px !important;">
        <div class="slides-container"><img
            <img src="/images/BIA1.jpg" alt="#1">
            <img src="/images/BIA2.jpg" alt="#2">
            <img src="/images/BIA3.jpg" alt="#3">
<!--            <img src="tvdt/themes/magicreche/wordpress/wp-content/uploads/2014/03/banner3.jpg" alt="#3">-->
        </div>
        <nav class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-chevron-right default"></i></a>
            <a href="#" class="prev"><i class="fa fa-chevron-left default"></i></a>
        </nav>
    </div>
    <div class="tint" style="background-color:#000000;opacity:0.2"></div>
    <div class="container">
        <div class="welcome" style="top: 25%">
            <div class="row">
                <h1>Giá trị</h1>
                <p>We can do it, You can do it better</p>
                <!--                <p><i class="fa fa-angle-down default "></i></p>-->
            </div>
        </div>
        <div class="stick-to-bottom" style="bottom: 40px;">
            <div class="container">
                <div class="row">
                    <?php
                    if (isset($values) && count($values)) {
                        foreach ($values as $key => $value) {
                            switch ($key) {
                                case 0:
                                    $color = '#E75D5D';
                                    break;
                                case 1:
                                    $color = '#F1A733';
                                    break;
                                case 2:
                                    $color = '#5EB28F';
                                    break;
                                default:
                                    $color = '#5EB28F';
                                    break;
                            }
                            $path = '/uploads/' . sfConfig::get('app_article_images') . $value['image'];
                            ?>
                            <div class="col-sm-4">
                                <div class="teaser icon-box" style="color:#fff">
                                    <div class="icon img-circle" style="background-color: #fff;">
                                        <img width="70px" height="70px"
                                             src="<?php echo VtHelper::getPathImage($value['image'], sfConfig::get('app_article_images', 'category_images')) ?>">
                                        <!--                                        <img src="">-->
                                    </div>
                                    <div class="box" style="background-color:<?php echo $color; ?>">
                                        <h3><?php echo $value['name'] ?></h3>

                                        <p><?php echo $value['description']; ?></p>

                                        <div class="arrow" style="background-color:<?php echo $color; ?>"></div>
                                    </div>
                                </div>
                            </div>
                            <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>