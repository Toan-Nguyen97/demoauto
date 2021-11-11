*** Settings ***
Library           SeleniumLibrary
Resource        ../core/Login/login_action.robot
*** Variables ***
${enter_key}    \\13
*** Test Cases ***
Login screen  URL                                             USERNAME    PASSWORD
          [Template]     login
          https://hoadonautotest.kiotviet.vn/man/#/login      admin       123
Open hang hoa   hang hoa        danh mục
          [Template]    open danh muc
          ${button_hanghoa}     ${button_danhmuc}
Add new goods     button_themmoi    button_themhanghoa
          [Template]    them moi hang hoa
          ${button_themmoi}     ${button_themhanghoa}
enter information in prod     namePro           text_group
          [Template]      enter information
                              Goods00001        Phụ kiện Nam
input price in dasboard    text_cost    text_sale    text_kho
          [Template]      add price in dasboard
                            150000      100000        20
thuoc tinh                  text_tt    text_value
          [Template]      add thuoc tinh page chi tiet
                            TT01       001
*** Keywords ***
login
    [Arguments]   ${input_url}    ${input_username}   ${input_password}
    Login manager screen    ${input_url}    ${input_username}   ${input_password}
open danh muc
    [Arguments]     ${button_hanghoa}     ${button_danhmuc}
    Open product screen    ${button_hanghoa}     ${button_danhmuc}
them moi hang hoa
    [Arguments]     ${button_themmoi}     ${button_themhanghoa}
    Add new product    ${button_themmoi}     ${button_themhanghoa}
enter information
    [Arguments]     ${input_nameProd}      ${text_group}
    choose product group     ${input_nameProd}       ${text_group}
add price in dasboard
    [Arguments]     ${text_cost}     ${text_sale}    ${text_kho}
    add price    ${text_cost}     ${text_sale}    ${text_kho}
add thuoc tinh page chi tiet
    [Arguments]     ${text_tt}      ${text_value}
    add thuoc tinh  ${text_tt}      ${text_value}
click save hh
    save hh
