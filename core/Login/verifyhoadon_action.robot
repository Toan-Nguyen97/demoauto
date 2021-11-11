*** Settings ***
Library           SeleniumLibrary
Resource          ../core/Ban_Hang/banhang_page.robot
Resource          ../core/share/discount.robot
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

And tìm kiếm sản phẩm
    [Arguments]     ${input_ma_sp1}    ${input_ma_sp2}    ${input_ma_sp3}    ${input_ma_sp4}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp1}
    KV Click by Excute Java    ${output_sp}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp2}
    KV Click by Excute Java    ${output_sp}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp3}
    KV Click by Excute Java    ${output_sp}
    KV Input Text    ${textbox_bh_search_ma_sp}    ${input_ma_sp4}
    KV Click by Excute Java    ${output_sp}

And Click bỏ chọn tooltip 'Xong'
    KV Click by Excute Java    ${button_xong_mhbh}
And click mode quick sale
    KV Click by Excute Java    ${button_mode_ban_nhanh}
And click mode normal sale
    KV Click by Excute Java    ${button_mode_ban_thuong}
And click mode delivery sale
    KV Click by Excute Java    ${button_mode_ban_giao_hang}
Get value khach thanh toan
    ${get_khachthanhtoan}   KV Get value    ${input_khach_tt}
    Return From Keyword    ${get_khachthanhtoan}
Get value from mhbh nhanh
    Click mode ban hang nhanh
    ${get_tongtienhang_bn}     KV Get text    ${newPos_bh_tongtienhang}
    ${get_khachcantra_bn}    KV Get text    ${newPos_bh_khachcantra}
    ${get_khachtt_bn}      KV Get value    ${textbox_bh_khachtt}
    ${get_last_quantity_bn}      KV Get value    ${newPos_lastest_number}
    ${get_thukhac_bn}     KV Get value    ${cell_surcharge_value}
    ${get_textcell_tensp_bn}     KV Get text    ${newPos_bh_ten_sp}
    ${listInfo_bn}     Create List    ${get_tongtienhang_bn}    ${get_khachcantra_bn}    ${get_last_quantity_bn}   ${get_thukhac_bn}   ${get_textcell_tensp_bn}
    Return From Keyword    ${listInfo_bn}
Get value from mhbh thuong
    Click mode ban hang thuong
    KV Click by Excute Java      ${button_thanhtoan_bt}
    ${get_tongtienhang_bt}     KV Get text    ${newPos_bh_tongtienhang}
    ${get_khachcantra_bt}    KV Get text    ${newPos_bh_khachcantra}
    ${get_khachtt_bt}      KV Get value    ${textbox_bh_khachtt}
    ${get_last_quantity_bt}      KV Get value    ${newPos_lastest_number}
    ${get_thukhac_bt}     KV Get value    ${cell_surcharge_value}
    ${get_textcell_tensp_bt}     KV Get text    ${newPos_bh_ten_sp}
    ${listInfo_bt}    Create List    ${get_tongtienhang_bt}    ${get_khachcantra_bt}    ${get_last_quantity_bt}   ${get_thukhac_bt}   ${get_textcell_tensp_bt}
    # KV Click by Excute Java    ${button_close}
    Return From Keyword    ${listInfo_bt}
Get value from mhbh giao hang
    Click mode ban giao hang
    ${get_tongtienhang_bgh}     KV Get text    ${tongtienhang_bangiaohang_newpos}
    ${get_khachcantra_bgh}    KV Get text    ${newPos_bh_khachcantra}
    ${get_khachtt_bgh}      KV Get value    ${textbox_bh_khachtt}
    ${get_last_quantity_bgh}      KV Get value    ${newPos_lastest_number}
    ${get_thukhac_bgh}     KV Get value    ${cell_surcharge_value}
    ${get_textcell_tensp_bgh}     KV Get text    ${newPos_bh_ten_sp}
    ${listInfo_bgh}    Create List    ${get_tongtienhang_bgh}    ${get_khachcantra_bgh}    ${get_last_quantity_bgh}   ${get_thukhac_bgh}   ${get_textcell_tensp_bgh}
    Return From Keyword    ${listInfo_bgh}

Discount product price VND
    [Arguments]   ${text_giamgia_sp_VND}
    Click mode ban hang nhanh
    KV Click by Excute Java    ${button_gia_sp}
    KV Click by Excute Java    ${button_giam_gia_sp_popup_VND}
    KV Input Text    ${input_giamgia_sp}     ${text_giam_gia_sp_VND}
    Press Key    ${input_giamgia_sp}    ${ENTER_KEY}
Discount invoice VND
    [Arguments]   ${text_giam_gia_hd_VND}
    KV Click by Excute Java   ${button_giamgia_hd_newPos}
    KV Click by Excute Java    ${button_giam_gia_hd_popup_VND}
    KV Input Text    ${input_giamgia_hd}     ${text_giam_gia_hd_VND}
    Press Key    ${input_giamgia_hd}    ${ENTER_KEY}
Add promotion NewPOS
    KV Click by Excute Java    ${icon_KM_newpos}
    KV Click by Excute Java    ${radio_btn_KM}
    KV Click by Excute Java    ${button_mhbh_ap_dung}
Add surcharges NewPOS
    KV Click by Excute Java    ${button_thu_khac_newPos}
    KV Click by Excute Java    ${button_thu_khac_newPos}
    KV Click Element    ${check_box_thu_khac_newPos}
    KV Click Element    ${button_close}
Discount product price %
    [Arguments]   ${text_giam_gia_sp_%}
    Click mode ban hang nhanh
    KV Click by Excute Java    ${button_gia_sp}
    KV Click by Excute Java    ${button_giam_gia_sp_popup_%}
    KV Input Text    ${input_giamgia_sp}     ${text_giam_gia_sp_%}
    Press Key    ${input_giamgia_sp}    ${ENTER_KEY}
Discount invoice %
    [Arguments]   ${text_giam_gia_hd_%}
    KV Click by Excute Java   ${button_giamgia_hd_newPos}
    KV Click by Excute Java    ${button_giam_gia_hd_popup_%}
    KV Input Text    ${input_giamgia_hd_%}     ${text_giam_gia_hd_%}
    Press Key    ${input_giamgia_hd_%}    ${ENTER_KEY}
Payment by cash
    KV Click by Excute Java    ${icon_pttt}
    ${get_khachcantra_bn}    KV Get text    ${newPos_bh_khachcantra}
    KV Input Text    ${input_text_popup_pttt}    ${get_khachcantra_bn}
    KV Click by Excute Java    ${button_xong_popup_pttt}
Payment by cash in bhn
    Click mode ban hang nhanh
    Payment by cash
Payment by cash and card
    [Arguments]   ${input_text_cash}
    Click mode ban hang nhanh
    KV Click by Excute Java    ${icon_pttt}
    KV Click by Excute Java    ${button_remove_payment}
    KV Input Text    ${input_text_popup_pttt}    ${input_text_cash}
    KV Click by Excute Java    ${button_pttt_tien_mat}
    KV Click by Excute Java    ${button_pttt_the}
    KV Click by Excute Java    ${button_xong_popup_pttt}
Verify mhbh nhanh va mhbh thuong
    ${list_value_mhbh_nhanh}    Get value from mhbh nhanh
    ${list_value_mhbh_thuong}   Get value from mhbh thuong
    Should Be Equal    ${list_value_mhbh_nhanh}    ${list_value_mhbh_thuong}
Verify mhbh nhanh va mhbh giao hang
    Click mode ban hang nhanh
    ${get_khachcantra_bn}    KV Get text    ${newPos_bh_khachcantra}
    KV Input Text    ${textbox_bh_khachtt}    ${get_khachcantra_bn}
    ${list_value_mhbh_nhanh}    Get value from mhbh nhanh
    ${list_value_mhbh_giaohang}   Get value from mhbh giao hang
    Should Be Equal    ${list_value_mhbh_nhanh}    ${list_value_mhbh_giaohang}
#-----------------------------
When lấy phần tử mã sản phẩm
    ${count}    Get Element Count   ${ma_sp_newpos}
    log   ${count}
    ${list_masp}   Create List
    # ${i}    Set Variable    1
    :FOR    ${i}    IN RANGE  1   ${count}+1
    \   ${ma_sanpham}    Get Text    (${ma_sp_newpos})[${i}]
    \   Append To List    ${list_masp}    ${ma_sanpham}
    log   ${list_masp}
Get value information products
    ${count}    Get Element Count   //div[contains(@ng-repeat,'getItems')]
    log   ${count}
    ${list_masp}   Create List
    :FOR    ${i}    IN RANGE  1   ${count}+1
    \   ${ma_sanpham}    Get Text    (${ma_sp_newpos})[${i}]
    \   ${ten_sanpham}    Get Text    (${ten_sp_newpos})[${i}]
    \   ${quantity_sanpham}   Get Value    (${quantity_product_newpos})[${i}]

    \   ${gia_sanpham}    Get Text    (${button_gia_sp})[${i}]

    \   ${gia_sanpham}    Replace String    ${gia_sanpham}     ,    ${EMPTY}
    \   ${gia_sp}   Convert To Integer    ${gia_sanpham}
    \   ${gia_sanpham}    Convert To Number    ${gia_sanpham}   precision=0
    \   log    ${gia_sanpham}

    \   ${soluong_sp}   Convert To Integer    ${quantity_sanpham}
    \   ${get_gia_sp}   Get Text    ${cart_price}
    \   ${get_gia_sp}    Replace String    ${gia_sanpham}     ,    ${EMPTY}
    \   ${gia_sanpham_num}   Convert To Integer    ${get_gia_sp}
    \   ${tong_gia_sp}  Evaluate    ${soluong_sp}*${gia_sp}
    \   log   ${tong_gia_sp}
    \   Should Be Equal    ${gia_sanpham_num}    ${tong_gia_sp}
    \   Append To List    ${list_masp}    ${ma_sanpham}
    \   Append To List    ${list_masp}    ${ten_sanpham}
    \   Append To List    ${list_masp}    ${quantity_sanpham}
    \   Append To List    ${list_masp}    ${gia_sanpham}
    Return From Keyword    ${list_masp}
And verify thông tin mã sp, tên sp, số lượng mỗi sản phẩm, giá mỗi sản phẩm, tổng giá mỗi sản phẩm mode bán nhanh và mode bán thương
    And click mode quick sale
    ${list_info_prod_quick_sale}    Get value information products
    And click mode normal sale
    ${list_info_prod_normal_sale}    Get value information products
    Should Be Equal    ${list_info_prod_quick_sale}    ${list_info_prod_normal_sale}
