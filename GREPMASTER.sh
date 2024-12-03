#!/bin/bash

# Advanced Grep Mastery: An Immersive Text Search Learning Experience
# 
# This comprehensive tutorial transforms grep from a simple command 
# into a powerful text processing and analysis tool. By providing 
# progressively challenging exercises, learners will develop deep 
# understanding of pattern matching, regular expressions, and 
# advanced search techniques.

# Enhanced Color and Styling Configuration
# Creates a rich, visually engaging learning environment
readonly BOLD='\033[1m'
readonly UNDERLINE='\033[4m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;94m'
readonly RED='\033[0;91m'
readonly PURPLE='\033[0;95m'
readonly CYAN='\033[0;96m'
readonly NC='\033[0m'  # No Color (reset)

# Comprehensive Unicode Symbols for Enhanced Feedback
readonly CHECKMARK='✓'
readonly CROSS='✗'
readonly LIGHTBULB='💡'
readonly ROCKET='🚀'
readonly SPARKLE='✨'

# Learning Modules and Progress Tracking
# Defines structured learning progression with tracked modules
declare -A LEARNING_MODULES=(
    ["basic_search"]="Basic Pattern Matching"
    ["regex_fundamentals"]="Regular Expression Mastery"
    ["context_search"]="Context-Based Searching"
    ["advanced_filtering"]="Advanced Text Filtering"
    ["log_analysis"]="Log File Investigation"
    ["performance_techniques"]="Grep Performance Optimization"
)

# Prepare Rich Learning Environment
# Creates diverse, realistic datasets for comprehensive learning
prepare_learning_environment() {
    mkdir -p grep_advanced_tutorial
    cd grep_advanced_tutorial || exit 1

    # Comprehensive System Log Dataset
    cat << EOF > system_comprehensive_log.txt
2024-01-15 12:00:00 [SERVER01] INFO: System initialization complete
2024-01-15 12:05:00 [SERVER02] WARNING: High CPU utilization detected (82%)
2024-01-15 12:10:00 [SERVER03] ERROR: Disk space critical - 94% full
2024-01-15 12:15:00 [SERVER01] CRITICAL: Potential security breach detected
2024-01-15 12:20:00 [SERVER04] DEBUG: Memory allocation trace initiated
2024-01-15 12:25:00 [SERVER02] NOTICE: Automated mitigation started
EOF

    # Complex Source Code for Advanced Searching
    cat << EOF > complex_codebase.py
class DatabaseManager:
    def __init__(self, connection_string):
        # Initialize database connection
        self.connection = self._establish_connection(connection_string)
    
    def _establish_connection(self, connection_string):
        try:
            # Attempt secure connection
            connection = secure_connect(connection_string)
            if not connection:
                log_error("Connection initialization failed")
                return None
            return connection
        except ConnectionError as e:
            log_critical(f"Secure connection error: {e}")
            return None

def process_user_data(user_id, data):
    # Complex data processing function
    if validate_user(user_id):
        encrypted_data = encrypt_data(data)
        return store_encrypted_data(encrypted_data)
    return False
EOF

    # Diverse Text File for Pattern Matching
    cat << EOF > multidomain_text.txt
Python is an amazing programming language with powerful libraries.
Java remains popular in enterprise software development.
JavaScript dominates web front-end technologies.
C++ provides low-level system programming capabilities.
Rust is gaining traction for systems programming and safety.
Go is excellent for concurrent and distributed systems.
Grep is a powerful text search utility in Unix/Linux environments.
The quick brown fox demonstrates regex pattern matching techniques.
EOF

    # Comprehensive Access Log for Security Analysis
    cat << EOF > security_access_log.txt
192.168.1.100 - - [15/Jan/2024:12:00:00] "GET /admin/ HTTP/1.1" 403 Forbidden
10.0.0.55 - - [15/Jan/2024:12:05:00] "POST /login HTTP/1.1" 200 OK
172.16.0.25 - - [15/Jan/2024:12:10:00] "DELETE /user/sensitive HTTP/1.1" 500 Internal Server Error
192.168.1.101 - - [15/Jan/2024:12:15:00] "PUT /config HTTP/1.1" 401 Unauthorized
EOF
}

# Enhanced Interactive Challenge Framework
# Provides an adaptive, educational approach to learning grep
interactive_challenge() {
    local module="$1"
    local description="$2"
    local hint="$3"
    local correct_command="$4"
    local explanation="$5"
    local learning_tip="${6:-No additional learning tip}"

    # Display comprehensive module header
    echo -e "\n${BOLD}${BLUE}=== ${LEARNING_MODULES[$module]} ===${NC}"
    echo -e "${YELLOW}Challenge Description:${NC} $description"
    echo -e "${PURPLE}Learning Objective:${NC} Master advanced grep techniques"
    echo -e "${LIGHTBULB} ${CYAN}Hint:${NC} $hint"
    
    while true; do
        read -p "${GREEN}Enter your grep command: ${NC}" user_command
        
        # Advanced validation with multiple solution paths
        if [[ "$user_command" == "$correct_command"* ]]; then
            echo -e "${GREEN}${CHECKMARK} Excellent! Challenge completed successfully.${NC}"
            echo -e "${CYAN}Detailed Explanation:${NC} $explanation"
            echo -e "${YELLOW}Pro Learning Tip:${NC} $learning_tip"
            
            # Demonstrate flexibility in problem-solving
            if [[ "$user_command" != "$correct_command" ]]; then
                echo -e "${BLUE}Alternative Solution Detected: Creative problem-solving!${NC}"
            fi
            
            break
        else
            echo -e "${RED}${CROSS} Not quite right. Refine your approach.${NC}"
            
            if [[ "$user_command" == "hint" ]]; then
                echo -e "${PURPLE}Comprehensive Hint:${NC} $correct_command"
            fi
        fi
    done
}

# Advanced Grep Learning Journey
# Orchestrates a comprehensive, multi-module learning experience
advanced_grep_learning_journey() {
    echo -e "${BOLD}${ROCKET} Advanced Grep Mastery: Text Search Expedition ${ROCKET}${NC}"
    echo -e "Prepare for an immersive journey through grep's powerful text processing capabilities!\n"

    # Module 1: Basic Pattern Matching
    interactive_challenge "basic_search" \
        "Locate lines containing critical system events" \
        "Search for 'CRITICAL' or 'ERROR' in system logs" \
        "grep -E 'CRITICAL|ERROR' system_comprehensive_log.txt" \
        "Demonstrates multi-pattern search using extended regex, finding significant system events" \
        "Extended regex (-E) enables powerful, flexible pattern matching"

    # Module 2: Regular Expression Fundamentals
    interactive_challenge "regex_fundamentals" \
        "Extract programming language references" \
        "Use regex to find lines mentioning specific programming paradigms" \
        "grep -E 'programming|libraries' multidomain_text.txt" \
        "Showcases how regex can extract contextually related content" \
        "Regular expressions transform simple searches into intelligent text mining"

    # Module 3: Context-Based Searching
    interactive_challenge "context_search" \
        "Display lines around critical code segments" \
        "Find connection-related code with surrounding context" \
        "grep -A 3 -B 2 'connection' complex_codebase.py" \
        "Illustrates context retrieval: -A (after) and -B (before) flags provide code context" \
        "Context flags help understand code structure and relationship between lines"

    # Module 4: Advanced Filtering
    interactive_challenge "advanced_filtering" \
        "Identify unauthorized access attempts" \
        "Filter access log for specific HTTP response codes" \
        "grep ' 4[0-9][0-9] ' security_access_log.txt" \
        "Uses regex to match client error responses (400-499 range)" \
        "Demonstrates how regex can create sophisticated filtering mechanisms"

    # Module 5: Log File Investigation
    interactive_challenge "log_analysis" \
        "Extract unique IP addresses from access logs" \
        "Find distinct client IP addresses" \
        "grep -oE '^[0-9.]+' security_access_log.txt | sort -u" \
        "Combines grep's pattern extraction with sorting to get unique IPs" \
        "Transforms log analysis into actionable security intelligence"

    # Module 6: Performance Optimization
    interactive_challenge "performance_techniques" \
        "Efficiently search large text files" \
        "Demonstrate fast, memory-efficient searching" \
        "grep -F 'Python' multidomain_text.txt" \
        "Fixed string search (-F) provides faster matching for literal strings" \
        "Performance techniques crucial for processing extensive datasets"

    # Comprehensive Learning Assessment
    echo -e "\n${BOLD}${BLUE}🏆 Grep Mastery Assessment 🏆${NC}"
    echo -e "${CYAN}Congratulations on completing the Advanced Grep Expedition!${NC}"
    echo -e "${PURPLE}Mastered Skills:${NC}"
    for module in "${!LEARNING_MODULES[@]}"; do
        echo -e "• ${LEARNING_MODULES[$module]}"
    done
}

# Cleanup Function
cleanup() {
    cd ..
    rm -rf grep_advanced_tutorial
}

# Main Execution
main() {
    clear
    prepare_learning_environment
    advanced_grep_learning_journey
    cleanup
}

# Launch the Advanced Grep Tutorial
main