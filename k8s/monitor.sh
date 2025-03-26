#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Function to print section headers
print_header() {
    echo -e "\n${GREEN}=== $1 ===${NC}\n"
}

# Function to get pod status
get_pod_status() {
    print_header "Pod Status"
    kubectl get pods -o wide
}

# Function to get HPA status
get_hpa_status() {
    print_header "HPA Status"
    kubectl get hpa
}

# Function to get service status
get_service_status() {
    print_header "Service Status"
    kubectl get svc
}

# Function to get ingress status
get_ingress_status() {
    print_header "Ingress Status"
    kubectl get ingress
}

# Function to get pod logs
get_pod_logs() {
    print_header "Pod Logs"
    for pod in $(kubectl get pods -l app=url-shortener -o jsonpath='{.items[*].metadata.name}'); do
        echo -e "\n${YELLOW}Logs for pod: $pod${NC}"
        kubectl logs $pod --tail=50
    done
}

# Function to get resource usage
get_resource_usage() {
    print_header "Resource Usage"
    kubectl top pods
}

# Function to run stress test
run_stress_test() {
    print_header "Running Stress Test"
    echo "Starting stress test with 100 concurrent requests..."
    
    # Get the service URL
    SERVICE_URL=$(minikube service url-shortener --url)
    
    # Run stress test using hey
    hey -n 1000 -c 100 $SERVICE_URL
    
    echo -e "\n${YELLOW}Stress test completed. Check the results above.${NC}"
}

# Main menu
while true; do
    echo -e "\n${GREEN}URL Shortener Monitoring Menu${NC}"
    echo "1. Show Pod Status"
    echo "2. Show HPA Status"
    echo "3. Show Service Status"
    echo "4. Show Ingress Status"
    echo "5. Show Pod Logs"
    echo "6. Show Resource Usage"
    echo "7. Run Stress Test"
    echo "8. Show All"
    echo "9. Exit"
    
    read -p "Select an option (1-9): " choice
    
    case $choice in
        1) get_pod_status ;;
        2) get_hpa_status ;;
        3) get_service_status ;;
        4) get_ingress_status ;;
        5) get_pod_logs ;;
        6) get_resource_usage ;;
        7) run_stress_test ;;
        8)
            get_pod_status
            get_hpa_status
            get_service_status
            get_ingress_status
            get_resource_usage
            ;;
        9) exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    
    echo -e "\nPress Enter to continue..."
    read
done 