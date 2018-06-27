<?php
/**
 * Created by PhpStorm.
 * User: conghuyvn8x
 * Date: 6/27/2018
 * Time: 9:54 PM
 */
if ($listItem) {
    foreach ($listItem as $item) {
        ?>
        <div class="col-sm-3 grid-item" style="padding: 10px;">
            <div class="product-card ">
                <div class="product-badge">
                    <div class="ui star disabled rating" role="radiogroup"><i
                            aria-checked="false" aria-posinset="1" aria-setsize="5"
                            class="active icon" tabindex="0" role="radio"></i><i
                            aria-checked="false" aria-posinset="2" aria-setsize="5"
                            class="active icon" tabindex="0" role="radio"></i><i
                            aria-checked="false" aria-posinset="3" aria-setsize="5"
                            class="active icon" tabindex="0" role="radio"></i><i
                            aria-checked="true" aria-posinset="4" aria-setsize="5"
                            class="active icon" tabindex="0" role="radio"></i><i
                            aria-checked="false" aria-posinset="5" aria-setsize="5"
                            class="icon" tabindex="0" role="radio"></i></div>
                    <span style="position: absolute; right: 36px;"></span></div>
                <a class="product-thumb" title="<?php echo htmlentities($item['name']) ?>"
                   href="<?php echo url_for('@detail_item?slug=' . $item['slug']) ?>"><img
                        src="<?php echo VtHelper::getUrlImagePathThumb(sfConfig::get('app_article_images'), $item['image'], 100, 100) ?>"
                        class="avatar-store" alt="<?php echo htmlentities($item['name']) ?>"></a>

                <h3 class="product-title" style="height: 30px;" title="<?php echo htmlentities($item['name']) ?>"><a
                        href="<?php echo url_for('@detail_item?slug=' . $item['slug']) ?>"><abbr
                            class="click-pointer" title="Spa De Palace Fortuna Hotel">
                            <?php echo htmlentities($item['name']) ?>
                        </abbr></a></h3><h4 class="product-price"
                                            style="height: 40px;">
                    <abbr
                        class="click-pointer" title="6B Láng Hạ - Ba Đình - Hà Nội">
                        <?php echo htmlentities($item['address']) ?>
                    </abbr></h4>

                <div class="store-desc">
                    <div class="ui padded two column grid">
                        <div class="column col-func">
                            <div class="func-liked" style="display: inline-flex;"><i
                                    aria-hidden="true" class="thumbs up large icon"></i>

                                <p style="font-size: 20px;">1</p></div>
                        </div>
                        <div class="column col-func">
                            <div class="func-disliked" style="display: inline-flex;"><i
                                    aria-hidden="true" class="thumbs down large icon"></i>

                                <p style="font-size: 20px;">0</p></div>
                        </div>
                    </div>
                </div>
                <div class="product-buttons">
                    <a href="<?php echo url_for('@detail_item?slug=' . $item['slug']) ?>"
                       title="<?php echo htmlentities($item['name']) ?>"
                       class="btn btn-outline-primary btn-sm">Xem Cửa Hàng</a>
                </div>
            </div>
        </div>
        <?php
    }
} else {
    if ($page == '1') {
        echo "<h1>Không có dữ liệu</h1>";
    }
}
?>