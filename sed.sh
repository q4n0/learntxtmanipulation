#!/bin/bash

# Comprehensive SED Masterclass: From Beginner to Advanced
# An immersive, interactive tutorial exploring the power of stream editing

# Enhanced Color Configuration
readonly BOLD='\033[1m'
readonly UNDERLINE='\033[4m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly RED='\033[0;31m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'  # No Color

# Learning Modules and Progression
declare -A SED_MODULES=(
    ["basic_substitution"]="Basic Text Substitution"
    ["address_selection"]="Line Address and Range Selection"
    ["advanced_substitution"]="Advanced Substitution Techniques"
    ["text_transformation"]="Complex Text Transformation"
    ["scripting_integration"]="Scripting and Workflow Integration"
    ["regex_manipulation"]="Regular Expression Manipulation"
)

# Prepare Rich Learning Environment
prepare_learning_environment() {
    mkdir -p sed_masterclass
    cd sed_masterclass || exit 1

    # Comprehensive Datasets for Learning
    cat << EOF > sample_code.txt
def process_user_data(user_id, name, email):
    # Validate user information
    if not validate_email(email):
        print("Invalid email address")
        return False
    
    user = User(user_id, name, email)
    return user.save()

class UserManager:
    def __init__(self, database):
        self.db = database
    
    def create_user(self, username, email):
        # User creation logic
        pass
EOF

    cat << EOF > log_data.txt
2024-01-15 12:00:00 [INFO] Server started successfully
2024-01-15 12:05:00 [WARNING] High memory usage detected: 85%
2024-01-15 12:10:00 [ERROR] Database connection failed
2024-01-15 12:15:00 [CRITICAL] Security breach detected
2024-01-15 12:20:00 [DEBUG] Memory allocation trace initiated
EOF

    cat << EOF > user_data.csv
user_id,username,email,registration_date
1001,john_doe,john.doe@example.com,2023-05-15
1002,jane_smith,jane.smith@gmail.com,2023-06-20
1003,alice_wonder,alice.w@company.org,2023-07-10
1004,bob_builder,bob.builder@construction.net,2023-08-05
1005,charlie_brown,charlie@peanuts.com,2023-09-12
EOF
}

# Interactive SED Challenge Framework
interactive_sed_challenge() {
    local module="$1"
    local description="$2"
    local hint="$3"
    local correct_command="$4"
    local explanation="$5"
    local learning_tip="${6:-No additional tip}"

    # Display comprehensive module header
    echo -e "\n${BOLD}${BLUE}=== ${SED_MODULES[$module]} ===${NC}"
    echo -e "${YELLOW}Challenge Description:${NC} $description"
    echo -e "${PURPLE}Learning Objective:${NC} Master SED text manipulation"
    echo -e "${CYAN}Hint:${NC} $hint"
    
    while true; do
        read -p "${GREEN}Enter your SED command: ${NC}" user_command
        
        # Advanced validation 
        if [[ "$user_command" == "$correct_command"* ]]; then
            echo -e "${GREEN}✓ Excellent! Challenge completed successfully.${NC}"
            echo -e "${CYAN}Detailed Explanation:${NC} $explanation"
            echo -e "${YELLOW}Pro Learning Tip:${NC} $learning_tip"
            
            # Demonstrate command result
            echo -e "\n${BLUE}Command Output:${NC}"
            eval "$user_command"
            
            break
        else
            echo -e "${RED}✗ Not quite right. Refine your approach.${NC}"
            
            if [[ "$user_pattern" == "hint" ]]; then
                echo -e "${PURPLE}Comprehensive Hint:${NC} $correct_command"
            fi
        fi
    done
}

# Comprehensive SED Learning Journey
sed_learning_journey() {
    echo -e "${BOLD}${BLUE}🚀 SED Masterclass: Stream Editing Expedition 🚀${NC}"
    
    # Module 1: Basic Text Substitution
    interactive_sed_challenge "basic_substitution" \
        "Replace function names in code" \
        "Use simple text substitution" \
        "sed 's/process_user_data/process_customer_data/' sample_code.txt" \
        "Demonstrates basic text replacement using SED" \
        "Substitution is the most fundamental SED operation"

    # Module 2: Line Address and Range Selection
    interactive_sed_challenge "address_selection" \
        "Edit specific lines in log files" \
        "Target lines containing specific log levels" \
        "sed -n '/\[ERROR\]/p' log_data.txt" \
        "Uses line selection and print flag to extract error logs" \
        "SED can target specific lines using patterns and ranges"

    # Module 3: Advanced Substitution Techniques
    interactive_sed_challenge "advanced_substitution" \
        "Mask sensitive information in user data" \
        "Replace email domains with asterisks" \
        "sed -E 's/(@)[^,]+/\1*****/g' user_data.csv" \
        "Demonstrates complex substitution with regex capture groups" \
        "Regular expressions enhance SED's text manipulation power"

    # Module 4: Text Transformation
    interactive_sed_challenge "text_transformation" \
        "Transform log timestamp format" \
        "Convert timestamp to a different format" \
        "sed -E 's/([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\2 on \1/' log_data.txt" \
        "Rearranges and reformats timestamp using capture groups" \
        "SED can perform complex text restructuring"

    # Module 5: Scripting and Workflow Integration
    interactive_sed_challenge "scripting_integration" \
        "Batch process multiple files" \
        "Replace debug flags in multiple source files" \
        "find . -name '*.txt' -exec sed -i 's/\[DEBUG\]/[INFO]/g' {} \;" \
        "Demonstrates integration with find for batch processing" \
        "SED excels in automated text processing workflows"

    # Module 6: Regular Expression Manipulation
    interactive_sed_challenge "regex_manipulation" \
        "Extract and transform email usernames" \
        "Pull usernames before @ symbol" \
        "sed -nE 's/.*,([^,@]+)@.*/\1/p' user_data.csv" \
        "Uses complex regex to extract specific text segments" \
        "Regex capabilities make SED a powerful text processing tool"
}

# SED Tool Advanced Techniques Demonstration
demonstrate_sed_tools() {
    echo -e "\n${BOLD}${GREEN}🛠️ SED Advanced Techniques Showcase 🛠️${NC}"
    
    # In-place file editing
    echo -e "\n${YELLOW}1. In-Place File Editing:${NC}"
    cp user_data.csv user_data_backup.csv
    sed -i 's/company\.org/enterprise.org/' user_data.csv
    echo "Modified company domain in user data"

    # Multi-line text processing
    echo -e "\n${YELLOW}2. Multi-line Text Processing:${NC}"
    sed -n '/def/,/^$/p' sample_code.txt
}

# Learning Assessment and Reflection
sed_learning_assessment() {
    echo -e "\n${BOLD}${BLUE}🏆 SED Mastery Assessment 🏆${NC}"
    echo -e "${CYAN}Congratulations on completing the SED Masterclass!${NC}"
    echo -e "${PURPLE}Mastered Skills:${NC}"
    for module in "${!SED_MODULES[@]}"; do
        echo -e "• ${SED_MODULES[$module]}"
    done
    
    echo -e "\n${GREEN}Key Takeaways:${NC}"
    echo "1. SED is a powerful stream editor for text transformation"
    echo "2. Regular expressions significantly extend SED's capabilities"
    echo "3. Practice and experimentation are key to mastery"
    echo "4. Always be cautious with in-place file editing"
}

# Cleanup Function
cleanup() {
    cd ..
    rm -rf sed_masterclass
}

# Main Execution
main() {
    clear
    prepare_learning_environment
    sed_learning_journey
    demonstrate_sed_tools
    sed_learning_assessment
    cleanup
}

# Launch the SED Masterclass
main