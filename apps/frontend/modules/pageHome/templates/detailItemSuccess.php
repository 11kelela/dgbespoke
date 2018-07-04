<?php
/**
 * Created by PhpStorm.
 * User: conghuyvn8x
 * Date: 6/27/2018
 * Time: 9:33 PM
 */
if ($massage) {
    $item = $massage[0];
}
?>
<?php slot('title') ?>
<?php echo ($item['name'] != '') ? htmlentities($item['name']) : "Tìm kiếm địa điểm cửa hàng mua sắm thời trang, massage, làm đẹp"; ?>
<?php end_slot() ?>
<?php slot('seo') ?>

<?php end_slot() ?>

<div id="root" class="offcanvas-wrapper">
    <div>
        <div>
            <div class="row" style="padding: 10px 0px;">
                <?php if ($massage) {
                ?>
                <div class="col-md-6 col-sm-6 is-pc">
                    <div></div>
                    <div>
                        <div class="ui clearing segment header-prod no-pad"><h3
                                class="ui block left floated header"><a href="javascript:history.go(-1)"> Sản
                                    Phẩm/Dịch Vụ</a></h3>
                        </div>
                        <div style="padding-top: 15px;"><a
                                href="javascript:void(0)">
                                <div></div>
                                <div class="ui two column grid prod-grid">
                                    <div class="stretched row">
                                        <div class="owl-carousel">
                                            <?php
                                            if ($listSlide) {
                                                foreach ($listSlide as $slide) {
                                                    ?>
                                                    <div class="item">
                                                        <div class="container">
                                                            <div
                                                                class="row justify-content-center align-items-center">
                                                                <div class="padding-bottom-1x text-center"
                                                                     style="padding-left: 0px; padding-right: 0px;">
                                                                    <div class="from-bottom">
                                                                        <img
                                                                            class="d-inline-block w-150 mb-4 img-saleOff"
                                                                            src="<?php echo VtHelper::getUrlImagePathThumb(sfConfig::get('app_article_images'), $slide['file_path'], 660, 330) ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <div></div>
                                </div>
                            </a></div>
                    </div>
                    <div style="padding-bottom: 40px;"></div>
                    <!--                        test-->

                    <div id="disqus_thread"></div>
                    <script>

                        /**
                         *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                         *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
                        /*
                         var disqus_config = function () {
                         this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
                         this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                         };
                         */
                        (function () { // DON'T EDIT BELOW THIS LINE
                            var d = document, s = d.createElement('script');
                            s.src = 'https://http-massageviet-xyz.disqus.com/embed.js';
                            s.setAttribute('data-timestamp', +new Date());
                            (d.head || d.body).appendChild(s);
                        })();
                    </script>
                    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments
                            powered by Disqus.</a></noscript>


                    <!--                        end test-->

                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="ui raised segment store-detail-pc">
                        <div class="cover"><img class="cover-avatar"
                                                src="<?php echo VtHelper::getUrlImagePathThumb(sfConfig::get('app_article_images'), $item['image'], 100, 100) ?>">

                            <div class="cover-text"><p><?php echo htmlentities($item['name']) ?></p>

                                <div class="ui star disabled rating" role="radiogroup"><i aria-checked="false"
                                                                                          aria-posinset="1"
                                                                                          aria-setsize="5"
                                                                                          class="active icon"
                                                                                          tabindex="0"
                                                                                          role="radio"></i><i
                                        aria-checked="false" aria-posinset="2" aria-setsize="5" class="active icon"
                                        tabindex="0" role="radio"></i><i aria-checked="false" aria-posinset="3"
                                                                         aria-setsize="5" class="active icon"
                                                                         tabindex="0" role="radio"></i><i
                                        aria-checked="true" aria-posinset="4" aria-setsize="5" class="active icon"
                                        tabindex="0" role="radio"></i><i aria-checked="false" aria-posinset="5"
                                                                         aria-setsize="5" class="icon" tabindex="0"
                                                                         role="radio"></i></div>
                            </div>
                        </div>
                        <div class="content-mobile">
                            <p>
                                    <span><?php echo (isset($item['total_view']) && $item['total_view'] > 0) ? $item['total_view'] : 1 ?>
                                        lượt xem</span>
                                <!--                                    <span style="float: right;">0 người theo dõi</span>-->
                            </p>

                            <!--                                <div class="ui fitted divider"></div>-->

                            <!--                                <div class="ui padded four column grid">-->
                            <!--                                    <div class="column col-func">-->
                            <!--                                        <div class="func-cmt func-desc"><i aria-hidden="true" class="comment large icon"-->
                            <!--                                                                           style="padding-left: 0px;"></i>-->
                            <!---->
                            <!--                                            <p>Bình Luận</p></div>-->
                            <!--                                    </div>-->
                            <!--                                    <div class="column col-func">-->
                            <!--                                        <div id="l-st" class="func-like func-desc"><i aria-hidden="true"-->
                            <!--                                                                                      class="thumbs up large icon"></i>-->
                            <!---->
                            <!--                                            <p>-->
                            <?php //echo htmlentities($item['total_view']) ?><!--</p></div>-->
                            <!--                                    </div>-->
                            <!--                                    <div class="column col-func">-->
                            <!--                                        <div id="dl-st" class="func-dislike func-desc"><i aria-hidden="true"-->
                            <!--                                                                                          class="thumbs down large icon"></i>-->
                            <!---->
                            <!--                                            <p>-->
                            <?php //echo htmlentities($item['total_view']) ?><!--</p></div>-->
                            <!--                                    </div>-->
                            <!--                                    <div class="column col-func">-->
                            <!--                                        <div class="func-heart func-desc"><i id="fv-st" aria-hidden="true"-->
                            <!--                                                                             class="gratipay big icon"></i>-->
                            <!---->
                            <!--                                            <p>Yêu Thích</p></div>-->
                            <!--                                    </div>-->
                            <!--                                </div>-->
                            <div class="ui fitted divider"></div>
                            <div class="ui items desc-store">
                                <div class="item">
                                    <div class="left aligned content"><i aria-hidden="true"
                                                                         class="blue marker large icon"></i><span><?php echo htmlentities($item['address']) ?></span>
                                    </div>
                                </div>
                                <div></div>
                                <div></div>
                                <div class="item">
                                    <div class="left aligned content"><i aria-hidden="true"
                                                                         class="blue info large icon"></i><span>
                                                <?php echo htmlentities($item['description']) ?>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-bottom: 30px;"></div>
                            <div class="ui fitted divider"></div>
                            <div class="ui items content-mobile">
                                <div class="item">
                                    <div class="middle aligned content"><i aria-hidden="true"
                                                                           class="red clock large icon"></i><span> Mở cửa từ: <?php echo htmlentities($item['time_open']) ?>
                                            &nbsp;&nbsp;&nbsp; Đến: <?php echo htmlentities($item['time_close']) ?></span><span></span>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="middle aligned content"><i aria-hidden="true"
                                                                           class="black phone large icon"></i><span
                                            style="color: rgb(59, 89, 152);"><a
                                                href="tel:+<?php echo htmlentities($item['phone']) ?>"> <?php echo htmlentities($item['phone']) ?></a></span>
                                    </div>
                                </div>
                            </div>
                            <h3 class="ui block header header-prod">Bản Đồ</h3>

                            <div class="item">
                                <div class="middle aligned content">
                                    <div id="gg-map-detail"
                                         style="width: 100%; height: 200px; position: relative; overflow: hidden;">
                                        <div id="map">
                                            <div style="width: 100%">
                                                <iframe width="100%" height="600"
                                                        src="https://www.maps.ie/create-google-map/map.php?width=100%&amp;height=600&amp;hl=en&amp;coord=<?php echo $item['lat'] . "," . $item['lng'] ?>&amp;q=<?php echo htmlentities($item['address']) ?>+(<?php echo str_replace('+', ' ', urlencode($item['name'])) ?>)&amp;ie=UTF8&amp;t=&amp;z=14&amp;iwloc=A&amp;output=embed"
                                                        frameborder="0" scrolling="no" marginheight="0"
                                                        marginwidth="0"><a
                                                        href="https://www.mapsdirections.info/fr/mesurer-distance-surface-google-maps.html">www.mapsdirections.info</a>
                                                </iframe>


                                            </div>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div></div>
                </div>
                <div class="col-md-6 col-sm-6 is-mobile">
                    <div></div>
                    <div class="ui clearing segment header-prod no-pad"><h3 class="ui block left floated header">Sản
                            Phẩm/Dịch Vụ</h3>
                    </div>
                    <div style="padding-top: 15px;">
                        <div></div>
                        <div class="ui two column grid prod-grid">
                            <div class="stretched row">
                                <div class="owl-carousel">
                                    <?php
                                    if ($listSlide) {
                                        foreach ($listSlide as $slide) {
                                            ?>
                                            <div class="item">
                                                <div class="container">
                                                    <div class="row justify-content-center align-items-center">
                                                        <div class="padding-bottom-1x text-center"
                                                             style="padding-left: 0px; padding-right: 0px;">
                                                            <div class="from-bottom" style="min-width: 320px;">
                                                                <img
                                                                    class="d-inline-block w-150 mb-4 img-saleOff"
                                                                    src="<?php echo VtHelper::getUrlImagePathThumb(sfConfig::get('app_article_images'), $slide['file_path'], 660, 330) ?>">
                                                            </div>
                                                        </div>
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
                        <div style="padding-bottom: 40px;"></div>

                        <!--                        test-->

                        <div id="disqus_thread"></div>
                        <script>

                            /**
                             *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                             *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
                            /*
                             var disqus_config = function () {
                             this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
                             this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                             };
                             */
                            (function () { // DON'T EDIT BELOW THIS LINE
                                var d = document, s = d.createElement('script');
                                s.src = 'https://http-massageviet-xyz.disqus.com/embed.js';
                                s.setAttribute('data-timestamp', +new Date());
                                (d.head || d.body).appendChild(s);
                            })();
                        </script>
                        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments
                                powered by Disqus.</a></noscript>


                        <!--                        end test-->

                        <div></div>
                        <div style="height: 100px;"></div>
                    </div>
                    <?php
                    } else {
                        ?>
                        <div class="col-md-6 col-sm-6 is-pc">
                            <div>
                                <div class="ui clearing segment header-prod no-pad">
                                    <h3 class="ui block left floated header">
                                        Sản Phẩm/Dịch Vụ không đúng hoặc không tồn tại
                                    </h3></div>
                            </div>
                        </div>
                        <?php
                    } ?>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".owl-carousel").owlCarousel({
                navigation: false,
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true,
//            autoPlay: true,
                stopOnHover: true,
                items: 1
            });
        });
    </script>

    <style type="text/css">


    </style>