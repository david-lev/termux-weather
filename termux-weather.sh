#!/data/data/com.termux/files/usr/bin/bash

# Author: David Lev (github.com/david-lev)

# Variables
end='\e[0m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
dependencies=(curl jq termux-location)
timeout=10
run_on_termux=$(echo $PREFIX | grep -o "com.termux")
[[ ${1} == "--all" ]] && flags="?lang=${LANG/_*/}" || flags="?0"

# Functions
function check_dependencies() {
    [[ ${1} == "termux-location" ]] && pkg='termux-api' || pkg=${1}
    command -v ${1} >/dev/null 2>&1 || (echo -e "${red}The package ${1} is missing. Installing now...${end}\n" && apt install ${pkg} -y)
}
function get_termux_location() { 
    location_json=$(timeout ${timeout} termux-location) &&
    location="$(echo ${location_json} | jq -r '.latitude'),$(echo ${location_json} | jq -r '.longitude')" || get_location
}
function get_city() {
    echo -e "${yellow}Enter your city:${end}"
    while [[ -z ${location} ]]; do
        read location
    done
}
function get_location() {
    echo -e "${yellow}We can not identify your location, select one of the options:\n${green}1:${end} Use my IP address to locate my location (approximate) \n${green}2:${end} Let me enter city name mannualy. \n${green}3:${end} exit."
    while [[ ${choice} != @(1|2|3) ]]; do
        read choice
    done
    case ${choice} in
        1) location=$(curl -sS ipinfo.io/loc) ;;
        2) get_city ;;
        3) exit 1 ;;
    esac
}
function get_weather() {
    curl -sS --connect-timeout ${timeout} "https://wttr.in/${@/ /+}${flags}?Q?F"
}

# Checking dependencies:
for dep in ${dependencies[@]}; do
    [[ ${dep} == "termux-location" && ! ${run_on_termux} ]] || check_dependencies ${dep}
done

# Get weather info:
[[ ${run_on_termux} ]] && get_termux_location || get_location
echo
get_weather "${location}"
