#!/bin/bash

# Advanced AWK Mastery: A Comprehensive Text Processing Learning Journey
# 
# This enhanced script provides an immersive, multi-stage learning experience
# for mastering AWK, covering everything from basic text processing to 
# advanced data manipulation techniques.

# Color Palette for Enhanced Learning Experience
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly RED='\033[0;31m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'

# Advanced Learning Configuration
declare -A LEARNING_MODULES=(
    ["basic_processing"]="Basic Text Processing"
    ["data_extraction"]="Advanced Data Extraction"
    ["transformation"]="Data Transformation Techniques"
    ["reporting"]="Complex Reporting"
    ["regex_processing"]="Regular Expression Mastery"
    ["advanced_techniques"]="Advanced AWK Techniques"
)

# Prepare Comprehensive Learning Environment
prepare_learning_environment() {
    mkdir -p awk_advanced_tutorial
    cd awk_advanced_tutorial || exit 1

    # Expanded and more complex learning materials

    # Comprehensive Sales Dataset
    cat << EOF > comprehensive_sales.csv
employee_id,name,department,region,sales_2022,sales_2023,commission_rate,hire_date
101,John Smith,Electronics,West,150000,175000,0.05,2019-03-15
102,Emily Davis,Clothing,East,120000,145000,0.04,2020-07-22
103,Michael Chen,Electronics,Central,180000,200000,0.06,2018-11-01
104,Sarah Johnson,Furniture,South,95000,110000,0.03,2021-01-10
105,David Kim,Clothing,North,135000,160000,0.04,2019-09-05
106,Lisa Wong,Marketing,West,110000,135000,0.035,2020-04-18
107,Robert Garcia,Sales,East,165000,190000,0.05,2017-12-03
EOF

    # Comprehensive System Logs with Multiple Log Types
    cat << EOF > system_logs_extended.txt
2024-01-15 12:00:00 SERVER01 INFO: System startup
2024-01-15 12:05:00 SERVER02 WARNING: High CPU usage (82%)
2024-01-15 12:10:00 SERVER03 ERROR: Disk space critical (94% full)
2024-01-15 12:15:00 SERVER01 CRITICAL: Potential security breach
2024-01-15 12:20:00 SERVER04 INFO: Backup process initiated
2024-01-15 12:25:00 SERVER02 WARNING: Memory utilization above 90%
EOF

    # Complex Employee Records with Multiple Attributes
    cat << EOF > employee_records_advanced.txt
Name: Alice Johnson, Role: Senior Software Engineer, Salary: 95000, Department: Engineering, Skills: Python,Java,Docker
Name: Bob Williams, Role: Marketing Manager, Salary: 92000, Department: Marketing, Skills: SEO,Analytics,CRM
Name: Charlie Brown, Role: Data Analyst, Salary: 78000, Department: Analytics, Skills: SQL,R,Machine Learning
Name: David Miller, Role: Product Manager, Salary: 110000, Department: Product, Skills: Agile,Scrum,Product Strategy
EOF

    # Advanced Log Analysis Sample
    cat << EOF > application_logs.log
[2024-01-15 10:15:32] INFO user_login successful user=jsmith123 ip=192.168.1.100
[2024-01-15 10:16:45] WARN password_attempt_failed user=bwilliams attempts=3 ip=10.0.0.55
[2024-01-15 10:17:12] ERROR database_connection_error service=user_management database=primary_db
[2024-01-15 10:18:03] INFO user_logout successful user=cbrowndata ip=172.16.0.25
EOF
}

# Enhanced Interactive Challenge Framework
interactive_challenge() {
    local module="$1"
    local description="$2"
    local hint="$3"
    local correct_command="$4"
    local explanation="$5"
    local learning_tip="${6:-No additional tip}"

    # Display module header
    echo -e "\n${BLUE}=== ${LEARNING_MODULES[$module]} ===${NC}"
    echo -e "${YELLOW}Challenge:${NC} $description"
    echo -e "${PURPLE}Hint:${NC} $hint"
    
    while true; do
        read -p "${GREEN}Enter your AWK command: ${NC}" user_command
        
        # Advanced validation with multiple solution support
        if [[ "$user_command" == "$correct_command"* ]]; then
            echo -e "${GREEN}✓ Excellent! Challenge completed.${NC}"
            echo -e "${CYAN}Explanation:${NC} $explanation"
            echo -e "${YELLOW}Learning Tip:${NC} $learning_tip"
            
            # Optional: Demonstrate alternative solutions
            if [[ "$user_command" != "$correct_command" ]]; then
                echo -e "${BLUE}Note: You used a valid alternative approach!${NC}"
            fi
            
            break
        else
            echo -e "${RED}❌ Not quite right. Try again or type 'hint' for help.${NC}"
            
            if [[ "$user_command" == "hint" ]]; then
                echo -e "${YELLOW}Detailed Hint:${NC} $correct_command"
            fi
        fi
    done
}

# Advanced AWK Learning Journey
advanced_awk_learning_journey() {
    echo -e "${BLUE}=== Advanced AWK Mastery: Text Processing Expedition ===${NC}"
    echo -e "Prepare for an immersive journey through AWK's powerful text processing capabilities!\n"

    # Module 1: Basic Text Processing Fundamentals
    interactive_challenge "basic_processing" \
        "Extract employee names from comprehensive sales data" \
        "Use -F to set field separator, print specific columns" \
        "awk -F',' '{print \$2, \$4}' comprehensive_sales.csv" \
        "Demonstrates field extraction with multiple columns, showing name and region" \
        "Pro Tip: AWK allows flexible field selection and combination"

    # Module 2: Advanced Data Extraction
    interactive_challenge "data_extraction" \
        "Filter and display employees with sales growth over 20%" \
        "Calculate sales growth and filter based on percentage" \
        "awk -F',' 'NR>1 {growth=(\$6-\$5)/\$5*100; if(growth > 20) print \$2, sprintf(\"%.2f%%\", growth)}' comprehensive_sales.csv" \
        "Uses conditional processing to extract high-performing employees" \
        "Learn to combine calculations with filtering in a single command"

    # Module 3: Data Transformation Techniques
    interactive_challenge "transformation" \
        "Calculate total and average sales by department" \
        "Use associative arrays for aggregation" \
        "awk -F',' 'NR>1 {dept_sales[\$3] += \$6; dept_count[\$3]++} END {for (dept in dept_sales) printf \"%s: Total $%d, Average $%.2f\n\", dept, dept_sales[dept], dept_sales[dept]/dept_count[dept]}' comprehensive_sales.csv" \
        "Demonstrates complex aggregation and reporting in a single pass" \
        "Associative arrays are powerful for summarizing data"

    # Module 4: Log Processing and Analysis
    interactive_challenge "reporting" \
        "Extract and count different log levels from system logs" \
        "Use regular expressions and counting techniques" \
        "awk '{level[$5]++} END {for (l in level) print l \": \" level[l]}' system_logs_extended.txt" \
        "Shows how to count occurrences of different log levels" \
        "Regular expressions and counting are key to log analysis"

    # Module 5: Advanced Regular Expression Processing
    interactive_challenge "regex_processing" \
        "Extract and list unique employee skills" \
        "Use split() and associative arrays with regex" \
        "awk -F', ' '{split(\$5, skills, \": \"); split(skills[2], skill_list, \",\"); for (s in skill_list) skills_set[skill_list[s]]++} END {for (skill in skills_set) print skill}' employee_records_advanced.txt" \
        "Demonstrates complex text parsing and skill extraction" \
        "Regular expressions enable sophisticated text manipulation"

    # Module 6: Advanced Techniques
    interactive_challenge "advanced_techniques" \
        "Process application logs to generate security report" \
        "Extract and analyze login/logout and error events" \
        "awk '/user_login|user_logout|ERROR/ {print \$0}' application_logs.log" \
        "Powerful log filtering and security event tracking" \
        "Combine regex and field processing for comprehensive analysis"

    # Final Learning Assessment
    echo -e "\n${BLUE}🏆 AWK Mastery Assessment 🏆${NC}"
    echo -e "${CYAN}You've completed an advanced exploration of AWK's capabilities!${NC}"
    echo -e "${PURPLE}Key Skills Mastered:${NC}"
    for module in "${!LEARNING_MODULES[@]}"; do
        echo -e "• ${LEARNING_MODULES[$module]}"
    done
}

# Cleanup Function
cleanup() {
    cd ..
    rm -rf awk_advanced_tutorial
}

# Main Execution
main() {
    clear
    prepare_learning_environment
    advanced_awk_learning_journey
    cleanup
}

# Launch the Advanced AWK Tutorial
main