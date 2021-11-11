*** Settings ***
Library           SeleniumLibrary
Resource          ../core/Ban_Hang/banhang_page.robot
Resource          ../core/share/discount.robot
Resource          ../core/Giao_dich/giaodich_nav.robot
Library           BuiltIn
Library           Collections

*** Keywords ***
KV Get value
    [Arguments]     ${locator}
    Wait Until Page Contains Element    ${locator}    5s
    ${get_value}      Get Value      ${locator}
    Return From Keyword    ${get_value}
KV Get list items
    [Arguments]     ${locator}
    Wait Until Page Contains Element    ${locator}    5s
    ${get_list_items}      KV Get list items      ${locator}
    Return From Keyword    ${get_list_items}
KV Click by Excute Java
    [Arguments]     ${locator}
    Wait Until Page Contains Element    ${locator}      5s
    Execute JavaScript    document.evaluate("${locator}",document.body,null,9,null).singleNodeValue.click();


Given User đăng nhập và mở màn hình NewPOS
    [Timeout]    30 seconds
    Sleep    2s
    KV Click Element    ${move_text_trai_nghiem_ngay}
    KV Click by Excute Java    ${icon_ban_hang_moi}
    KV Click by Excute Java    ${button_close_tooltip}

Click bỏ chọn tooltip 'Xong'
    KV Click by Excute Java    ${button_xong_mhbh}
Click mode quick sale
    KV Click by Excute Java    ${button_mode_ban_nhanh}
Click mode normal sale
    KV Click by Excute Java    ${button_mode_ban_thuong}
Click mode delivery sale
    KV Click by Excute Java    ${button_mode_ban_giao_hang}
Open hoa don normal sale
    KV Click by Excute Java    ${button_thanh_toan_open_hd}
Close hoa don normal sale
    KV Click by Excute Java    ${button_close}
Click remove pttt in popup
    KV Click by Excute Java    ${icon_pttt}
    ${count}    Get Element Count   ${button_remove_payment}
    :FOR    ${i}    IN RANGE    1   ${count}+1
    \   KV Click by Excute Java    ${button_remove_payment}
Tìm kiếm sản phẩm
    [Arguments]     ${input_ma_sp1}    ${input_ma_sp2}    ${input_ma_sp3}    ${input_ma_sp4}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp1}
    KV Click by Excute Java    ${output_sp}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp2}
    KV Click by Excute Java    ${output_sp}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp3}
    KV Click by Excute Java    ${output_sp}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp4}
    KV Click by Excute Java    ${output_sp}
    Click bỏ chọn tooltip 'Xong'

# value in hóa đơn
Get total quantity hd
    ${total_quantity_hd}   KV Get text    ${total_quantity_prod_hd}
    Return From Keyword    ${total_quantity_hd}
Get total price hd
    ${total_price_hd}   KV Get text    ${tong_tien_hd}
    Return From Keyword    ${total_price_hd}
Get total discount hd
    ${total_discount_hd}    KV Get text    ${button_giam_gia_hd}
    Return From Keyword    ${total_discount_hd}
Get total surcharges hd
    ${total_surcharge_hd}   KV Get text    ${button_thukhac_hd}
    Return From Keyword    ${total_surcharge_hd}
Get total amount pay hd
    ${total_amount_pay}   KV Get text    ${total_khach_can_tra_hd}
    Return From Keyword    ${total_amount_pay}
Get total amount payment hd
    ${total_amount_payment}   KV Get value    ${input_khach_thanh_toan}
    Return From Keyword    ${total_amount_payment}
Get total price bangiaohang hd
    ${total_price_bangiaohang_hd}    KV Get text    ${tong_tien_bangiaohang_hd}
    Return From Keyword    ${total_price_bangiaohang_hd}
Add discount product VND
    [Arguments]   ${text_giam_gia_sp_VND}
    ${count_giam_gia}   Get Element Count   ${button_gia_sp}
    :FOR    ${i}    IN RANGE    1   ${count_giam_gia}+1
    \   KV Click by Excute Java    (${button_gia_sp})[${i}]
    \   KV Click by Excute Java    ${button_giam_gia_sp_popup_VND}
    \   KV Input Text    ${input_giam_gia_sp}     ${text_giam_gia_sp_VND}
    \   Press Key    ${input_giam_gia_sp}    ${ESC_KEY}
Add discount product %
    [Arguments]   ${text_giam_gia_sp_%}
    ${count_giam_gia}   Get Element Count   ${button_gia_sp}
    :FOR    ${i}    IN RANGE    1    ${count_giam_gia}+1
    \   KV Click by Excute Java    (${button_gia_sp})[${i}]
    \   KV Click by Excute Java    ${button_giam_gia_sp_popup_%}
    \   KV Input Text    ${input_giam_gia_sp}     ${text_giam_gia_sp_%}
    \   Press Key    ${input_giam_gia_sp}    ${ESC_KEY}
Add discount invoice VND
    [Arguments]   ${text_giam_gia_hd_VND}
    KV Click by Excute Java    ${button_giam_gia_hd}
    KV Click by Excute Java    ${button_giam_gia_hd_popup_VND}
    KV Input Text    ${input_giam_gia_hd}     ${text_giam_gia_hd_VND}
    Press Key   ${input_giam_gia_hd}    ${ESC_KEY}
Add discount invoice %
    [Arguments]   ${text_giam_gia_hd_%}
    KV Click by Excute Java    ${button_giam_gia_hd}
    KV Click by Excute Java    ${button_giam_gia_hd_popup_%}
    KV Input Text    ${input_giam_gia_hd_%}      ${text_giam_gia_hd_%}
    Press Key   ${input_giam_gia_hd_%}    ${ESC_KEY}
Add invoice promotion
    ${present}    Run Keyword And Return Status    Element Should Be Visible    ${icon_khuyen_mai}
    Run Keyword If    ${present}    KV Click by Excute Java    ${icon_khuyen_mai}
    KV Click by Excute Java    ${radio_btn_ctrinh_km}
    KV Click by Excute Java    ${button_ap_dung_km}
Pay by cash
    Click remove pttt in popup
    ${total_amount_pay}   KV Get text    ${total_khach_can_tra_hd}
    KV Input Text    ${input_text_popup_pttt}    ${total_khach_can_tra_hd}
    KV Click by Excute Java    ${button_pttt_tien_mat}
    KV Click by Excute Java    ${button_xong_popup_pttt}
Pay by cash and cart
    [Arguments]   ${text_cash}
    Click remove pttt in popup
    KV Input Text    ${input_text_popup_pttt}    ${text_cash}
    KV Click by Excute Java    ${button_pttt_tien_mat}
    KV Click by Excute Java    ${button_pttt_the}
    KV Click by Excute Java    ${button_xong_popup_pttt}
Increase quantity product
    ${count_plus}   Get Element Count   ${button_plus_quantity}
    :FOR    ${i}    IN RANGE  1   ${count_plus}+1
    \   KV Click by Excute Java    (${quantity_product})[${i}]
    \   KV Click by Excute Java    (${button_plus_quantity})[${i}]
Decrease quantity product
    ${count_plus}   Get Element Count   ${button_minus_quantity}
    :FOR    ${i}    IN RANGE  1   ${count_plus}+1
    \   KV Click by Excute Java    (${quantity_product})[${i}]
    \   KV Click by Excute Java    (${button_minus_quantity})[${i}]
Delete all product
    Click mode quick sale
    ${count_product}    Get Element Count   ${button_delete_sanpham}
    :FOR    ${i}    IN RANGE    1   ${button_delete_sanpham}+1
    \   KV Click by Excute Java    (${button_delete_sanpham})[${I}]

Verify information between quick/normal sale and normal/quick sale
    Click mode quick sale
    ${tong_sanpham_hd}   Get total quantity hd
    ${tong_gia_hd}    Get total price hd
    ${tong_tien_giamgia_hd}   Get total discount hd
    ${tong_tien_thukhac_hd}   Get total surcharges hd
    ${tong_tien_kct_hd}   Get total amount pay hd
    ${tong_tien_ktt_hd}   Get total amount payment hd
    ${listInfoQuickSale}    Create List    ${tong_sanpham_hd}   ${tong_gia_hd}    ${tong_tien_thukhac_hd}    ${tong_tien_kct_hd}    ${tong_tien_ktt_hd}
    Click mode normal sale
    Open hoa don normal sale
    ${tong_sanpham_hd}   Get total quantity hd
    ${tong_gia_hd}    Get total price hd
    ${tong_tien_giamgia_hd}   Get total discount hd
    ${tong_tien_thukhac_hd}   Get total surcharges hd
    ${tong_tien_kct_hd}   Get total amount pay hd
    ${tong_tien_ktt_hd}   Get total amount payment hd
    ${listInfoNormalSale}    Create List    ${tong_sanpham_hd}   ${tong_gia_hd}    ${tong_tien_thukhac_hd}    ${tong_tien_kct_hd}    ${tong_tien_ktt_hd}
    Close hoa don normal sale
    Should Be Equal    ${listInfoQuickSale}    ${listInfoNormalSale}
Verify information between quick sale and delivery sale
    Click mode quick sale
    ${tong_sanpham_hd}   Get total quantity hd
    ${tong_gia_hd}    Get total price hd
    ${tong_tien_giamgia_hd}   Get total discount hd
    ${tong_tien_thukhac_hd}   Get total surcharges hd
    ${tong_tien_kct_hd}   Get total amount pay hd
    ${listInfoQuickSale}    Create List    ${tong_sanpham_hd}   ${tong_gia_hd}    ${tong_tien_thukhac_hd}    ${tong_tien_kct_hd}
    Click mode delivery sale
    ${tong_sanpham_hd}   Get total quantity hd
    ${tong_gia_hd}    Get total price bangiaohang hd
    ${tong_tien_giamgia_hd}   Get total discount hd
    ${tong_tien_thukhac_hd}   Get total surcharges hd
    ${tong_tien_kct_hd}   Get total amount pay hd
    ${listInfoDeliverySale}    Create List    ${tong_sanpham_hd}   ${tong_gia_hd}    ${tong_tien_thukhac_hd}    ${tong_tien_kct_hd}
    Should Be Equal    ${listInfoQuickSale}    ${listInfoDeliverySale}
Verify information between normal sale and delivery sale
    Click mode normal sale
    Open hoa don normal sale
    ${tong_sanpham_hd}   Get total quantity hd
    ${tong_gia_hd}    Get total price hd
    ${tong_tien_giamgia_hd}   Get total discount hd
    ${tong_tien_thukhac_hd}   Get total surcharges hd
    ${tong_tien_kct_hd}   Get total amount pay hd
    ${listInfoQuickSale}    Create List    ${tong_sanpham_hd}   ${tong_gia_hd}    ${tong_tien_thukhac_hd}    ${tong_tien_kct_hd}
    Close hoa don normal sale
    log   ${listInfoQuickSale}
    Click mode delivery sale
    ${tong_sanpham_hd}   Get total quantity hd
    ${tong_gia_hd}    Get total price bangiaohang hd
    ${tong_tien_giamgia_hd}   Get total discount hd
    ${tong_tien_thukhac_hd}   Get total surcharges hd
    ${tong_tien_kct_hd}   Get total amount pay hd
    ${listInfoDeliverySale}    Create List    ${tong_sanpham_hd}   ${tong_gia_hd}    ${tong_tien_thukhac_hd}    ${tong_tien_kct_hd}
    log   ${listInfoDeliverySale}
Get value information products
    ${count}    Get Element Count   //div[contains(@ng-repeat,'getItems')]
    ${list_masp}   Create List
    :FOR    ${i}    IN RANGE  1   ${count}+1
    # \   ${ma_sanpham}    Get Text    (${ma_sp_newpos})[${i}]
    \   ${ten_sanpham}    Get Text    (${ten_sp_newpos})[${i}]
    \   ${lo_date}    Get Text    ${info_lo_date}
    \   ${quantity_sanpham}   Get Value    (${quantity_product})[${i}]
    \   ${gia_sanpham}    Get Text    (${button_gia_sp})[${i}]
    \   ${total_gia_sp}   Get Text    (${cart_price})[${i}]
    \   ${gia_sanpham}    Replace String    ${gia_sanpham}     ,    ${EMPTY}
    \   ${gia_sanpham}   Convert To Integer    ${gia_sanpham}
    \   ${quantity_sanpham}   Convert To Integer    ${quantity_sanpham}
    \   ${total_gia_sp}    Replace String    ${total_gia_sp}     ,    ${EMPTY}
    \   ${total_gia_sp}   Convert To Integer    ${total_gia_sp}
    \   ${quantity_time_gia_sp}  Evaluate    ${quantity_sanpham}*${gia_sanpham}
    \   Should Be Equal    ${quantity_time_gia_sp}    ${total_gia_sp}
    \   Append To List    ${list_masp}    ${lo_date}
    \   Append To List    ${list_masp}    ${ten_sanpham}
    \   Append To List    ${list_masp}    ${quantity_sanpham}
    \   Append To List    ${list_masp}    ${gia_sanpham}
    \   Append To List    ${list_masp}    ${total_gia_sp}
    Return From Keyword    ${list_masp}
Verify thông tin từng sản phẩm và hóa đơn (default) quick sale and normal sale
    Click mode quick sale
    ${list_info_prod_quick_sale}    Get value information products
    Click mode normal sale
    ${list_info_prod_normal_sale}    Get value information products
    Should Be Equal    ${list_info_prod_quick_sale}    ${list_info_prod_normal_sale}
    Verify information between quick/normal sale and normal/quick sale
Verify thông tin từng sản phẩm và hóa đơn mặc định quick sale and delivery sale
    Click mode quick sale
    ${list_info_prod_quick_sale}    Get value information products
    Click mode delivery sale
    ${list_info_prod_normal_sale}    Get value information products
    Should Be Equal    ${list_info_prod_quick_sale}    ${list_info_prod_normal_sale}
    Verify information between quick sale and delivery sale
Verify thông tin từng sản phẩm và hóa đơn (default) normal sale and delivery sale
    Click mode normal sale
    ${list_info_prod_normal_sale}    Get value information products
    Click mode delivery sale
    ${list_info_prod_delivery_sale}    Get value information products
    Should Be Equal    ${list_info_prod_normal_sale}    ${list_info_prod_delivery_sale}
    Verify information between normal sale and delivery sale
Change thông tin sản phẩm và hóa đơn (VND) mode bán nhanh
    [Documentation]     Tăng quantity sản phẩm, add giảm giá sản phẩm và hóa đơn (vnd,%), thêm khuyến mại, KH trả bằng tiền mặt
    [Arguments]   ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}
    Click mode quick sale
    Increase quantity product
    Add discount product VND    ${text_giam_gia_sp_VND}
    Add discount invoice VND    ${text_giamgia_hd_VND}
    Pay by cash
Change thông tin sản phẩm và hóa đơn (%) mode bán nhanh
    [Documentation]     Giảm quantity sản phẩm, add giảm giá sản phẩm và hóa đơn (vnd,%), KH trả bằng tiền mặt và thẻ
    [Arguments]   ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Click mode quick sale
    Decrease quantity product
    Add discount product %    ${text_giam_gia_sp_%}
    Add discount invoice %    ${text_giam_gia_hd_%}
    Pay by cash and cart    ${text_cash}
Change thông tin sản phẩm và hóa đơn (VND) mode bán thường
    [Documentation]     Tăng quantity sản phẩm, add giảm giá sản phẩm và hóa đơn (vnd,%), thêm khuyến mại, KH trả bằng tiền mặt
    [Arguments]   ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}
    Click mode normal sale
    Increase quantity product
    Add discount product VND    ${text_giam_gia_sp_VND}
    Open hoa don normal sale
    Add discount invoice VND    ${text_giamgia_hd_VND}
    Pay by cash
    Close hoa don normal sale
Change thông tin sản phẩm và hóa đơn (%) mode bán thường
    [Documentation]     Giảm quantity sản phẩm, add giảm giá sản phẩm và hóa đơn (vnd,%), KH trả bằng tiền mặt và thẻ
    [Arguments]   ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Click mode normal sale
    Decrease quantity product
    Add discount product %    ${text_giam_gia_sp_%}
    Open hoa don normal sale
    Add discount invoice %    ${text_giam_gia_hd_%}
    Pay by cash and cart    ${text_cash}
    Close hoa don normal sale
Change thông tin sản phẩm và hóa đơn (VND) mode bán giao hàng
    [Documentation]     Tăng quantity sản phẩm, add giảm giá sản phẩm và hóa đơn (vnd,%), thêm khuyến mại, KH trả bằng tiền mặt
    [Arguments]   ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}
    Click mode delivery sale
    Increase quantity product
    Add discount product VND    ${text_giam_gia_sp_VND}
    Add discount invoice VND    ${text_giamgia_hd_VND}
    Pay by cash
Change thông tin sản phẩm và hóa đơn (%) mode bán giao hàng
    [Documentation]     Giảm quantity sản phẩm, add giảm giá sản phẩm và hóa đơn (vnd,%), KH trả bằng tiền mặt và thẻ
    [Arguments]   ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Click mode delivery sale
    Decrease quantity product
    Add discount product %    ${text_giam_gia_sp_%}
    Add discount invoice %    ${text_giam_gia_hd_%}
    Pay by cash and cart    ${text_cash}
Thêm khuyến mại vào hóa đơn mode bán nhanh
    Click mode quick sale
    Add invoice promotion
Thêm khuyến mại vào hóa đơn mode bán thường
    Click mode normal sale
    Add invoice promotion
Thêm khuyến mại vào hóa đơn mode bán giao hàng
    Click mode delivery sale
    Add invoice promotion
