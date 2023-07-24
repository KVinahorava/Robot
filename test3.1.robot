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
&{fruits_colors}    apple=green     banana=yellow   orange=orange   kiwi=green  ananas=yellow   mango=yellow    lime=green  limon=yellow    pear=green  melon=yellow


*** Test Cases ***
1 Test
    FOR    ${i}    IN RANGE    1     7
        Append To List    ${fruits}    ${i}
    END
    log    ${fruits}

1.1 Test
    FOR    ${i}    IN RANGE    0    10
       log to console    ${fruits}[${i}]
    END


1.2 Test
    FOR    ${i}    ${item}    IN ENUMERATE    @{fruits}
      exit for loop if    '${item}' == '5'
      log to console    ${item}

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


4 Test
    ${new_list}    create list
    FOR    ${index}    ${item}    IN ENUMERATE    @{fruits}
    ${status}    run keyword and return status    should contain   ${item}    e
    run keyword if    '${status}' == 'True'    append to list    ${new_list}    ${item}
    END
    log to console    ${new_list}


5 Test
    ${new_list}    create list
    FOR    ${index}    ${item}    IN ENUMERATE    @{fruits}
    ${new_string}   split string to characters    ${item}
    ${status}    run keyword and return status    should contain   ${item}    e
    run keyword if    '${status}' == 'True'    append to list    ${new_list}    ${item}
    END
    log to console    ${new_list}

6 Test
    ${new_list}    create list
    FOR    ${key}    ${value}   IN   &{fruits_colors}
        run keyword if    '${value}' == 'green'    append to list    ${new_list}    ${key}
    END
        log to console    ${new_list}

7 Test
   ${new_list}    create list
   ${i}       get length    ${fruits_colors}
   ${keys}     get dictionary keys    ${fruits_colors}
   ${values}     get dictionary values    ${fruits_colors}

    WHILE    '${i}' != '0'
        IF  '${values[${i-1}]}' == 'green'
            append to list    ${new_list}    ${keys[${i-1}]}
        END
        ${i}    evaluate    ${i}-1
    END
        log to console      ${new_list}