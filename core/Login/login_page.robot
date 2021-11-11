*** Variables ***
# to in mhhbh
${button_to_banhang}      //input[@type='button' and @value='Bán hàng']
${icon_ban_hang_moi}     //a[@title='Màn hình bán hàng mới']//i
${move_text_trai_nghiem_ngay}     //div[@class='introjs-overlay']
${button_close_tooltip}     //h1[contains(@class,'tooltip-title')]//following-sibling::a

${output_sp}      //div[@class='output-body']
${button_mode_ban_thuong}      //span[contains(text(),'Bán thường')]
${button_mode_ban_nhanh}      //span[contains(text(),'Bán nhanh')]
${button_mode_ban_giao_hang}      //span[contains(text(),'Bán giao hàng')]
${button_xong_mhbh}     //a[@role='button' and contains(text(),'Xong')]
${button_delete_sanpham}    //button[contains(@ng-show,'RemoveButton')]
#button thanh toán các mode
${button_thanhtoan_quick_sale}    //button[@id='saveTransaction']
${button_thanh_toan_open_hd}     //button[contains(text(),'Thanh toán')]
${button_thanhtoan_normal_sale}   //button[@id='saveTransactionRegPmt']
${button_thanh_toan_delivery_sale}    //button[@id='saveTransactionDelivery']
# Thông tin mỗi sản phẩm
${ten_sp_newpos}     //div[@class='cell-info']//span
${newPos_suggestion_amount}     //button[contains(@ng-click, 'SuggestionCashAmount')]
${ma_sp_newpos}    //div[@class='cell-code']
${quantity_product}    //input[@ng-model='item.Quantity']
${info_lo_date}    //ng-include//span
# thông tin hóa đơn
${total_quantity_prod_hd}      (//span[contains(@ng-show,'TotalQuantity')])[1]
${tong_tien_hd}     //payment-invoice-component//label[contains(text(),'Tổng tiền hàng')]//parent::div//following::div[@class='form-control-plaintext text-right']
${tong_tien_bangiaohang_hd}    //label[contains(text(),'Tổng tiền hàng')]//following::div[contains(@class,'group-price')]//div[contains(@class,'form-control-plaintext')]
${button_giam_gia_hd}      //payment-invoice-component//button[contains(@popover-trigger,'outsideClick')]
${button_thukhac_hd}    //a[@id='btnSurcharge']
${total_khach_can_tra_hd}      //div[label[span[contains(text(), 'Khách cần trả')]]]//following-sibling::div[contains(@class,'form-group')]//span[contains(@class,'amount-pay')]
${input_khach_thanh_toan}   //input[@id='payingAmtInvoice']
#giảm giá sp
${button_gia_sp}     //button[@kv-popup-anchor='productPrice']
${button_giam_gia_sp_popup_VND}      //div[@class='form-group-row']//a[contains(text(),'VND')]
${button_giam_gia_sp_popup_%}      //div[@class='form-group-row']//a[contains(text(),'%')]
${input_giam_gia_sp}     //input[@id='priceInput']
${cart_price}   //span[contains(@class,'cart-price')]
#giảm giá hóa đơn
${button_giam_gia_hd_popup_VND}     //div[@class='popover-content']//a[contains(text(),'VND')]
${button_giam_gia_hd_popup_%}     //div[@class='popover-content']//a[contains(text(),'%')]
${input_giam_gia_hd}     //input[@id='popover-discountValue']
${input_giam_gia_hd_%}   //input[contains(@ng-if,'discountTypes.percent')]
# add khuyến mại
${icon_khuyen_mai}     //button[@type='button' and contains(@class,'cart-gift btn-icon')]
${radio_btn_ctrinh_km}      (//div[contains(@class,'promotion-products')]//label[contains(@class,'form-radio')]//input)[1]
${button_ap_dung_km}      //button[contains(text(),'Áp dụng')]
#phương thức thanh toán
${icon_pttt}    //button[@uib-tooltip='Thanh toán nhiều phương thức']//i[contains(@class,'credit-card')]
${input_text_popup_pttt}    //input[@id='txtCurrentAmount' and contains(@ng-change,'ChangeCurrentAmount')]
${button_remove_payment}    //button[contains(@ng-click,'removePayment')]//i
${button_pttt_tien_mat}   //span[(normalize-space(text())='Tiền mặt')]//parent::button
${button_pttt_the}    //span[(normalize-space(text())='Thẻ')]//parent::button
${button_xong_popup_pttt}   //div[contains(@class,'payment-invoice')]//button[contains(text(),'Xong')]
#tăng giảm quantity
${button_plus_quantity}   //div[contains(@class,'quantity')]//i[contains(@class,'fa-plus')]
${button_minus_quantity}    //div[contains(@class,'quantity')]//i[contains(@class,'minus')]
#add thu khác
${button_thu_khac_newPos}   //a[contains(@id,'btnSurcharge')]
${check_box_thu_khac_newPos}    //input[contains(@type,'checkbox') and contains(@ng-change,'changeCurrentSurcharges')]
