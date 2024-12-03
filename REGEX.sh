#!/bin/bash

# Comprehensive Regex Masterclass: From Beginner to Advanced
# An immersive, interactive tutorial exploring the power of regular expressions

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
declare -A REGEX_MODULES=(
    ["basic_matching"]="Basic Pattern Matching"
    ["character_classes"]="Character Classes and Special Characters"
    ["quantifiers"]="Quantifiers and Repetition"
    ["anchors"]="Anchors and Boundaries"
    ["capturing_groups"]="Capturing Groups and Backreferences"
    ["lookaround"]="Advanced Lookahead and Lookbehind"
)

# Prepare Rich Learning Environment
prepare_learning_environment() {
    mkdir -p regex_masterclass
    cd regex_masterclass || exit 1

    # Comprehensive Text Datasets for Learning
    cat << EOF > sample_data.txt
John Doe, email: john.doe@example.com, Phone: (555) 123-4567
Jane Smith, email: jane_smith2023@gmail.com, Phone: 1-800-555-9876
Alice Johnson, email: alice.j@company.co.uk, Phone: +1 (987) 654-3210
Bob Williams, email: bob.w123@subdomain.example.org, Phone: 555.987.6543
Charlie Brown, email: charlie_brown@peanuts.net, Phone: (123) 456-7890
EOF

    cat << EOF > code_samples.txt
def validate_user(username):
    # Validate username format
    if re.match(r'^[a-z0-9_]{3,16}$', username):
        return True
    return False

class UserProfile:
    def __init__(self, email):
        # Complex email validation
        if re.match(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', email):
            self.email = email
        else:
            raise ValueError("Invalid email format")
EOF

    cat << EOF > log_data.txt
[2024-01-15 12:00:00] INFO: Application started
[2024-01-15 12:05:00] WARNING: High memory usage detected
[2024-01-15 12:10:00] ERROR: Database connection failed
[2024-01-15 12:15:00] CRITICAL: Security breach attempt
[2024-01-15 12:20:00] DEBUG: Memory allocation trace
EOF
}

# Interactive Regex Challenge Framework
interactive_regex_challenge() {
    local module="$1"
    local description="$2"
    local hint="$3"
    local regex_pattern="$4"
    local explanation="$5"
    local learning_tip="${6:-No additional tip}"

    # Display comprehensive module header
    echo -e "\n${BOLD}${BLUE}=== ${REGEX_MODULES[$module]} ===${NC}"
    echo -e "${YELLOW}Challenge Description:${NC} $description"
    echo -e "${PURPLE}Learning Objective:${NC} Master regex techniques"
    echo -e "${CYAN}Hint:${NC} $hint"
    
    while true; do
        read -p "${GREEN}Enter your regex pattern: ${NC}" user_pattern
        
        # Advanced validation 
        if [[ "$user_pattern" == "$regex_pattern"* ]]; then
            echo -e "${GREEN}✓ Excellent! Challenge completed successfully.${NC}"
            echo -e "${CYAN}Detailed Explanation:${NC} $explanation"
            echo -e "${YELLOW}Pro Learning Tip:${NC} $learning_tip"
            
            # Demonstrate matches
            echo -e "\n${BLUE}Matching Examples:${NC}"
            grep -E "$regex_pattern" sample_data.txt
            
            break
        else
            echo -e "${RED}✗ Not quite right. Refine your approach.${NC}"
            
            if [[ "$user_pattern" == "hint" ]]; then
                echo -e "${PURPLE}Comprehensive Hint:${NC} $regex_pattern"
            fi
        fi
    done
}

# Comprehensive Regex Learning Journey
regex_learning_journey() {
    echo -e "${BOLD}${BLUE}🚀 Regex Masterclass: Pattern Matching Expedition 🚀${NC}"
    
    # Module 1: Basic Pattern Matching
    interactive_regex_challenge "basic_matching" \
        "Extract full names from contact list" \
        "Look for words with capital letters" \
        "[A-Z][a-z]+ [A-Z][a-z]+" \
        "Matches names starting with capital letters, followed by lowercase" \
        "Capital letters at the start of words typically represent names"

    # Module 2: Character Classes and Special Characters
    interactive_regex_challenge "character_classes" \
        "Validate email addresses" \
        "Include username, @ symbol, domain, and top-level domain" \
        "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" \
        "Comprehensive email format validation including various characters" \
        "Email validation requires handling multiple character types"

    # Module 3: Quantifiers and Repetition
    interactive_regex_challenge "quantifiers" \
        "Match phone numbers in multiple formats" \
        "Handle different phone number representations" \
        "\(?[0-9]{3}\)?[-. ]?[0-9]{3}[-. ]?[0-9]{4}" \
        "Flexible phone number matching with optional formatting" \
        "Quantifiers help match variable-length patterns"

    # Module 4: Anchors and Boundaries
    interactive_regex_challenge "anchors" \
        "Extract log levels at the start of log entries" \
        "Match log levels only at the beginning of lines" \
        "^\\[.*\\] (INFO|WARNING|ERROR|CRITICAL|DEBUG):" \
        "Uses start of line (^) and specific log level matching" \
        "Anchors ensure precise matching context"

    # Module 5: Capturing Groups and Backreferences
    interactive_regex_challenge "capturing_groups" \
        "Reformat email addresses" \
        "Capture username and domain separately" \
        "([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+\\.[a-zA-Z]{2,})" \
        "Creates capturing groups to isolate email components" \
        "Capturing groups enable complex text transformations"

    # Module 6: Advanced Lookaround Techniques
    interactive_regex_challenge "lookaround" \
        "Find passwords with specific complexity" \
        "Require at least one uppercase, one lowercase, one number" \
        "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$" \
        "Uses positive lookaheads to enforce password complexity" \
        "Lookaround assertions provide powerful conditional matching"
}

# Regex Tool Demonstration
demonstrate_regex_tools() {
    echo -e "\n${BOLD}${GREEN}🛠️ Regex Tools and Techniques Showcase 🛠️${NC}"
    
    # Demonstrate grep regex capabilities
    echo -e "\n${YELLOW}1. Grep Regex Filtering:${NC}"
    echo "Extracting emails from sample data:"
    grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" sample_data.txt

    # Demonstrate sed text transformation
    echo -e "\n${YELLOW}2. Sed Regex Transformation:${NC}"
    echo "Masking phone numbers:"
    sed -E 's/\([0-9]{3}\) [0-9]{3}-[0-9]{4}/(\1) XXX-XXXX/' sample_data.txt

    # Demonstrate perl regex processing
    echo -e "\n${YELLOW}3. Perl Regex Processing:${NC}"
    echo "Complex log level extraction:"
    perl -ne 'print if /^\[.*\] (ERROR|CRITICAL):/' log_data.txt
}

# Learning Assessment and Reflection
regex_learning_assessment() {
    echo -e "\n${BOLD}${BLUE}🏆 Regex Mastery Assessment 🏆${NC}"
    echo -e "${CYAN}Congratulations on completing the Regex Masterclass!${NC}"
    echo -e "${PURPLE}Mastered Skills:${NC}"
    for module in "${!REGEX_MODULES[@]}"; do
        echo -e "• ${REGEX_MODULES[$module]}"
    done
    
    echo -e "\n${GREEN}Key Takeaways:${NC}"
    echo "1. Regex is a powerful tool for pattern matching and text processing"
    echo "2. Start simple and build complexity gradually"
    echo "3. Test your patterns thoroughly"
    echo "4. Use online regex testers for validation"
}

# Cleanup Function
cleanup() {
    cd ..
    rm -rf regex_masterclass
}

# Main Execution
main() {
    clear
    prepare_learning_environment
    regex_learning_journey
    demonstrate_regex_tools
    regex_learning_assessment
    cleanup
}

# Launch the Regex Masterclass
main