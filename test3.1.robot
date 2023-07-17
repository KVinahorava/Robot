*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime

*** Variables ***
${name}    John Doe
${age}    30
@{fruits}    Apple    Banana    Orange    Kiwi    Ananas    Mango    Lime    Limon    Pear    Melon
&{person}    name=John    age=30    city=New York
@{char}    a    b    c   d   e   f   g   h  i    j   k  l   m   n   o   p   q   r   s   t   u   v   w   x   y   z
${i}    0

*** Test Cases ***
1 Test
    FOR    ${i}    IN RANGE    7
        Append To List    ${fruits}    Fruts${i}
    END

2 Test
    ${result}    Create List
    ${index}    get index from list    ${char}    q
    convert to integer    ${i}
    WHILE    '${i}' != '${index}'
        append to list    ${result}    ${char}[${i}]
        ${i}    evaluate    ${i}+1
    END
    log  ${result}

3 Test
    @{result}    Create List
    FOR    ${fruit}    IN    @{fruits}
        ${contains_e}=    Run Keyword And Return Status    Should Contain    ${fruit}    e
        Run Keyword If    ${contains_e}    Append To List    ${result}    ${fruit}
    END