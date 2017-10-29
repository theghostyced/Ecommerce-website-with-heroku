<div class="checkout-content checkout-cart">
    <h2 class="secondary-title"><?php echo $text_shopping_cart?> <?php if ($weight) echo '('.$weight.')'?></h2>
    <div class="table-responsive checkout-product">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left image"><?php echo $column_image; ?></td>
                <td class="text-left name"><?php echo $column_name; ?></td>
                <td class="text-left quantity"><?php echo $column_quantity; ?></td>
                <td class="text-right price"><?php echo $column_price; ?></td>
                <td class="text-right total"><?php echo $column_total; ?></td>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($products as $product) { ?>
                <tr>
                    <td class="text-center image">
                        <?php if ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                        <?php } ?>
                    </td>
                    <td class="text-left name">
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <?php foreach ($product['option'] as $option) { ?>
                            <br/>
                            &nbsp;
                            <small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                        <?php } ?>
                        <?php if ($product['recurring']) { ?>
                            <br/>
                            <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                            <small><?php echo $product['recurring']; ?></small>
                        <?php } ?>
                    </td>
                    <td class="text-left quantity">
                        <div class="input-group btn-block">
                            <input type="text" name="quantity[<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                            <span class="input-group-btn">
                                <?php if ($setting_so_onepagecheckout_layout_setting['show_product_qnty_update']) {?>
                                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" data-product-key="<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>" class="btn btn-primary btn-update"><i class="fa fa-refresh"></i></button>
                                <?php }?>
                                <?php if ($setting_so_onepagecheckout_layout_setting['show_product_removecart']) {?>
                                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" data-product-key="<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>" class="btn btn-danger  btn-delete"><i class="fa fa-times-circle"></i></button>
                                <?php }?>
                            </span>
                        </div>
                    </td>
                    <td class="text-right price"><?php echo $product['price']; ?></td>
                    <td class="text-right total"><?php echo $product['total']; ?></td>
                </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
                <tr>
                    <td class="text-left"><?php echo $voucher['description']; ?></td>
                    <td class="text-left"></td>
                    <td class="text-right">1</td>
                    <td class="text-right"><?php echo $voucher['amount']; ?></td>
                    <td class="text-right"><?php echo $voucher['amount']; ?></td>
                </tr>
            <?php } ?>
            </tbody>
            <tfoot>
            <?php foreach ($totals as $total) { ?>
                <tr>
                    <td colspan="4" class="text-right"><?php echo $total['title']; ?>:</td>
                    <td class="text-right"><?php echo $total['text']; ?></td>
                </tr>
            <?php } ?>
            </tfoot>
        </table>
    </div>
    <div id="payment-confirm-button" class="payment-<?php echo SoUtils::getProperty($session_data, 'payment_method.code'); ?>">
        <h2 class="secondary-title"><?php echo $text_payment_detail?></h2>
        <?php echo $payment; ?>
    </div>
</div>

