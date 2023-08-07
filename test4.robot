*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime
Resource        GlobalKeywords.robot

*** Variables ***
${name}    John Doe
${age}    30
@{fruits}    Apple    Banana    Orange    Kiwi    Ananas    Mango    Lime    Limon    Pear    Melon
&{person}    name=John    age=30    city=New York
@{char}    a    b    c   d   e   f   g   h  i    j   k  l   m   n   o   p   q   r   s   t   u   v   w   x   y   z
${i}    0
&{fruits_colors}    apple=green     banana=yellow   orange=orange   kiwi=green  ananas=yellow   mango=yellow    lime=green  limon=yellow    pear=green  melon=yellow


*** Test Cases ***
1 Test
    ${result}    Create List
    ${index}    get index from list    ${char}    q
    convert to integer    ${i}
    Get alphabet up to p and log new list    ${result}     ${index}


2 Test
    @{result}    Create List
    Log new list with e   ${result}


3 Test
    ${new_list}    create list
    Get Green Fruits and log new list       ${new_list}     ${fruits_colors}


*** Keywords ***
Get alphabet up to p and log new list
    [Documentation]
    ...     вывести английский алфавит до буквы p
    [Arguments]    ${result}        ${index}
    WHILE    '${i}' != '${index}'
        append to list    ${result}    ${char}[${i}]
        ${i}    evaluate    ${i}+1
    END
    log  ${result}

Log new list with e
    [Documentation]
    ...     вывести все фрукты, содержащие букву e
    [Arguments]    ${result}
    FOR    ${fruit}    IN    @{fruits}
        ${contains_e}=    Run Keyword And Return Status    Should Contain    ${fruit}    e
        Run Keyword If    ${contains_e}    Append To List    ${result}    ${fruit}
    END

