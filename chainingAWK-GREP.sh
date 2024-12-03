#!/bin/bash

# Comprehensive Unix Command Chaining Masterclass
# A complete learning experience for text processing and data analysis

# Color Configuration for Enhanced Learning Experience
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly RED='\033[0;31m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'  # No Color

# Learning Modules and Objectives
declare -A LEARNING_MODULES=(
    ["filtering"]="Advanced Filtering Techniques"
    ["transformation"]="Data Transformation and Manipulation"
    ["analysis"]="Complex Data Analysis"
    ["reporting"]="Dynamic Reporting Strategies"
    ["performance"]="Performance Optimization"
    ["integration"]="Cross-Utility Integration"
)

# Comprehensive Dataset Preparation
prepare_learning_environment() {
    mkdir -p command_chaining_masterclass
    cd command_chaining_masterclass || exit 1

    # Comprehensive Sales Dataset
    cat << EOF > sales_data.csv
employee_id,name,department,region,sales_2022,sales_2023,commission_rate,hire_date
101,John Smith,Electronics,West,150000,175000,0.05,2019-03-15
102,Emily Davis,Clothing,East,120000,145000,0.04,2020-07-22
103,Michael Chen,Electronics,Central,180000,200000,0.06,2018-11-01
104,Sarah Johnson,Furniture,South,95000,110000,0.03,2021-01-10
105,David Kim,Clothing,North,135000,160000,0.04,2019-09-05
106,Lisa Wong,Marketing,West,110000,135000,0.035,2020-04-18
107,Robert Garcia,Sales,East,165000,190000,0.05,2017-12-03
108,Jennifer Lee,HR,West,85000,95000,0.02,2021-06-30
109,Alex Rodriguez,IT,Central,140000,165000,0.04,2019-02-14
110,Karen White,Finance,East,125000,140000,0.035,2020-11-22
EOF

    # Comprehensive System Logs
    cat << EOF > system_logs.txt
2024-01-15 12:00:00 [SERVER01] INFO: System startup completed
2024-01-15 12:05:00 [SERVER02] WARNING: High CPU usage detected (82%)
2024-01-15 12:10:00 [SERVER03] ERROR: Disk space critical (94% full)
2024-01-15 12:15:00 [SERVER01] CRITICAL: Potential security breach
2024-01-15 12:20:00 [SERVER04] INFO: Backup process initiated
2024-01-15 12:25:00 [SERVER02] WARNING: Memory utilization above 90%
2024-01-15 12:30:00 [SERVER03] ERROR: Network connectivity lost
EOF

    # Web Server Access Logs
    cat << EOF > access_logs.txt
192.168.1.100 - - [15/Jan/2024:12:00:00] "GET /admin/ HTTP/1.1" 403 Forbidden
10.0.0.55 - - [15/Jan/2024:12:05:00] "POST /login HTTP/1.1" 200 OK
172.16.0.25 - - [15/Jan/2024:12:10:00] "DELETE /user/sensitive HTTP/1.1" 500 Internal Server Error
192.168.1.101 - - [15/Jan/2024:12:15:00] "PUT /config HTTP/1.1" 401 Unauthorized
209.85.238.42 - - [15/Jan/2024:12:20:00] "GET /public/ HTTP/1.1" 200 OK
EOF

    # Performance Monitoring Data
    cat << EOF > system_metrics.txt
CPU_USAGE: 82% | Memory: 7.5GB/16GB | Disk: 94% full
CPU_USAGE: 75% | Memory: 6.2GB/16GB | Disk: 92% full
CPU_USAGE: 88% | Memory: 8.1GB/16GB | Disk: 95% full
CPU_USAGE: 65% | Memory: 5.5GB/16GB | Disk: 90% full
EOF
}

# Advanced Command Chaining Tutorial
demonstrate_command_chaining() {
    echo -e "${BLUE}=== Comprehensive Unix Command Chaining Masterclass ===${NC}"
    
    # Module 1: Advanced Filtering Techniques
    echo -e "\n${YELLOW}1. Advanced Filtering Techniques${NC}"
    echo -e "${GREEN}Scenario: Identify high-performing sales employees in the Electronics department${NC}"
    
    # Technique 1: Multi-step filtering and sorting
    echo -e "\n${CYAN}Command Breakdown:${NC}"
    echo "grep 'Electronics' sales_data.csv |     # Filter Electronics department"
    echo "awk -F',' '\$6 > 180000 {print \$2, \$6}' | # Extract names with 2023 sales > 180000"
    echo "sort -rn                              # Sort results in reverse numerical order"
    
    echo -e "\n${PURPLE}Execution Result:${NC}"
    grep 'Electronics' sales_data.csv | awk -F',' '$6 > 180000 {print $2, $6}' | sort -rn

    # Module 2: Data Transformation and Manipulation
    echo -e "\n${YELLOW}2. Data Transformation and Manipulation${NC}"
    echo -e "${GREEN}Scenario: Analyze department distribution and sales performance${NC}"
    
    echo -e "\n${CYAN}Advanced Transformation Pipeline:${NC}"
    echo "cat sales_data.csv |                  # Read sales data"
    echo "grep -v 'employee_id' |               # Remove header"
    echo "awk -F',' '{print \$3}' |             # Extract departments"
    echo "sort | uniq -c |                      # Count unique departments"
    echo "sort -rn                              # Sort by department count"
    
    echo -e "\n${PURPLE}Department Distribution:${NC}"
    cat sales_data.csv | grep -v 'employee_id' | awk -F',' '{print $3}' | sort | uniq -c | sort -rn

    # Module 3: Complex Log Analysis
    echo -e "\n${YELLOW}3. Complex Log Analysis${NC}"
    echo -e "${GREEN}Scenario: Identify and categorize system log events${NC}"
    
    echo -e "\n${CYAN}Log Analysis Pipeline:${NC}"
    echo "grep -E 'ERROR|CRITICAL' system_logs.txt |  # Find critical events"
    echo "awk '{print \$3, \$4}' |                    # Extract server and event type"
    echo "sort | uniq -c                              # Count unique events"
    
    echo -e "\n${PURPLE}Critical Event Summary:${NC}"
    grep -E 'ERROR|CRITICAL' system_logs.txt | awk '{print $3, $4}' | sort | uniq -c

    # Module 4: Performance Monitoring and Analysis
    echo -e "\n${YELLOW}4. Performance Monitoring and Analysis${NC}"
    echo -e "${GREEN}Scenario: Extract and analyze system resource utilization${NC}"
    
    echo -e "\n${CYAN}Performance Analysis Pipeline:${NC}"
    echo "cat system_metrics.txt |               # Read metrics"
    echo "sed 's/CPU_USAGE: //' |                # Remove CPU_USAGE label"
    echo "awk -F'%' '{print \$1}' |              # Extract CPU usage"
    echo "awk '{sum+= \$1; count++} END {print \"Average CPU Usage: \" sum/count \"%\"}'"
    
    echo -e "\n${PURPLE}CPU Utilization Analysis:${NC}"
    cat system_metrics.txt | sed 's/CPU_USAGE: //' | awk -F'%' '{print $1}' | awk '{sum+= $1; count++} END {print "Average CPU Usage: " sum/count "%"}'

    # Module 5: Security Log Analysis
    echo -e "\n${YELLOW}5. Security Log Analysis${NC}"
    echo -e "${GREEN}Scenario: Identify potential security incidents in access logs${NC}"
    
    echo -e "\n${CYAN}Security Incident Detection:${NC}"
    echo "cat access_logs.txt |                  # Read access logs"
    echo "grep -E '(403|401|500)' |              # Filter error/unauthorized access"
    echo "awk '{print \$1}' |                    # Extract IP addresses"
    echo "sort | uniq -c |                       # Count incidents per IP"
    echo "sort -rn                               # Sort by incident frequency"
    
    echo -e "\n${PURPLE}Potential Security Incidents:${NC}"
    cat access_logs.txt | grep -E '(403|401|500)' | awk '{print $1}' | sort | uniq -c | sort -rn

    # Module 6: Advanced Calculation and Reporting
    echo -e "\n${YELLOW}6. Advanced Calculation and Reporting${NC}"
    echo -e "${GREEN}Scenario: Calculate sales growth and identify top performers${NC}"
    
    echo -e "\n${CYAN}Sales Performance Analysis:${NC}"
    echo "awk -F',' 'NR>1 {                      # Skip header"
    echo "  growth=(\$6-\$5)/\$5*100;             # Calculate growth percentage"
    echo "  if(growth > 15) print \$2, sprintf(\"%.2f%%\", growth)   # Filter and format"
    echo "}' sales_data.csv |"
    echo "sort -rn                               # Sort by growth rate"
    
    echo -e "\n${PURPLE}Top Sales Growth Performers:${NC}"
    awk -F',' 'NR>1 {growth=($6-$5)/$5*100; if(growth > 15) print $2, sprintf("%.2f%%", growth)}' sales_data.csv | sort -rn
}

# Interactive Learning Assessment
interactive_learning_assessment() {
    echo -e "\n${BLUE}=== Command Chaining Mastery Assessment ===${NC}"
    echo -e "${YELLOW}Key Skills Mastered:${NC}"
    for module in "${!LEARNING_MODULES[@]}"; do
        echo -e "• ${LEARNING_MODULES[$module]}"
    done
    
    echo -e "\n${GREEN}Congratulations on completing the Command Chaining Masterclass!${NC}"
    echo -e "${PURPLE}Challenge yourself to create more complex pipelines that solve real-world data processing problems.${NC}"
}

# Cleanup Function
cleanup() {
    cd ..
    rm -rf command_chaining_masterclass
}

# Main Execution
main() {
    clear
    prepare_learning_environment
    demonstrate_command_chaining
    interactive_learning_assessment
    cleanup
}

# Launch the Command Chaining Tutorial
main