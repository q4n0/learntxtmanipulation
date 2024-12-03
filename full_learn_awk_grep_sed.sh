
#!/bin/bash

# Welcome Banner
echo "======================================"
echo "   Advanced AWK, GREP, SED Learning"
echo "    Ethical Hacking & Penetration"
echo "======================================"

# Sample Data for Practice
create_sample_file() {
  cat <<EOF > sample.txt
192.168.1.1 - User logged in
192.168.1.2 - Failed login attempt
email@example.com - Email detected
www.example.com - URL found
172.16.254.1 - User logged out
192.168.1.3 - Multiple failed attempts
127.0.0.1 - Localhost activity detected
EOF
}

# Log for Command Outputs
log_output() {
  mkdir -p logs
  local log_file="logs/output_$(date +%Y%m%d_%H%M%S).log"
  echo "$1" >> "$log_file"
  echo "Output saved to $log_file"
}

# Learning Modules
learn_awk() {
  echo "== AWK Basics =="
  echo "1. Print all lines: awk '{print}' sample.txt"
  echo "2. Print first column: awk '{print $1}' sample.txt"
  echo "3. Filter lines with keyword 'Failed': awk '/Failed/ {print $0}' sample.txt"
  echo "4. Count occurrences: awk '{count[$1]++} END {for (ip in count) print ip, count[ip]}' sample.txt"
  create_sample_file
  read -p "Enter an AWK command to try: " awk_cmd
  echo "Running: $awk_cmd sample.txt"
  result=$(eval "$awk_cmd sample.txt")
  echo "$result"
  log_output "$result"
}

learn_grep() {
  echo "== GREP Basics =="
  echo "1. Search for text 'login': grep 'login' sample.txt"
  echo "2. Regex for IPs: grep -E '\b[0-9]{1,3}(\.[0-9]{1,3}){3}\b' sample.txt"
  echo "3. Search case-insensitively for 'email': grep -i 'email' sample.txt"
  create_sample_file
  read -p "Enter a GREP command to try: " grep_cmd
  echo "Running: $grep_cmd sample.txt"
  result=$(eval "$grep_cmd sample.txt")
  echo "$result"
  log_output "$result"
}

learn_sed() {
  echo "== SED Basics =="
  echo "1. Replace 'login' with 'access': sed 's/login/access/g' sample.txt"
  echo "2. Delete lines containing 'Failed': sed '/Failed/d' sample.txt"
  echo "3. Print lines 2 to 4: sed -n '2,4p' sample.txt"
  create_sample_file
  read -p "Enter a SED command to try: " sed_cmd
  echo "Running: $sed_cmd sample.txt"
  result=$(eval "$sed_cmd sample.txt")
  echo "$result"
  log_output "$result"
}

regex_playground() {
  echo "== Regex Playground =="
  echo "Enter a regex pattern to test (e.g., '\b[0-9]{1,3}(\.[0-9]{1,3}){3}\b' for IPs):"
  read -p "Regex: " regex
  echo "Enter text to test the regex against:"
  read -p "Text: " text
  echo "Results:"
  result=$(echo "$text" | grep -E "$regex")
  echo "$result"
  log_output "$result"
}

# Advanced Use Case Scenarios
use_cases() {
  create_sample_file
  echo "== Advanced Scenarios =="
  echo "1. Extract IPs from sample.txt: grep -oE '\b[0-9]{1,3}(\.[0-9]{1,3}){3}\b' sample.txt"
  echo "2. Extract failed logins: grep 'Failed' sample.txt | awk '{print $1, $2}'"
  echo "3. Replace 'User' with 'Client': sed 's/User/Client/g' sample.txt"
  echo ""
  read -p "Choose a scenario to run (1-3): " scenario
  case $scenario in
    1) cmd="grep -oE '\b[0-9]{1,3}(\.[0-9]{1,3}){3}\b' sample.txt";;
    2) cmd="grep 'Failed' sample.txt | awk '{print $1, $2}'";;
    3) cmd="sed 's/User/Client/g' sample.txt";;
    *) echo "Invalid choice"; return;;
  esac
  echo "Running: $cmd"
  result=$(eval "$cmd")
  echo "$result"
  log_output "$result"
}

# Menu Function
show_menu() {
  echo ""
  echo "Main Menu:"
  echo "1. Learn AWK"
  echo "2. Learn GREP"
  echo "3. Learn SED"
  echo "4. Regex Playground"
  echo "5. Advanced Use Cases"
  echo "6. Exit"
  echo ""
  read -p "Enter your choice [1-6]: " choice
}

# Main Loop
while true; do
  show_menu
  case $choice in
    1) learn_awk;;
    2) learn_grep;;
    3) learn_sed;;
    4) regex_playground;;
    5) use_cases;;
    6) echo "Exiting..."; exit 0;;
    *) echo "Invalid option. Please try again." ;;
  esac
done
