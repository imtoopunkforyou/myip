#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'
BOLD_GREEN="\u001b[1;32m"
RESET="\u001b[0m"

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

if ! command -v jq &> /dev/null; then
    error "jq is not installed but required. Please install it first."
    exit 1
fi

show_header() {
    echo "┌─────────────────────────────┐"
    echo "│       IP Information        │"
    echo "└─────────────────────────────┘"
}

main() {
    local response
    response=$(curl --silent --show-error --location --header 'Accept: application/json' --request GET 'ipinfo.io')
        
    if [ $? -ne 0 ]; then
        error "Failed to fetch IP information"
        exit 1
    fi

    show_header
    
    echo "$response" | jq --color-output -r "
\"${BOLD_GREEN}IP:           ${RESET}\(.ip)
${BOLD_GREEN}Hostname:     ${RESET}\(.hostname)
${BOLD_GREEN}City:         ${RESET}\(.city)
${BOLD_GREEN}Region:       ${RESET}\(.region)
${BOLD_GREEN}Country:      ${RESET}\(.country) (\(.loc))
${BOLD_GREEN}Postal Code:  ${RESET}\(.postal)
${BOLD_GREEN}Organization: ${RESET}\(.org)\""
}

main