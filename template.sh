#!/bin/bash

read -p "Please provide filename you want to create: " file
read -p "Please provide purpose: " purpose

read -p "Please select a programming language (bash/c/python/html/js): " language

file_path="/home/zawwanz/Templates/SUBL/$file"

case $language in
    bash)
        file_path="$file_path.sh"
        cat << EOF > "$file_path"
#!/bin/bash
# Script		: $file.sh
# Author		: Zaw Wanz
# Purpose		: $purpose
# Version		: 1.0.0
# Created Date	: $(date)
#Modified Date: 

# Your Bash code here

EOF
        ;;
    c)
        file_path="$file_path.c"
        header_guard=$(echo "$file" | tr '[:lower:]' '[:upper:]')"_H"
        cat << EOF > "$file_path"
/*
 * File         : $file.c
 * Author       : Your Name
 * Purpose      : $purpose
 * Version      : 1.0.0
 * Created Date : $(date)
 * Modified Date: 
 */

#ifndef $header_guard
#define $header_guard

#include <stdio.h>

// Function declarations or additional headers go here

#endif // $header_guard

int main() {
    // Main function code

    return 0;
}
EOF
        ;;
    python)
        file_path="$file_path.py"
        cat << EOF > "$file_path"
"""
File         : $file.py
Author       : Your Name
Purpose      : $purpose
Version      : 1.0.0
Created Date : $(date)
Modified Date: 
"""

def main():
    # Your Python code here

if __name__ == "__main__":
    main()
EOF
        ;;
    html)
        file_path="$file_path.html"
        cat << EOF > "$file_path"
<!--
File         : $file.html
Author       : Your Name
Purpose      : $purpose
Version      : 1.0.0
Created Date : $(date)
Modified Date: 
-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$file</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Your HTML content here -->

    <script src="script.js"></script>
</body>
</html>
EOF
        ;;
    js)
        file_path="$file_path.js"
        cat << EOF > "$file_path"
/*
 * File         : $file.js
 * Author       : Your Name
 * Purpose      : $purpose
 * Version      : 1.0.0
 * Created Date : $(date)
 * Modified Date: 
 */

// Your JavaScript code here
EOF
        ;;
    *)
        echo "Invalid programming language selected."
        exit 1
        ;;
esac

subl "$file_path"

