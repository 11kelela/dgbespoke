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
            <div>
                <div class="page-title">
                    <div class="container">
                        <div class="column"><h1>Danh Sách Cửa Hàng</h1></div>
                        <div class="column">
                            <ul class="breadcrumbs">
                                <li><a href="/">Trang Chủ</a></li>
                                <li class="separator">&nbsp;</li>
                                <li>Danh sách Cửa Hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="padding-bottom-3x mb-1" style="padding: 0px 20px;">
                    <div class="row">
                        <?php include_partial('pageHome/listMenu') ?>

                        <div class="col-xl-9 col-lg-8 order-lg-2">
                            <div class="shop-toolbar mb-2">
                                <div class="column">
                                    <div class="shop-sorting"><label for="sorting">Sắp Xếp:</label><select
                                            class="form-control click-pointer">
                                            <option value="">Gợi ý bởi Faby</option>
                                            <option value="rating">Rating</option>
                                            <option value="distance">Khoảng Cách</option>
                                        </select></div>
                                </div>
                            </div>
                            <div>
                                <div class="row" id="list-item">
<!--                                    --><?php //include_partial('pageHome/listItem') ?>
                                </div>
                                <input type="hidden" id="load-page" value="1">
                                <input type="hidden" id="load-url"
                                       value="<?php echo url_for('@ajax_load_list_item') ?>">

                                <div style="text-align: center;">
                                    <button id="l-m" class="ui button" role="button">Tải Thêm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>