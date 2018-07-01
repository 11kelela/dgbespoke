<?php
/**
 * Created by PhpStorm.
 * User: conghuyvn8x
 * Date: 6/27/2018
 * Time: 9:33 PM
 */
?>

<div id="root" class="offcanvas-wrapper">
    <div>
        <div>
            <div class="row" style="padding: 10px 0px;">
                <?php if ($massage) {
                    $item = $massage[0];
                    ?>
                    <div class="col-md-6 col-sm-6 is-pc">
                        <div></div>
                        <div>
                            <div class="ui clearing segment header-prod no-pad"><h3
                                    class="ui block left floated header">Sản
                                    Phẩm/Dịch Vụ</h3>
                            </div>
                            <div style="padding-top: 15px;"><a
                                    href="javascript:void(0)">
                                    <div></div>
                                    <div class="ui two column grid prod-grid">
                                        <div class="stretched row">
                                            <div class="slide_massage">
                                                <?php
                                                if ($listSlide) {
                                                    foreach ($listSlide as $slide) {
                                                        ?>
                                                        <div class="item">
                                                            <img
                                                                src="<?php echo VtHelper::getUrlImagePathThumb(sfConfig::get('app_article_images'), $slide['file_path'], 660, 330) ?>">
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
                        <h3 class="ui block header header-prod">Bình Luận(4)</h3>

                        <div class="ui fluid input comment-text"><input id="comment-store-pc"
                                                                        placeholder="Thêm bình luận..." type="text">
                        </div>
                        <i aria-hidden="true" class="blue send icon click-pointer"></i>

                        <div style="margin-bottom: 20px;"></div>
                        <div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img
                                            src="http://faby.vn/api//photo/load/1515475869230_ed1adba1-7baf-4a9b-aadf-53a207c6391b.jpg">
                                    </div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx6931</div>
                                        <div class="metadata">
                                            <div>18/06/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>4</div>
                                        </div>
                                        <div class="text">Mình dẫn mấy bác khách Nhật vào đây các bác ngất ngây con gà
                                            tây
                                            luôn. Hàng ổn, tiếp khách được các đồng chí
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img src="/AppIcon.png"></div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx1089</div>
                                        <div class="metadata">
                                            <div>03/05/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>5</div>
                                        </div>
                                        <div class="text">duyệt</div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img src="/AppIcon.png"></div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx0304</div>
                                        <div class="metadata">
                                            <div>11/02/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>4</div>
                                        </div>
                                        <div class="text">Vì có cơ sở vật chất tốt, đội ngũ ktv tốt, chất lượng dịch vụ
                                            bảo
                                            đảm, nên giá dịch vụ có thể chấp nhận được tuy cao hơn một số cơ sở massage
                                            tầm
                                            trung khác, tuy nhiên điểm trừ là các ktv ở đây lại không "thoáng" như một
                                            số cơ
                                            sở massage khác.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img
                                            src="https://lookaside.facebook.com/platform/profilepic/?asid=429254480848557&amp;height=200&amp;width=200&amp;ext=1523103429&amp;hash=AeSuTIuZUC5Q61zb">
                                    </div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx3902</div>
                                        <div class="metadata">
                                            <div>02/02/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>4.5</div>
                                        </div>
                                        <div class="text">Đến đây trong 1 chuyến công tác. Chỉ có 1 câu để nhận xét: đắt
                                            xắt
                                            ra miếng. CSVC của Spa De Place không có chỗ nào để chê, rất sang trọng,
                                            đẳng
                                            cấp, sạch sẽ, thiết kế cầu kì, chi tiết và nhân viên chắc chắn dc tuyển với
                                            những tiêu chí cao về nhan sắc, trình độ và thái độ. Khi nào đại gia chắc
                                            chắn
                                            sẽ ghé qua chỗ này thường xuyên hơn.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div></div>
                        <div style="height: 100px;"></div>
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
                                                style="color: rgb(59, 89, 152);"> <?php echo htmlentities($item['phone']) ?></span>
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
                                                            src="https://www.maps.ie/create-google-map/map.php?width=100%&amp;height=600&amp;hl=en&amp;coord=<?php echo $item['lat'] . "," . $item['lat'] ?>&amp;q=<?php echo htmlentities($item['address']) ?>+(<?php echo str_replace('+', ' ', urlencode($item['name'])) ?>)&amp;ie=UTF8&amp;t=&amp;z=14&amp;iwloc=A&amp;output=embed"
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
                        <div style="padding-top: 15px;"><a
                                href="javascript:void(0)">
                                <div></div>
                                <div class="ui two column grid prod-grid">
                                    <div class="stretched row">

                                        <div class="slide_massage1">
                                            <?php
                                            if ($listSlide) {
                                                foreach ($listSlide as $slide) {
                                                    ?>
                                                    <div class="item">
                                                    </div>
                                                    <img
                                                        src="<?php echo VtHelper::getUrlImagePathThumb(sfConfig::get('app_article_images'), $slide['file_path'], 660, 330) ?>">
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </div>

                                    </div>
                                    <div></div>
                                </div>
                            </a></div>
                        <div style="padding-bottom: 40px;"></div>
                        <h3 class="ui block header header-prod">Bình Luận(4)</h3>

                        <div class="ui fluid input comment-text"><input id="comment-store-mb"
                                                                        placeholder="Thêm bình luận..." type="text">
                        </div>
                        <span class="click-pointer"><i aria-hidden="true" class="blue send icon"></i></span>

                        <div style="margin-bottom: 20px;"></div>
                        <div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img
                                            src="<?php echo VtHelper::getUrlImagePathThumb(sfConfig::get('app_article_images'), $slide['image'], 100, 100) ?>">
                                    </div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx6931</div>
                                        <div class="metadata">
                                            <div>18/06/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>4</div>
                                        </div>
                                        <div class="text">Mình dẫn mấy bác khách Nhật vào đây các bác ngất ngây con gà
                                            tây
                                            luôn. Hàng ổn, tiếp khách được các đồng chí
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img src="/AppIcon.png"></div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx1089</div>
                                        <div class="metadata">
                                            <div>03/05/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>5</div>
                                        </div>
                                        <div class="text">duyệt</div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img src="/AppIcon.png"></div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx0304</div>
                                        <div class="metadata">
                                            <div>11/02/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>4</div>
                                        </div>
                                        <div class="text">Vì có cơ sở vật chất tốt, đội ngũ ktv tốt, chất lượng dịch vụ
                                            bảo
                                            đảm, nên giá dịch vụ có thể chấp nhận được tuy cao hơn một số cơ sở massage
                                            tầm
                                            trung khác, tuy nhiên điểm trừ là các ktv ở đây lại không "thoáng" như một
                                            số cơ
                                            sở massage khác.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui comments">
                                <div class="comment">
                                    <div class="avatar avatar-comment"><img
                                            src="https://lookaside.facebook.com/platform/profilepic/?asid=429254480848557&amp;height=200&amp;width=200&amp;ext=1523103429&amp;hash=AeSuTIuZUC5Q61zb">
                                    </div>
                                    <div class="content">
                                        <div class="author">+xxxxxxx3902</div>
                                        <div class="metadata">
                                            <div>02/02/2018</div>
                                            <div><i aria-hidden="true" class="star icon"></i>4.5</div>
                                        </div>
                                        <div class="text">Đến đây trong 1 chuyến công tác. Chỉ có 1 câu để nhận xét: đắt
                                            xắt
                                            ra miếng. CSVC của Spa De Place không có chỗ nào để chê, rất sang trọng,
                                            đẳng
                                            cấp, sạch sẽ, thiết kế cầu kì, chi tiết và nhân viên chắc chắn dc tuyển với
                                            những tiêu chí cao về nhan sắc, trình độ và thái độ. Khi nào đại gia chắc
                                            chắn
                                            sẽ ghé qua chỗ này thường xuyên hơn.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
        $(".slide_massage").owlCarousel({
//            navigation: false,
//            slideSpeed: 300,
//            paginationSpeed: 400,
//            singleItem: true,
//            autoPlay: true,
//            stopOnHover: true,
            items : 1
        });
    });
</script>