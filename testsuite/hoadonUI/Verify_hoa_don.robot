*** Settings ***

Suite Setup       Init Test Environment    ${env}    ${remote}    ${account}      ${headless_browser}
Test Setup        Before Test Ban Hang
# Test Teardown     After Test
Test Template     Check product searching
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Selenium2Library
Library           BuiltIn
Library           Collections
Resource          ../../../../core/Ban_Hang/banhang_action.robot
Resource          ../../../../core/Ban_Hang/banhang_navigation.robot
Resource          ../../../../core/share/computation.robot
Resource          ../../../../core/Ban Hang page menu.robot
Resource          ../../../../core/hang_hoa/hang_hoa_navigation.robot
Resource          ../../../../core/hang_hoa/danh_muc_list_action.robot
Resource          ../../../../core/Search/Search_san_pham/dropdown_in_mhbh.robot
Resource          ../../../../core/hang_hoa/hang_hoa_add_action.robot
Resource          ../../../../core/API/get_data_from_rest_api_9k1.robot
Resource          ../../../../core/Ban_Hang/banhang_page.robot
Resource          ../../../../core/ATDD/Hoa_don/verify_invoice_switch_page.robot
Resource          ../../../../core/share/discount.robot
Resource          ../../../../core/ATDD/Hoa_don/verify_invoice_action.robot
Resource          ../../../../config/env_product/envi.robot
Library           String

*** Test Cases ***    Ma_sp       text_giamgia_sp_VND   text_giam_gia_hd_VND    input_ma_sp2    text_giam_gia_sp_%    text_giam_gia_hd_%    input_text_cash

# Switch mode default and change ban nhanh to ban thuong
#     [tags]    TOAN
#     [Template]    Verify switch mode bannhanh_banthuong when default and after change
#                       ATDD00001   1000                  9000                    ATDD00002       10                      10                  100000
Switch mode default and change ban nhanh to ban giao hang
    [tags]    TOAN
    [Template]    Scenario: Verify chuyển trạng thái giữa mode giao hàng nhanh và mode giao hàng thường
                      LKK001    Combo025   DVL001    LKKL002
*** Keywords ***
Scenario: Verify chuyển trạng thái giữa mode giao hàng nhanh và mode giao hàng thường
    [Documentation]   Verify mã sp
    [Arguments]    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    Given User đăng nhập và mở màn hình NewPOS
    And click mode quick sale
    And tìm kiếm sản phẩm    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    And Click bỏ chọn tooltip 'Xong'
    And verify thông tin mã sp, tên sp, số lượng mỗi sản phẩm, giá mỗi sản phẩm, tổng giá mỗi sản phẩm mode bán nhanh và mode bán thương
