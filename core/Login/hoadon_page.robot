*** Variables ***
# to in mhhbh
${button_to_banhang}      //input[@type='button' and @value='Bán hàng']
${icon_ban_hang_moi}     //a[@title='Màn hình bán hàng mới']//i
${move_text_trai_nghiem_ngay}     //div[@class='introjs-overlay']
${button_close_tooltip}     //h1[contains(@class,'tooltip-title')]//following-sibling::a
# get value in mhbh
${output_sp}      //div[@class='output-body']
${button_mode_ban_thuong}      //span[contains(text(),'Bán thường')]
${button_mode_ban_nhanh}      //span[contains(text(),'Bán nhanh')]
${button_mode_ban_giao_hang}      //span[contains(text(),'Bán giao hàng')]
${button_xong_mhbh}     //a[@role='button' and contains(text(),'Xong')]
${newPos_bh_tongtienhang}     //payment-invoice-component//label[contains(text(),'Tổng tiền hàng')]//parent::div//following::div[@class='form-control-plaintext text-right']
${tongtienhang_bangiaohang_newpos}    //label[contains(text(),'Tổng tiền hàng')]//following::div[contains(@class,'group-price')]//div[contains(@class,'form-control-plaintext')]
${newPos_bh_khachcantra}      //div[label[span[contains(text(), 'Khách cần trả')]]]//following-sibling::div[contains(@class,'form-group')]//span[contains(@class,'amount-pay')]
${input_khach_tt}   //input[@id='payingAmtInvoice']
${newPos_lastest_number}      //span[contains(@ng-show,'TotalQuantity')]        # tổng số lượng sp trong hóa đơn mh New Pos
${newPos_bh_discountHD}     //div[contains(@class,'group-price')]//button[contains(@uib-popover-template,'discount')]
${newPos_bh_ma_sp}      //div[contains(@class, 'carts active')]//div[contains(@class,'cell-code')]
${ten_sp_newpos}     //div[@class='cell-info']//span
${newPos_suggestion_amount}     //button[contains(@ng-click, 'SuggestionCashAmount')]
${newPos_btn_save_normal}     //button[contains(text(),'Thanh toán')]
${button_thanhtoan_bt}      //button[@id='saveTransactionNormal']
${ma_sp_newpos}    //div[@class='cell-code']
${quantity_product_newpos}    //input[@ng-model="item.Quantity"]
#giảm giá sp
${button_gia_sp}     //button[@kv-popup-anchor='productPrice']
${button_giam_gia_sp_popup_VND}      //div[@class='form-group-row']//a[contains(text(),'VND')]
${button_giam_gia_sp_popup_%}      //div[@class='form-group-row']//a[contains(text(),'%')]
${input_giamgia_sp}     //input[@id='priceInput']
${cart_price}   //span[contains(@class,'cart-price')]
#giảm giá hóa đơn
${button_giamgia_hd_newPos}      //payment-invoice-component//button[contains(@popover-trigger,'outsideClick')]
${button_giam_gia_hd_popup_VND}     //div[@class='popover-content']//a[contains(text(),'VND')]
${button_giam_gia_hd_popup_%}     //div[@class='popover-content']//a[contains(text(),'%')]
${input_giamgia_hd}     //input[@id='popover-discountValue']
${input_giamgia_hd_%}   //input[contains(@ng-if,'discountTypes.percent')]
# add khuyến mại
${icon_KM_newpos}     //button[@type='button' and contains(@class,'cart-gift btn-icon')]//i
${radio_btn_KM}      //div[contains(@class,'promotion-products')]//label[contains(@class,'form-radio')]//input
${button_mhbh_ap_dung}      //button[contains(text(),'Áp dụng')]
#add thu khác
${button_thu_khac_newPos}   //a[contains(@id,'btnSurcharge')]
${check_box_thu_khac_newPos}    //input[contains(@type,'checkbox') and contains(@ng-change,'changeCurrentSurcharges')]
#phương thức thanh toán
${icon_pttt}    //button[@uib-tooltip='Thanh toán nhiều phương thức']//i[contains(@class,'credit-card')]
${input_text_popup_pttt}    //input[@id='txtCurrentAmount' and contains(@ng-change,'ChangeCurrentAmount')]
${button_xong_popup_pttt}   //div[contains(@class,'payment-invoice')]//button[contains(text(),'Xong')]
${button_remove_payment}    //button[contains(@ng-click,'removePayment')]//i
${button_pttt_tien_mat}   //span[(normalize-space(text())='Tiền mặt')]//parent::button
${button_pttt_the}    //span[(normalize-space(text())='Thẻ')]//parent::button
