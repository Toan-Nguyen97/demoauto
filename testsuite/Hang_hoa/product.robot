*** Settings ***

Suite Setup       Init Test Environment    ${env}    ${remote}    ${account}      ${headless_browser}
Test Setup        Before Test Ban Hang
# Test Teardown     After Test
Test Template     Check product searching
Library           SeleniumLibrary
Library           RequestsLibrary
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

*** Test Cases ***
Verify switch mode default and after change quick sale and normal sale
    [tags]    TOAN
    [Documentation]   Verify hd bán nhanh-bán thường
    [Template]    Scenario: Verify chuyển trạng thái giữa mode bán hàng nhanh và mode giao hàng thường
                      LKK001    Combo05   DVL001    LKKL002   10000   10000   10    10    100000
Verify switch mode default and after change quick sale and delivery sale
    [tags]    TOAN
    [Documentation]   Verify hd bán nhanh-bán giao hàng
    [Template]    Scenario: Verify chuyển trạng thái giữa mode bán hàng nhanh và mode bán giao hàng
                      LKK001    Combo05   DVL001    LKKL002   10000   10000   10    10    100000
Verify switch mode default and after change normal sale and quick sale
      [tags]    TOAN
      [Documentation]   Verify hd bán thường-bán nhanh
      [Template]    Scenario: Verify chuyển trạng thái giữa mode bán hàng thường và mode bán hàng nhanh
                        LKK001    Combo05   DVL001    LKKL002   10000   100000    10    10    100000
Verify switch mode default and after change normal sale and delivery sale
      [tags]    TOAN
      [Documentation]   Verify hd bán thường-bán giao hàng
      [Template]    Scenario: Verify chuyển trạng thái giữa mode bán hàng thường và mode bán giao hàng
                        LKK001    Combo05   DVL001    LKKL002   10000   10000    10    10    100000
Verify switch mode default and after change delivery sale and quick sale
      [tags]    TOAN
      [Documentation]   Verify hd bán giao hàng-bán nhanh
      [Template]    Scenario: Verify chuyển trạng thái giữa mode bán giao hàng và mode bán hàng nhanh
                        LKK001    Combo05   DVL001    LKKL002   10000   10000    10    10    100000
Verify switch mode default and after change delivery sale and normal sale
      [tags]    TOAN
      [Documentation]   Verify hd bán giao hàng-bán thường
      [Template]    Scenario: Verify chuyển trạng thái giữa mode bán giao hàng và mode bán hàng thường
                        LKK001    Combo05   DVL001    LKKL002   10000   10000    10    10    100000

*** Keywords ***
Scenario: Verify chuyển trạng thái giữa mode bán hàng nhanh và mode giao hàng thường
    [Arguments]    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}    ${text_giam_gia_sp_VND}   ${text_giam_gia_hd_VND}   ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Given User đăng nhập và mở màn hình NewPOS
    And click mode quick sale
    And Tìm kiếm sản phẩm    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    Then Verify thông tin từng sản phẩm và hóa đơn (default) quick sale and normal sale
    When Change thông tin sản phẩm và hóa đơn (VND) mode bán nhanh    ${text_giam_gia_sp_VND}   ${text_giam_gia_hd_VND}
    Then Verify information between quick/normal sale and normal/quick sale
    When Change thông tin sản phẩm và hóa đơn (%) mode bán nhanh    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Then Verify information between quick/normal sale and normal/quick sale
    When Thêm khuyến mại vào hóa đơn mode bán nhanh
    Then Verify information between quick/normal sale and normal/quick sale
    Close Browser
Scenario: Verify chuyển trạng thái giữa mode bán hàng nhanh và mode bán giao hàng
    [Arguments]   ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}   ${text_giam_gia_sp_VND}   ${text_giam_gia_hd_VND}    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Given User đăng nhập và mở màn hình NewPOS
    And click mode quick sale
    And Tìm kiếm sản phẩm    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    Then Verify thông tin từng sản phẩm và hóa đơn mặc định quick sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (VND) mode bán nhanh    ${text_giam_gia_sp_VND}   ${text_giam_gia_hd_VND}
    Then Verify information between quick sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (%) mode bán nhanh    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Then Verify information between quick sale and delivery sale
    When Thêm khuyến mại vào hóa đơn mode bán nhanh
    Then Verify information between quick/normal sale and normal/quick sale
    Close Browser
Scenario: Verify chuyển trạng thái giữa mode bán hàng thường và mode bán hàng nhanh
    [Arguments]   ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}   ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}   ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Given User đăng nhập và mở màn hình NewPOS
    And Click mode normal sale
    And Tìm kiếm sản phẩm    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    Then Verify thông tin từng sản phẩm và hóa đơn (default) quick sale and normal sale
    When Change thông tin sản phẩm và hóa đơn (VND) mode bán thường    ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}
    Then Verify information between quick/normal sale and normal/quick sale
    When Change thông tin sản phẩm và hóa đơn (%) mode bán thường    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Then Verify information between quick/normal sale and normal/quick sale
    When Thêm khuyến mại vào hóa đơn mode bán thường
    Then Verify information between quick/normal sale and normal/quick sale
    Close Browser
Scenario: Verify chuyển trạng thái giữa mode bán hàng thường và mode bán giao hàng
    [Arguments]   ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}   ${text_giam_gia_sp_VND}   ${text_giam_gia_hd_VND}    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Given User đăng nhập và mở màn hình NewPOS
    And click mode quick sale
    And Tìm kiếm sản phẩm    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    Then Verify thông tin từng sản phẩm và hóa đơn (default) normal sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (VND) mode bán thường    ${text_giam_gia_sp_VND}   ${text_giam_gia_hd_VND}
    Then Verify information between normal sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (%) mode bán thường    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Then Verify information between normal sale and delivery sale
    When Thêm khuyến mại vào hóa đơn mode bán thường
    Then Verify information between quick/normal sale and normal/quick sale
    Close Browser
Scenario: Verify chuyển trạng thái giữa mode bán giao hàng và mode bán hàng nhanh
    [Arguments]   ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}   ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Given User đăng nhập và mở màn hình NewPOS
    And Click mode delivery sale
    And Tìm kiếm sản phẩm    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    Then Verify thông tin từng sản phẩm và hóa đơn mặc định quick sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (VND) mode bán giao hàng    ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}
    Then Verify information between quick sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (%) mode bán giao hàng    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Then Verify information between quick sale and delivery sale
    When Thêm khuyến mại vào hóa đơn mode bán giao hàng
    Then Verify information between quick/normal sale and normal/quick sale
    Close Browser
Scenario: Verify chuyển trạng thái giữa mode bán giao hàng và mode bán hàng thường
    [Arguments]   ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}   ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Given User đăng nhập và mở màn hình NewPOS
    And Click mode delivery sale
    And Tìm kiếm sản phẩm    ${input_ma_sp1}   ${input_ma_sp2}   ${input_ma_sp3}   ${input_ma_sp4}
    Then Verify thông tin từng sản phẩm và hóa đơn (default) normal sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (VND) mode bán giao hàng    ${text_giam_gia_sp_VND}   ${text_giamgia_hd_VND}
    Then Verify information between normal sale and delivery sale
    When Change thông tin sản phẩm và hóa đơn (%) mode bán giao hàng    ${text_giam_gia_sp_%}   ${text_giam_gia_hd_%}   ${text_cash}
    Then Verify information between normal sale and delivery sale
    When Thêm khuyến mại vào hóa đơn mode bán giao hàng
    Then Verify information between quick/normal sale and normal/quick sale
    Close Browser
